use anyhow::{anyhow, Context, Result};
use cargo_metadata::Message;
use once_cell::sync::Lazy;
use std::env::{self, args, var};
use std::fs;
use std::os::fd::FromRawFd;
use std::path::PathBuf;
use std::process::{exit, Command, Stdio};

static ROOT: Lazy<PathBuf> = Lazy::new(|| {
    PathBuf::from(std::env::var("CARGO_MANIFEST_DIR").unwrap())
        .parent()
        .unwrap()
        .to_owned()
});

static CARGO: Lazy<String> = Lazy::new(|| var("CARGO").unwrap_or_else(|_| "cargo".to_owned()));

fn build_staticlib(arg: &[String]) -> Result<(bool, PathBuf)> {
    let mut cmd = Command::new(&*CARGO);
    cmd.arg("build")
        .arg("--message-format=json-render-diagnostics")
        .arg("-p")
        .arg("quickjs-wasm-staticlib");
    cmd.args(arg.into_iter());
    eprintln!("Running {:?}", cmd);
    let mut output = cmd
        .stdout(std::process::Stdio::piped())
        .spawn()
        .context("failed to run cargo")?;
    let reader = std::io::BufReader::new(output.stdout.take().unwrap());
    let mut binaries = Vec::new();
    for message in cargo_metadata::Message::parse_stream(reader) {
        match message? {
            Message::CompilerArtifact(artifact) => {
                for name in artifact.filenames {
                    if let Some(ext) = name.extension() {
                        if ext == "a" {
                            binaries.push((artifact.fresh, name.into_std_path_buf()))
                        }
                    }
                }
            }
            Message::BuildFinished(finished) => {
                if finished.success {
                    break;
                } else {
                    return Err(anyhow::anyhow!("Build Failed"));
                }
            }
            _ => (),
        }
    }
    assert!(binaries.len() == 1);
    Ok(binaries.pop().unwrap())
}

fn handle_run(arg: &[String]) -> Result<()> {
    let (cargo_args, run_args) = if let Some(split) = arg.iter().position(|a| a.as_str() == "--") {
        (&arg[0..split], &arg[split + 1..])
    } else {
        (arg, &arg[0..0])
    };
    handle_build(cargo_args, false, None)?;
    let qjs = ROOT.join("quickjs/qjs");
    let mut cmd = Command::new(qjs);
    cmd.current_dir(&*ROOT);
    cmd.args(run_args);
    eprintln!("Running {:?}", cmd);
    let status = cmd.spawn().context("failed to run qjs")?.wait()?;
    if !status.success() {
        eprintln!("qjs failed: {}", status);
        exit(status.code().unwrap_or(101))
    }
    Ok(())
}

fn get_target() -> Result<String> {
    let output = Command::new("rustc")
        .arg("-vV")
        .output()
        .context("Failed to run rustc to get the host target")?;
    let output =
        std::str::from_utf8(&output.stdout).context("`rustc -vV` didn't return utf8 output")?;

    let field = "host: ";
    let host = output
        .lines()
        .find(|l| l.starts_with(field))
        .map(|l| &l[field.len()..])
        .ok_or_else(|| {
            anyhow!(
                "`rustc -vV` didn't have a line for `{}`, got:\n{}",
                field.trim(),
                output
            )
        })?
        .to_string();
    Ok(host)
}

fn exec_cmd(cmd: &mut Command) -> Result<()> {
    eprintln!("Running {:?}", cmd);
    let status = cmd
        .stdout(unsafe { Stdio::from_raw_fd(2) })
        .spawn()
        .context("failed to run make")?
        .wait()?;
    if !status.success() {
        eprintln!("build failed: {}", status);
        exit(status.code().unwrap_or(101))
    }
    Ok(())
}

fn handle_build(arg: &[String], asan: bool, android: Option<&String>) -> Result<()> {
    let mut new_arg = Vec::new();
    if asan {
        new_arg.push("-Zbuild-std".to_owned());
        if android.is_none() {
            new_arg.push(format!("--target={}", get_target()?));
        } 
        env::set_var("RUSTFLAGS", "-Zsanitizer=address");
    }
    if android.is_some() {
        new_arg.push(format!("--target={}", android.unwrap().clone()));
    }
    new_arg.extend(arg.to_owned());
    let arg = &new_arg;
    let (mut fresh, path) = build_staticlib(arg)?;
    let target = ROOT.join("quickjs/libquickjs_wasm_staticlib.a");
    fresh = fresh && target.exists();
    if !fresh {
        fs::copy(path, target)?;
    }
    let mut cmd = Command::new("make");
    cmd.current_dir(ROOT.join("quickjs"));
    cmd.arg("-j12").arg("CONFIG_WASM=1").arg("CONFIG_CLANG=1");
    if asan {
        cmd.arg("CONFIG_ASAN=1");
    }
    if android.is_some() {
        cmd.arg("CONFIG_ANDROID=1");
    }
    exec_cmd(&mut cmd)?;
    Ok(())
}

fn handle_clean() -> Result<()> {
    let mut cmd = Command::new("make");
    cmd.current_dir(ROOT.join("quickjs"));
    cmd.arg("clean");
    exec_cmd(&mut cmd)?;
    let mut cmd = Command::new(&*CARGO);
    cmd.current_dir(&*ROOT);
    cmd.arg("clean");
    exec_cmd(&mut cmd)?;
    Ok(())
}

fn main() {
    let args: Vec<String> = args().collect();
    let cmd = args.get(1).expect("missing command: xbuild, xrun");
    let args = &args[2..];
    match cmd.as_str() {
        "xbuild" => handle_build(args, false, None).unwrap(),
        "xrun" => handle_run(args).unwrap(),
        "asan" => handle_build(args, true, None).unwrap(),
        "xclean" => handle_clean().unwrap(),
        "build-android" => {
            let target = &args[0];
            handle_build(&args[1..], false, Some(target)).unwrap()
        }
        _ => {
            eprintln!("Unexpected {}", cmd);
            eprintln!("Help: xrun, xbuild, asan, xclean");
        }
    }
}
