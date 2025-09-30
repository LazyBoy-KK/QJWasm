(module
  (type (;0;) (func))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32)))
  (func $__wasm_call_ctors (;0;) (type 0))
  (func $_initialize (;1;) (type 0)
    block ;; label = @1
      global.get $GOT.data.internal.__memory_base
      i32.const 1024
      i32.add
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      unreachable
      unreachable
    end
    global.get $GOT.data.internal.__memory_base
    i32.const 1024
    i32.add
    i32.const 1
    i32.store
    call $__wasm_call_ctors
  )
  (func $get_num (;2;) (type 1) (param i32) (result i32)
    i32.const 123456
  )
  (func $get_str (;3;) (type 2) (param i32 i32) (result i32)
    local.get 0
  )
  (func $get_arr (;4;) (type 2) (param i32 i32) (result i32)
    local.get 0
  )
  (func $abort (;5;) (type 0)
    unreachable
    unreachable
  )
  (func $sbrk (;6;) (type 1) (param i32) (result i32)
    block ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      memory.size
      i32.const 16
      i32.shl
      return
    end
    block ;; label = @1
      local.get 0
      i32.const 65535
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const -1
      i32.le_s
      br_if 0 (;@1;)
      block ;; label = @2
        local.get 0
        i32.const 16
        i32.shr_u
        memory.grow
        local.tee 0
        i32.const -1
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        i32.const 48
        i32.store offset=1028
        i32.const -1
        return
      end
      local.get 0
      i32.const 16
      i32.shl
      return
    end
    call $abort
    unreachable
  )
  (func $malloc (;7;) (type 1) (param i32) (result i32)
    local.get 0
    call $dlmalloc
  )
  (func $dlmalloc (;8;) (type 1) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      i32.const 0
                                      i32.load offset=1056
                                      local.tee 2
                                      br_if 0 (;@17;)
                                      block ;; label = @18
                                        i32.const 0
                                        i32.load offset=1504
                                        local.tee 3
                                        br_if 0 (;@18;)
                                        i32.const 0
                                        i64.const -1
                                        i64.store offset=1516 align=4
                                        i32.const 0
                                        i64.const 281474976776192
                                        i64.store offset=1508 align=4
                                        i32.const 0
                                        local.get 1
                                        i32.const 8
                                        i32.add
                                        i32.const -16
                                        i32.and
                                        i32.const 1431655768
                                        i32.xor
                                        local.tee 3
                                        i32.store offset=1504
                                        i32.const 0
                                        i32.const 0
                                        i32.store offset=1524
                                        i32.const 0
                                        i32.const 0
                                        i32.store offset=1476
                                      end
                                      i32.const 131072
                                      i32.const 67072
                                      i32.lt_u
                                      br_if 1 (;@16;)
                                      i32.const 0
                                      local.set 2
                                      i32.const 131072
                                      i32.const 67072
                                      i32.sub
                                      i32.const 89
                                      i32.lt_u
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.set 4
                                      i32.const 0
                                      i32.const 67072
                                      i32.store offset=1480
                                      i32.const 0
                                      i32.const 67072
                                      i32.store offset=1048
                                      i32.const 0
                                      local.get 3
                                      i32.store offset=1068
                                      i32.const 0
                                      i32.const -1
                                      i32.store offset=1064
                                      i32.const 0
                                      i32.const 131072
                                      i32.const 67072
                                      i32.sub
                                      i32.store offset=1484
                                      loop ;; label = @18
                                        local.get 4
                                        i32.const 1092
                                        i32.add
                                        local.get 4
                                        i32.const 1080
                                        i32.add
                                        local.tee 3
                                        i32.store
                                        local.get 3
                                        local.get 4
                                        i32.const 1072
                                        i32.add
                                        local.tee 5
                                        i32.store
                                        local.get 4
                                        i32.const 1084
                                        i32.add
                                        local.get 5
                                        i32.store
                                        local.get 4
                                        i32.const 1100
                                        i32.add
                                        local.get 4
                                        i32.const 1088
                                        i32.add
                                        local.tee 5
                                        i32.store
                                        local.get 5
                                        local.get 3
                                        i32.store
                                        local.get 4
                                        i32.const 1108
                                        i32.add
                                        local.get 4
                                        i32.const 1096
                                        i32.add
                                        local.tee 3
                                        i32.store
                                        local.get 3
                                        local.get 5
                                        i32.store
                                        local.get 4
                                        i32.const 1104
                                        i32.add
                                        local.get 3
                                        i32.store
                                        local.get 4
                                        i32.const 32
                                        i32.add
                                        local.tee 4
                                        i32.const 256
                                        i32.ne
                                        br_if 0 (;@18;)
                                      end
                                      i32.const 67072
                                      i32.const -8
                                      i32.const 67072
                                      i32.sub
                                      i32.const 15
                                      i32.and
                                      local.tee 4
                                      i32.add
                                      local.tee 2
                                      i32.const 4
                                      i32.add
                                      i32.const 131072
                                      i32.const 67072
                                      i32.sub
                                      i32.const -56
                                      i32.add
                                      local.tee 3
                                      local.get 4
                                      i32.sub
                                      local.tee 4
                                      i32.const 1
                                      i32.or
                                      i32.store
                                      i32.const 0
                                      i32.const 0
                                      i32.load offset=1520
                                      i32.store offset=1060
                                      i32.const 0
                                      local.get 4
                                      i32.store offset=1044
                                      i32.const 0
                                      local.get 2
                                      i32.store offset=1056
                                      local.get 3
                                      i32.const 67072
                                      i32.add
                                      i32.const 4
                                      i32.add
                                      i32.const 56
                                      i32.store
                                    end
                                    block ;; label = @17
                                      block ;; label = @18
                                        local.get 0
                                        i32.const 236
                                        i32.gt_u
                                        br_if 0 (;@18;)
                                        block ;; label = @19
                                          i32.const 0
                                          i32.load offset=1032
                                          local.tee 6
                                          i32.const 16
                                          local.get 0
                                          i32.const 19
                                          i32.add
                                          i32.const -16
                                          i32.and
                                          local.get 0
                                          i32.const 11
                                          i32.lt_u
                                          select
                                          local.tee 7
                                          i32.const 3
                                          i32.shr_u
                                          local.tee 3
                                          i32.shr_u
                                          local.tee 4
                                          i32.const 3
                                          i32.and
                                          i32.eqz
                                          br_if 0 (;@19;)
                                          block ;; label = @20
                                            block ;; label = @21
                                              local.get 4
                                              i32.const 1
                                              i32.and
                                              local.get 3
                                              i32.or
                                              i32.const 1
                                              i32.xor
                                              local.tee 5
                                              i32.const 3
                                              i32.shl
                                              local.tee 3
                                              i32.const 1072
                                              i32.add
                                              local.tee 4
                                              local.get 3
                                              i32.const 1080
                                              i32.add
                                              i32.load
                                              local.tee 3
                                              i32.load offset=8
                                              local.tee 7
                                              i32.ne
                                              br_if 0 (;@21;)
                                              i32.const 0
                                              local.get 6
                                              i32.const -2
                                              local.get 5
                                              i32.rotl
                                              i32.and
                                              i32.store offset=1032
                                              br 1 (;@20;)
                                            end
                                            local.get 4
                                            local.get 7
                                            i32.store offset=8
                                            local.get 7
                                            local.get 4
                                            i32.store offset=12
                                          end
                                          local.get 3
                                          i32.const 8
                                          i32.add
                                          local.set 4
                                          local.get 3
                                          local.get 5
                                          i32.const 3
                                          i32.shl
                                          local.tee 5
                                          i32.const 3
                                          i32.or
                                          i32.store offset=4
                                          local.get 3
                                          local.get 5
                                          i32.add
                                          local.tee 3
                                          local.get 3
                                          i32.load offset=4
                                          i32.const 1
                                          i32.or
                                          i32.store offset=4
                                          br 18 (;@1;)
                                        end
                                        local.get 7
                                        i32.const 0
                                        i32.load offset=1040
                                        local.tee 8
                                        i32.le_u
                                        br_if 1 (;@17;)
                                        block ;; label = @19
                                          local.get 4
                                          i32.eqz
                                          br_if 0 (;@19;)
                                          block ;; label = @20
                                            block ;; label = @21
                                              local.get 4
                                              local.get 3
                                              i32.shl
                                              i32.const 2
                                              local.get 3
                                              i32.shl
                                              local.tee 4
                                              i32.const 0
                                              local.get 4
                                              i32.sub
                                              i32.or
                                              i32.and
                                              i32.ctz
                                              local.tee 3
                                              i32.const 3
                                              i32.shl
                                              local.tee 4
                                              i32.const 1072
                                              i32.add
                                              local.tee 5
                                              local.get 4
                                              i32.const 1080
                                              i32.add
                                              i32.load
                                              local.tee 4
                                              i32.load offset=8
                                              local.tee 0
                                              i32.ne
                                              br_if 0 (;@21;)
                                              i32.const 0
                                              local.get 6
                                              i32.const -2
                                              local.get 3
                                              i32.rotl
                                              i32.and
                                              local.tee 6
                                              i32.store offset=1032
                                              br 1 (;@20;)
                                            end
                                            local.get 5
                                            local.get 0
                                            i32.store offset=8
                                            local.get 0
                                            local.get 5
                                            i32.store offset=12
                                          end
                                          local.get 4
                                          local.get 7
                                          i32.const 3
                                          i32.or
                                          i32.store offset=4
                                          local.get 4
                                          local.get 3
                                          i32.const 3
                                          i32.shl
                                          local.tee 3
                                          i32.add
                                          local.get 3
                                          local.get 7
                                          i32.sub
                                          local.tee 5
                                          i32.store
                                          local.get 4
                                          local.get 7
                                          i32.add
                                          local.tee 0
                                          local.get 5
                                          i32.const 1
                                          i32.or
                                          i32.store offset=4
                                          block ;; label = @20
                                            local.get 8
                                            i32.eqz
                                            br_if 0 (;@20;)
                                            local.get 8
                                            i32.const -8
                                            i32.and
                                            i32.const 1072
                                            i32.add
                                            local.set 7
                                            i32.const 0
                                            i32.load offset=1052
                                            local.set 3
                                            block ;; label = @21
                                              block ;; label = @22
                                                local.get 6
                                                i32.const 1
                                                local.get 8
                                                i32.const 3
                                                i32.shr_u
                                                i32.shl
                                                local.tee 9
                                                i32.and
                                                br_if 0 (;@22;)
                                                i32.const 0
                                                local.get 6
                                                local.get 9
                                                i32.or
                                                i32.store offset=1032
                                                local.get 7
                                                local.set 9
                                                br 1 (;@21;)
                                              end
                                              local.get 7
                                              i32.load offset=8
                                              local.set 9
                                            end
                                            local.get 9
                                            local.get 3
                                            i32.store offset=12
                                            local.get 7
                                            local.get 3
                                            i32.store offset=8
                                            local.get 3
                                            local.get 7
                                            i32.store offset=12
                                            local.get 3
                                            local.get 9
                                            i32.store offset=8
                                          end
                                          local.get 4
                                          i32.const 8
                                          i32.add
                                          local.set 4
                                          i32.const 0
                                          local.get 0
                                          i32.store offset=1052
                                          i32.const 0
                                          local.get 5
                                          i32.store offset=1040
                                          br 18 (;@1;)
                                        end
                                        i32.const 0
                                        i32.load offset=1036
                                        local.tee 10
                                        i32.eqz
                                        br_if 1 (;@17;)
                                        local.get 10
                                        i32.ctz
                                        i32.const 2
                                        i32.shl
                                        i32.const 1336
                                        i32.add
                                        i32.load
                                        local.tee 0
                                        i32.load offset=4
                                        i32.const -8
                                        i32.and
                                        local.get 7
                                        i32.sub
                                        local.set 3
                                        local.get 0
                                        local.set 5
                                        block ;; label = @19
                                          loop ;; label = @20
                                            block ;; label = @21
                                              local.get 5
                                              i32.load offset=16
                                              local.tee 4
                                              br_if 0 (;@21;)
                                              local.get 5
                                              i32.const 20
                                              i32.add
                                              i32.load
                                              local.tee 4
                                              i32.eqz
                                              br_if 2 (;@19;)
                                            end
                                            local.get 4
                                            i32.load offset=4
                                            i32.const -8
                                            i32.and
                                            local.get 7
                                            i32.sub
                                            local.tee 5
                                            local.get 3
                                            local.get 5
                                            local.get 3
                                            i32.lt_u
                                            local.tee 5
                                            select
                                            local.set 3
                                            local.get 4
                                            local.get 0
                                            local.get 5
                                            select
                                            local.set 0
                                            local.get 4
                                            local.set 5
                                            br 0 (;@20;)
                                          end
                                        end
                                        local.get 0
                                        i32.load offset=24
                                        local.set 11
                                        block ;; label = @19
                                          local.get 0
                                          i32.load offset=12
                                          local.tee 9
                                          local.get 0
                                          i32.eq
                                          br_if 0 (;@19;)
                                          local.get 0
                                          i32.load offset=8
                                          local.tee 4
                                          i32.const 0
                                          i32.load offset=1048
                                          i32.lt_u
                                          drop
                                          local.get 9
                                          local.get 4
                                          i32.store offset=8
                                          local.get 4
                                          local.get 9
                                          i32.store offset=12
                                          br 17 (;@2;)
                                        end
                                        block ;; label = @19
                                          local.get 0
                                          i32.const 20
                                          i32.add
                                          local.tee 5
                                          i32.load
                                          local.tee 4
                                          br_if 0 (;@19;)
                                          local.get 0
                                          i32.load offset=16
                                          local.tee 4
                                          i32.eqz
                                          br_if 4 (;@15;)
                                          local.get 0
                                          i32.const 16
                                          i32.add
                                          local.set 5
                                        end
                                        loop ;; label = @19
                                          local.get 5
                                          local.set 2
                                          local.get 4
                                          local.tee 9
                                          i32.const 20
                                          i32.add
                                          local.tee 5
                                          i32.load
                                          local.tee 4
                                          br_if 0 (;@19;)
                                          local.get 9
                                          i32.const 16
                                          i32.add
                                          local.set 5
                                          local.get 9
                                          i32.load offset=16
                                          local.tee 4
                                          br_if 0 (;@19;)
                                        end
                                        local.get 2
                                        i32.const 0
                                        i32.store
                                        br 16 (;@2;)
                                      end
                                      i32.const -1
                                      local.set 7
                                      local.get 0
                                      i32.const -65
                                      i32.gt_u
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 19
                                      i32.add
                                      local.tee 4
                                      i32.const -16
                                      i32.and
                                      local.set 7
                                      i32.const 0
                                      i32.load offset=1036
                                      local.tee 11
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.set 8
                                      block ;; label = @18
                                        local.get 7
                                        i32.const 256
                                        i32.lt_u
                                        br_if 0 (;@18;)
                                        i32.const 31
                                        local.set 8
                                        local.get 7
                                        i32.const 16777215
                                        i32.gt_u
                                        br_if 0 (;@18;)
                                        local.get 7
                                        i32.const 38
                                        local.get 4
                                        i32.const 8
                                        i32.shr_u
                                        i32.clz
                                        local.tee 4
                                        i32.sub
                                        i32.shr_u
                                        i32.const 1
                                        i32.and
                                        local.get 4
                                        i32.const 1
                                        i32.shl
                                        i32.sub
                                        i32.const 62
                                        i32.add
                                        local.set 8
                                      end
                                      i32.const 0
                                      local.get 7
                                      i32.sub
                                      local.set 3
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            block ;; label = @21
                                              local.get 8
                                              i32.const 2
                                              i32.shl
                                              i32.const 1336
                                              i32.add
                                              i32.load
                                              local.tee 5
                                              br_if 0 (;@21;)
                                              i32.const 0
                                              local.set 4
                                              i32.const 0
                                              local.set 9
                                              br 1 (;@20;)
                                            end
                                            i32.const 0
                                            local.set 4
                                            local.get 7
                                            i32.const 0
                                            i32.const 25
                                            local.get 8
                                            i32.const 1
                                            i32.shr_u
                                            i32.sub
                                            local.get 8
                                            i32.const 31
                                            i32.eq
                                            select
                                            i32.shl
                                            local.set 0
                                            i32.const 0
                                            local.set 9
                                            loop ;; label = @21
                                              block ;; label = @22
                                                local.get 5
                                                i32.load offset=4
                                                i32.const -8
                                                i32.and
                                                local.get 7
                                                i32.sub
                                                local.tee 6
                                                local.get 3
                                                i32.ge_u
                                                br_if 0 (;@22;)
                                                local.get 6
                                                local.set 3
                                                local.get 5
                                                local.set 9
                                                local.get 6
                                                br_if 0 (;@22;)
                                                i32.const 0
                                                local.set 3
                                                local.get 5
                                                local.set 9
                                                local.get 5
                                                local.set 4
                                                br 3 (;@19;)
                                              end
                                              local.get 4
                                              local.get 5
                                              i32.const 20
                                              i32.add
                                              i32.load
                                              local.tee 6
                                              local.get 6
                                              local.get 5
                                              local.get 0
                                              i32.const 29
                                              i32.shr_u
                                              i32.const 4
                                              i32.and
                                              i32.add
                                              i32.const 16
                                              i32.add
                                              i32.load
                                              local.tee 5
                                              i32.eq
                                              select
                                              local.get 4
                                              local.get 6
                                              select
                                              local.set 4
                                              local.get 0
                                              i32.const 1
                                              i32.shl
                                              local.set 0
                                              local.get 5
                                              br_if 0 (;@21;)
                                            end
                                          end
                                          block ;; label = @20
                                            local.get 4
                                            local.get 9
                                            i32.or
                                            br_if 0 (;@20;)
                                            i32.const 0
                                            local.set 9
                                            i32.const 2
                                            local.get 8
                                            i32.shl
                                            local.tee 4
                                            i32.const 0
                                            local.get 4
                                            i32.sub
                                            i32.or
                                            local.get 11
                                            i32.and
                                            local.tee 4
                                            i32.eqz
                                            br_if 3 (;@17;)
                                            local.get 4
                                            i32.ctz
                                            i32.const 2
                                            i32.shl
                                            i32.const 1336
                                            i32.add
                                            i32.load
                                            local.set 4
                                          end
                                          local.get 4
                                          i32.eqz
                                          br_if 1 (;@18;)
                                        end
                                        loop ;; label = @19
                                          local.get 4
                                          i32.load offset=4
                                          i32.const -8
                                          i32.and
                                          local.get 7
                                          i32.sub
                                          local.tee 6
                                          local.get 3
                                          i32.lt_u
                                          local.set 0
                                          block ;; label = @20
                                            local.get 4
                                            i32.load offset=16
                                            local.tee 5
                                            br_if 0 (;@20;)
                                            local.get 4
                                            i32.const 20
                                            i32.add
                                            i32.load
                                            local.set 5
                                          end
                                          local.get 6
                                          local.get 3
                                          local.get 0
                                          select
                                          local.set 3
                                          local.get 4
                                          local.get 9
                                          local.get 0
                                          select
                                          local.set 9
                                          local.get 5
                                          local.set 4
                                          local.get 5
                                          br_if 0 (;@19;)
                                        end
                                      end
                                      local.get 9
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      local.get 3
                                      i32.const 0
                                      i32.load offset=1040
                                      local.get 7
                                      i32.sub
                                      i32.ge_u
                                      br_if 0 (;@17;)
                                      local.get 9
                                      i32.load offset=24
                                      local.set 2
                                      block ;; label = @18
                                        local.get 9
                                        i32.load offset=12
                                        local.tee 0
                                        local.get 9
                                        i32.eq
                                        br_if 0 (;@18;)
                                        local.get 9
                                        i32.load offset=8
                                        local.tee 4
                                        i32.const 0
                                        i32.load offset=1048
                                        i32.lt_u
                                        drop
                                        local.get 0
                                        local.get 4
                                        i32.store offset=8
                                        local.get 4
                                        local.get 0
                                        i32.store offset=12
                                        br 15 (;@3;)
                                      end
                                      block ;; label = @18
                                        local.get 9
                                        i32.const 20
                                        i32.add
                                        local.tee 5
                                        i32.load
                                        local.tee 4
                                        br_if 0 (;@18;)
                                        local.get 9
                                        i32.load offset=16
                                        local.tee 4
                                        i32.eqz
                                        br_if 4 (;@14;)
                                        local.get 9
                                        i32.const 16
                                        i32.add
                                        local.set 5
                                      end
                                      loop ;; label = @18
                                        local.get 5
                                        local.set 6
                                        local.get 4
                                        local.tee 0
                                        i32.const 20
                                        i32.add
                                        local.tee 5
                                        i32.load
                                        local.tee 4
                                        br_if 0 (;@18;)
                                        local.get 0
                                        i32.const 16
                                        i32.add
                                        local.set 5
                                        local.get 0
                                        i32.load offset=16
                                        local.tee 4
                                        br_if 0 (;@18;)
                                      end
                                      local.get 6
                                      i32.const 0
                                      i32.store
                                      br 14 (;@3;)
                                    end
                                    block ;; label = @17
                                      i32.const 0
                                      i32.load offset=1040
                                      local.tee 4
                                      local.get 7
                                      i32.lt_u
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      i32.load offset=1052
                                      local.set 3
                                      block ;; label = @18
                                        block ;; label = @19
                                          local.get 4
                                          local.get 7
                                          i32.sub
                                          local.tee 5
                                          i32.const 16
                                          i32.lt_u
                                          br_if 0 (;@19;)
                                          local.get 3
                                          local.get 7
                                          i32.add
                                          local.tee 0
                                          local.get 5
                                          i32.const 1
                                          i32.or
                                          i32.store offset=4
                                          local.get 3
                                          local.get 4
                                          i32.add
                                          local.get 5
                                          i32.store
                                          local.get 3
                                          local.get 7
                                          i32.const 3
                                          i32.or
                                          i32.store offset=4
                                          br 1 (;@18;)
                                        end
                                        local.get 3
                                        local.get 4
                                        i32.const 3
                                        i32.or
                                        i32.store offset=4
                                        local.get 3
                                        local.get 4
                                        i32.add
                                        local.tee 4
                                        local.get 4
                                        i32.load offset=4
                                        i32.const 1
                                        i32.or
                                        i32.store offset=4
                                        i32.const 0
                                        local.set 0
                                        i32.const 0
                                        local.set 5
                                      end
                                      i32.const 0
                                      local.get 5
                                      i32.store offset=1040
                                      i32.const 0
                                      local.get 0
                                      i32.store offset=1052
                                      local.get 3
                                      i32.const 8
                                      i32.add
                                      local.set 4
                                      br 16 (;@1;)
                                    end
                                    block ;; label = @17
                                      i32.const 0
                                      i32.load offset=1044
                                      local.tee 5
                                      local.get 7
                                      i32.le_u
                                      br_if 0 (;@17;)
                                      local.get 2
                                      local.get 7
                                      i32.add
                                      local.tee 4
                                      local.get 5
                                      local.get 7
                                      i32.sub
                                      local.tee 3
                                      i32.const 1
                                      i32.or
                                      i32.store offset=4
                                      i32.const 0
                                      local.get 4
                                      i32.store offset=1056
                                      i32.const 0
                                      local.get 3
                                      i32.store offset=1044
                                      local.get 2
                                      local.get 7
                                      i32.const 3
                                      i32.or
                                      i32.store offset=4
                                      local.get 2
                                      i32.const 8
                                      i32.add
                                      local.set 4
                                      br 16 (;@1;)
                                    end
                                    block ;; label = @17
                                      block ;; label = @18
                                        i32.const 0
                                        i32.load offset=1504
                                        i32.eqz
                                        br_if 0 (;@18;)
                                        i32.const 0
                                        i32.load offset=1512
                                        local.set 3
                                        br 1 (;@17;)
                                      end
                                      i32.const 0
                                      i64.const -1
                                      i64.store offset=1516 align=4
                                      i32.const 0
                                      i64.const 281474976776192
                                      i64.store offset=1508 align=4
                                      i32.const 0
                                      local.get 1
                                      i32.const 12
                                      i32.add
                                      i32.const -16
                                      i32.and
                                      i32.const 1431655768
                                      i32.xor
                                      i32.store offset=1504
                                      i32.const 0
                                      i32.const 0
                                      i32.store offset=1524
                                      i32.const 0
                                      i32.const 0
                                      i32.store offset=1476
                                      i32.const 65536
                                      local.set 3
                                    end
                                    i32.const 0
                                    local.set 4
                                    block ;; label = @17
                                      local.get 3
                                      local.get 7
                                      i32.const 71
                                      i32.add
                                      local.tee 8
                                      i32.add
                                      local.tee 0
                                      i32.const 0
                                      local.get 3
                                      i32.sub
                                      local.tee 6
                                      i32.and
                                      local.tee 9
                                      local.get 7
                                      i32.gt_u
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      i32.const 48
                                      i32.store offset=1028
                                      br 16 (;@1;)
                                    end
                                    block ;; label = @17
                                      i32.const 0
                                      i32.load offset=1472
                                      local.tee 4
                                      i32.eqz
                                      br_if 0 (;@17;)
                                      block ;; label = @18
                                        i32.const 0
                                        i32.load offset=1464
                                        local.tee 3
                                        local.get 9
                                        i32.add
                                        local.tee 11
                                        local.get 3
                                        i32.le_u
                                        br_if 0 (;@18;)
                                        local.get 11
                                        local.get 4
                                        i32.le_u
                                        br_if 1 (;@17;)
                                      end
                                      i32.const 0
                                      local.set 4
                                      i32.const 0
                                      i32.const 48
                                      i32.store offset=1028
                                      br 16 (;@1;)
                                    end
                                    i32.const 0
                                    i32.load8_u offset=1476
                                    i32.const 4
                                    i32.and
                                    br_if 5 (;@11;)
                                    block ;; label = @17
                                      block ;; label = @18
                                        block ;; label = @19
                                          local.get 2
                                          i32.eqz
                                          br_if 0 (;@19;)
                                          i32.const 1480
                                          local.set 4
                                          loop ;; label = @20
                                            block ;; label = @21
                                              local.get 4
                                              i32.load
                                              local.tee 3
                                              local.get 2
                                              i32.gt_u
                                              br_if 0 (;@21;)
                                              local.get 3
                                              local.get 4
                                              i32.load offset=4
                                              i32.add
                                              local.get 2
                                              i32.gt_u
                                              br_if 3 (;@18;)
                                            end
                                            local.get 4
                                            i32.load offset=8
                                            local.tee 4
                                            br_if 0 (;@20;)
                                          end
                                        end
                                        i32.const 0
                                        call $sbrk
                                        local.tee 0
                                        i32.const -1
                                        i32.eq
                                        br_if 6 (;@12;)
                                        local.get 9
                                        local.set 6
                                        block ;; label = @19
                                          i32.const 0
                                          i32.load offset=1508
                                          local.tee 4
                                          i32.const -1
                                          i32.add
                                          local.tee 3
                                          local.get 0
                                          i32.and
                                          i32.eqz
                                          br_if 0 (;@19;)
                                          local.get 9
                                          local.get 0
                                          i32.sub
                                          local.get 3
                                          local.get 0
                                          i32.add
                                          i32.const 0
                                          local.get 4
                                          i32.sub
                                          i32.and
                                          i32.add
                                          local.set 6
                                        end
                                        local.get 6
                                        local.get 7
                                        i32.le_u
                                        br_if 6 (;@12;)
                                        local.get 6
                                        i32.const 2147483646
                                        i32.gt_u
                                        br_if 6 (;@12;)
                                        block ;; label = @19
                                          i32.const 0
                                          i32.load offset=1472
                                          local.tee 4
                                          i32.eqz
                                          br_if 0 (;@19;)
                                          i32.const 0
                                          i32.load offset=1464
                                          local.tee 3
                                          local.get 6
                                          i32.add
                                          local.tee 5
                                          local.get 3
                                          i32.le_u
                                          br_if 7 (;@12;)
                                          local.get 5
                                          local.get 4
                                          i32.gt_u
                                          br_if 7 (;@12;)
                                        end
                                        local.get 6
                                        call $sbrk
                                        local.tee 4
                                        local.get 0
                                        i32.ne
                                        br_if 1 (;@17;)
                                        br 8 (;@10;)
                                      end
                                      local.get 0
                                      local.get 5
                                      i32.sub
                                      local.get 6
                                      i32.and
                                      local.tee 6
                                      i32.const 2147483646
                                      i32.gt_u
                                      br_if 5 (;@12;)
                                      local.get 6
                                      call $sbrk
                                      local.tee 0
                                      local.get 4
                                      i32.load
                                      local.get 4
                                      i32.load offset=4
                                      i32.add
                                      i32.eq
                                      br_if 4 (;@13;)
                                      local.get 0
                                      local.set 4
                                    end
                                    block ;; label = @17
                                      local.get 6
                                      local.get 7
                                      i32.const 72
                                      i32.add
                                      i32.ge_u
                                      br_if 0 (;@17;)
                                      local.get 4
                                      i32.const -1
                                      i32.eq
                                      br_if 0 (;@17;)
                                      block ;; label = @18
                                        local.get 8
                                        local.get 6
                                        i32.sub
                                        i32.const 0
                                        i32.load offset=1512
                                        local.tee 3
                                        i32.add
                                        i32.const 0
                                        local.get 3
                                        i32.sub
                                        i32.and
                                        local.tee 3
                                        i32.const 2147483646
                                        i32.le_u
                                        br_if 0 (;@18;)
                                        local.get 4
                                        local.set 0
                                        br 8 (;@10;)
                                      end
                                      block ;; label = @18
                                        local.get 3
                                        call $sbrk
                                        i32.const -1
                                        i32.eq
                                        br_if 0 (;@18;)
                                        local.get 3
                                        local.get 6
                                        i32.add
                                        local.set 6
                                        local.get 4
                                        local.set 0
                                        br 8 (;@10;)
                                      end
                                      i32.const 0
                                      local.get 6
                                      i32.sub
                                      call $sbrk
                                      drop
                                      br 5 (;@12;)
                                    end
                                    local.get 4
                                    local.set 0
                                    local.get 4
                                    i32.const -1
                                    i32.ne
                                    br_if 6 (;@10;)
                                    br 4 (;@12;)
                                  end
                                  unreachable
                                  unreachable
                                end
                                i32.const 0
                                local.set 9
                                br 12 (;@2;)
                              end
                              i32.const 0
                              local.set 0
                              br 10 (;@3;)
                            end
                            local.get 0
                            i32.const -1
                            i32.ne
                            br_if 2 (;@10;)
                          end
                          i32.const 0
                          i32.const 0
                          i32.load offset=1476
                          i32.const 4
                          i32.or
                          i32.store offset=1476
                        end
                        local.get 9
                        i32.const 2147483646
                        i32.gt_u
                        br_if 1 (;@9;)
                        local.get 9
                        call $sbrk
                        local.set 0
                        i32.const 0
                        call $sbrk
                        local.set 4
                        local.get 0
                        i32.const -1
                        i32.eq
                        br_if 1 (;@9;)
                        local.get 4
                        i32.const -1
                        i32.eq
                        br_if 1 (;@9;)
                        local.get 0
                        local.get 4
                        i32.ge_u
                        br_if 1 (;@9;)
                        local.get 4
                        local.get 0
                        i32.sub
                        local.tee 6
                        local.get 7
                        i32.const 56
                        i32.add
                        i32.le_u
                        br_if 1 (;@9;)
                      end
                      i32.const 0
                      i32.const 0
                      i32.load offset=1464
                      local.get 6
                      i32.add
                      local.tee 4
                      i32.store offset=1464
                      block ;; label = @10
                        local.get 4
                        i32.const 0
                        i32.load offset=1468
                        i32.le_u
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 4
                        i32.store offset=1468
                      end
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              i32.const 0
                              i32.load offset=1056
                              local.tee 3
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 1480
                              local.set 4
                              loop ;; label = @14
                                local.get 0
                                local.get 4
                                i32.load
                                local.tee 5
                                local.get 4
                                i32.load offset=4
                                local.tee 9
                                i32.add
                                i32.eq
                                br_if 2 (;@12;)
                                local.get 4
                                i32.load offset=8
                                local.tee 4
                                br_if 0 (;@14;)
                                br 3 (;@11;)
                              end
                            end
                            block ;; label = @13
                              block ;; label = @14
                                i32.const 0
                                i32.load offset=1048
                                local.tee 4
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 0
                                local.get 4
                                i32.ge_u
                                br_if 1 (;@13;)
                              end
                              i32.const 0
                              local.get 0
                              i32.store offset=1048
                            end
                            i32.const 0
                            local.set 4
                            i32.const 0
                            local.get 6
                            i32.store offset=1484
                            i32.const 0
                            local.get 0
                            i32.store offset=1480
                            i32.const 0
                            i32.const -1
                            i32.store offset=1064
                            i32.const 0
                            i32.const 0
                            i32.load offset=1504
                            i32.store offset=1068
                            i32.const 0
                            i32.const 0
                            i32.store offset=1492
                            loop ;; label = @13
                              local.get 4
                              i32.const 1092
                              i32.add
                              local.get 4
                              i32.const 1080
                              i32.add
                              local.tee 3
                              i32.store
                              local.get 3
                              local.get 4
                              i32.const 1072
                              i32.add
                              local.tee 5
                              i32.store
                              local.get 4
                              i32.const 1084
                              i32.add
                              local.get 5
                              i32.store
                              local.get 4
                              i32.const 1100
                              i32.add
                              local.get 4
                              i32.const 1088
                              i32.add
                              local.tee 5
                              i32.store
                              local.get 5
                              local.get 3
                              i32.store
                              local.get 4
                              i32.const 1108
                              i32.add
                              local.get 4
                              i32.const 1096
                              i32.add
                              local.tee 3
                              i32.store
                              local.get 3
                              local.get 5
                              i32.store
                              local.get 4
                              i32.const 1104
                              i32.add
                              local.get 3
                              i32.store
                              local.get 4
                              i32.const 32
                              i32.add
                              local.tee 4
                              i32.const 256
                              i32.ne
                              br_if 0 (;@13;)
                            end
                            local.get 0
                            i32.const -8
                            local.get 0
                            i32.sub
                            i32.const 15
                            i32.and
                            local.tee 4
                            i32.add
                            local.tee 3
                            local.get 6
                            i32.const -56
                            i32.add
                            local.tee 5
                            local.get 4
                            i32.sub
                            local.tee 4
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            i32.const 0
                            i32.const 0
                            i32.load offset=1520
                            i32.store offset=1060
                            i32.const 0
                            local.get 4
                            i32.store offset=1044
                            i32.const 0
                            local.get 3
                            i32.store offset=1056
                            local.get 0
                            local.get 5
                            i32.add
                            i32.const 56
                            i32.store offset=4
                            br 2 (;@10;)
                          end
                          local.get 3
                          local.get 0
                          i32.ge_u
                          br_if 0 (;@11;)
                          local.get 3
                          local.get 5
                          i32.lt_u
                          br_if 0 (;@11;)
                          local.get 4
                          i32.load offset=12
                          i32.const 8
                          i32.and
                          br_if 0 (;@11;)
                          local.get 3
                          i32.const -8
                          local.get 3
                          i32.sub
                          i32.const 15
                          i32.and
                          local.tee 5
                          i32.add
                          local.tee 0
                          i32.const 0
                          i32.load offset=1044
                          local.get 6
                          i32.add
                          local.tee 2
                          local.get 5
                          i32.sub
                          local.tee 5
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get 4
                          local.get 9
                          local.get 6
                          i32.add
                          i32.store offset=4
                          i32.const 0
                          i32.const 0
                          i32.load offset=1520
                          i32.store offset=1060
                          i32.const 0
                          local.get 5
                          i32.store offset=1044
                          i32.const 0
                          local.get 0
                          i32.store offset=1056
                          local.get 3
                          local.get 2
                          i32.add
                          i32.const 56
                          i32.store offset=4
                          br 1 (;@10;)
                        end
                        block ;; label = @11
                          local.get 0
                          i32.const 0
                          i32.load offset=1048
                          local.tee 9
                          i32.ge_u
                          br_if 0 (;@11;)
                          i32.const 0
                          local.get 0
                          i32.store offset=1048
                          local.get 0
                          local.set 9
                        end
                        local.get 0
                        local.get 6
                        i32.add
                        local.set 5
                        i32.const 1480
                        local.set 4
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                loop ;; label = @15
                                  local.get 4
                                  i32.load
                                  local.get 5
                                  i32.eq
                                  br_if 1 (;@14;)
                                  local.get 4
                                  i32.load offset=8
                                  local.tee 4
                                  br_if 0 (;@15;)
                                  br 2 (;@13;)
                                end
                              end
                              local.get 4
                              i32.load8_u offset=12
                              i32.const 8
                              i32.and
                              i32.eqz
                              br_if 1 (;@12;)
                            end
                            i32.const 1480
                            local.set 4
                            loop ;; label = @13
                              block ;; label = @14
                                local.get 4
                                i32.load
                                local.tee 5
                                local.get 3
                                i32.gt_u
                                br_if 0 (;@14;)
                                local.get 5
                                local.get 4
                                i32.load offset=4
                                i32.add
                                local.tee 5
                                local.get 3
                                i32.gt_u
                                br_if 3 (;@11;)
                              end
                              local.get 4
                              i32.load offset=8
                              local.set 4
                              br 0 (;@13;)
                            end
                          end
                          local.get 4
                          local.get 0
                          i32.store
                          local.get 4
                          local.get 4
                          i32.load offset=4
                          local.get 6
                          i32.add
                          i32.store offset=4
                          local.get 0
                          i32.const -8
                          local.get 0
                          i32.sub
                          i32.const 15
                          i32.and
                          i32.add
                          local.tee 2
                          local.get 7
                          i32.const 3
                          i32.or
                          i32.store offset=4
                          local.get 5
                          i32.const -8
                          local.get 5
                          i32.sub
                          i32.const 15
                          i32.and
                          i32.add
                          local.tee 6
                          local.get 2
                          local.get 7
                          i32.add
                          local.tee 7
                          i32.sub
                          local.set 4
                          block ;; label = @12
                            local.get 6
                            local.get 3
                            i32.ne
                            br_if 0 (;@12;)
                            i32.const 0
                            local.get 7
                            i32.store offset=1056
                            i32.const 0
                            i32.const 0
                            i32.load offset=1044
                            local.get 4
                            i32.add
                            local.tee 4
                            i32.store offset=1044
                            local.get 7
                            local.get 4
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            br 8 (;@4;)
                          end
                          block ;; label = @12
                            local.get 6
                            i32.const 0
                            i32.load offset=1052
                            i32.ne
                            br_if 0 (;@12;)
                            i32.const 0
                            local.get 7
                            i32.store offset=1052
                            i32.const 0
                            i32.const 0
                            i32.load offset=1040
                            local.get 4
                            i32.add
                            local.tee 4
                            i32.store offset=1040
                            local.get 7
                            local.get 4
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            local.get 7
                            local.get 4
                            i32.add
                            local.get 4
                            i32.store
                            br 8 (;@4;)
                          end
                          local.get 6
                          i32.load offset=4
                          local.tee 3
                          i32.const 3
                          i32.and
                          i32.const 1
                          i32.ne
                          br_if 6 (;@5;)
                          local.get 3
                          i32.const -8
                          i32.and
                          local.set 8
                          block ;; label = @12
                            local.get 3
                            i32.const 255
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 6
                            i32.load offset=8
                            local.tee 5
                            local.get 3
                            i32.const 3
                            i32.shr_u
                            local.tee 9
                            i32.const 3
                            i32.shl
                            i32.const 1072
                            i32.add
                            local.tee 0
                            i32.eq
                            drop
                            block ;; label = @13
                              local.get 6
                              i32.load offset=12
                              local.tee 3
                              local.get 5
                              i32.ne
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.const 0
                              i32.load offset=1032
                              i32.const -2
                              local.get 9
                              i32.rotl
                              i32.and
                              i32.store offset=1032
                              br 7 (;@6;)
                            end
                            local.get 3
                            local.get 0
                            i32.eq
                            drop
                            local.get 3
                            local.get 5
                            i32.store offset=8
                            local.get 5
                            local.get 3
                            i32.store offset=12
                            br 6 (;@6;)
                          end
                          local.get 6
                          i32.load offset=24
                          local.set 11
                          block ;; label = @12
                            local.get 6
                            i32.load offset=12
                            local.tee 0
                            local.get 6
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 6
                            i32.load offset=8
                            local.tee 3
                            local.get 9
                            i32.lt_u
                            drop
                            local.get 0
                            local.get 3
                            i32.store offset=8
                            local.get 3
                            local.get 0
                            i32.store offset=12
                            br 5 (;@7;)
                          end
                          block ;; label = @12
                            local.get 6
                            i32.const 20
                            i32.add
                            local.tee 5
                            i32.load
                            local.tee 3
                            br_if 0 (;@12;)
                            local.get 6
                            i32.load offset=16
                            local.tee 3
                            i32.eqz
                            br_if 4 (;@8;)
                            local.get 6
                            i32.const 16
                            i32.add
                            local.set 5
                          end
                          loop ;; label = @12
                            local.get 5
                            local.set 9
                            local.get 3
                            local.tee 0
                            i32.const 20
                            i32.add
                            local.tee 5
                            i32.load
                            local.tee 3
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const 16
                            i32.add
                            local.set 5
                            local.get 0
                            i32.load offset=16
                            local.tee 3
                            br_if 0 (;@12;)
                          end
                          local.get 9
                          i32.const 0
                          i32.store
                          br 4 (;@7;)
                        end
                        local.get 0
                        i32.const -8
                        local.get 0
                        i32.sub
                        i32.const 15
                        i32.and
                        local.tee 4
                        i32.add
                        local.tee 2
                        local.get 6
                        i32.const -56
                        i32.add
                        local.tee 9
                        local.get 4
                        i32.sub
                        local.tee 4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 0
                        local.get 9
                        i32.add
                        i32.const 56
                        i32.store offset=4
                        local.get 3
                        local.get 5
                        i32.const 55
                        local.get 5
                        i32.sub
                        i32.const 15
                        i32.and
                        i32.add
                        i32.const -63
                        i32.add
                        local.tee 9
                        local.get 9
                        local.get 3
                        i32.const 16
                        i32.add
                        i32.lt_u
                        select
                        local.tee 9
                        i32.const 35
                        i32.store offset=4
                        i32.const 0
                        i32.const 0
                        i32.load offset=1520
                        i32.store offset=1060
                        i32.const 0
                        local.get 4
                        i32.store offset=1044
                        i32.const 0
                        local.get 2
                        i32.store offset=1056
                        local.get 9
                        i32.const 16
                        i32.add
                        i32.const 0
                        i64.load offset=1488 align=4
                        i64.store align=4
                        local.get 9
                        i32.const 0
                        i64.load offset=1480 align=4
                        i64.store offset=8 align=4
                        i32.const 0
                        local.get 9
                        i32.const 8
                        i32.add
                        i32.store offset=1488
                        i32.const 0
                        local.get 6
                        i32.store offset=1484
                        i32.const 0
                        local.get 0
                        i32.store offset=1480
                        i32.const 0
                        i32.const 0
                        i32.store offset=1492
                        local.get 9
                        i32.const 36
                        i32.add
                        local.set 4
                        loop ;; label = @11
                          local.get 4
                          i32.const 7
                          i32.store
                          local.get 4
                          i32.const 4
                          i32.add
                          local.tee 4
                          local.get 5
                          i32.lt_u
                          br_if 0 (;@11;)
                        end
                        local.get 9
                        local.get 3
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 9
                        local.get 9
                        i32.load offset=4
                        i32.const -2
                        i32.and
                        i32.store offset=4
                        local.get 9
                        local.get 9
                        local.get 3
                        i32.sub
                        local.tee 0
                        i32.store
                        local.get 3
                        local.get 0
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        block ;; label = @11
                          local.get 0
                          i32.const 255
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const -8
                          i32.and
                          i32.const 1072
                          i32.add
                          local.set 4
                          block ;; label = @12
                            block ;; label = @13
                              i32.const 0
                              i32.load offset=1032
                              local.tee 5
                              i32.const 1
                              local.get 0
                              i32.const 3
                              i32.shr_u
                              i32.shl
                              local.tee 0
                              i32.and
                              br_if 0 (;@13;)
                              i32.const 0
                              local.get 5
                              local.get 0
                              i32.or
                              i32.store offset=1032
                              local.get 4
                              local.set 5
                              br 1 (;@12;)
                            end
                            local.get 4
                            i32.load offset=8
                            local.set 5
                          end
                          local.get 5
                          local.get 3
                          i32.store offset=12
                          local.get 4
                          local.get 3
                          i32.store offset=8
                          local.get 3
                          local.get 4
                          i32.store offset=12
                          local.get 3
                          local.get 5
                          i32.store offset=8
                          br 1 (;@10;)
                        end
                        i32.const 31
                        local.set 4
                        block ;; label = @11
                          local.get 0
                          i32.const 16777215
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 38
                          local.get 0
                          i32.const 8
                          i32.shr_u
                          i32.clz
                          local.tee 4
                          i32.sub
                          i32.shr_u
                          i32.const 1
                          i32.and
                          local.get 4
                          i32.const 1
                          i32.shl
                          i32.sub
                          i32.const 62
                          i32.add
                          local.set 4
                        end
                        local.get 3
                        local.get 4
                        i32.store offset=28
                        local.get 3
                        i64.const 0
                        i64.store offset=16 align=4
                        local.get 4
                        i32.const 2
                        i32.shl
                        i32.const 1336
                        i32.add
                        local.set 5
                        block ;; label = @11
                          i32.const 0
                          i32.load offset=1036
                          local.tee 9
                          i32.const 1
                          local.get 4
                          i32.shl
                          local.tee 6
                          i32.and
                          br_if 0 (;@11;)
                          local.get 5
                          local.get 3
                          i32.store
                          i32.const 0
                          local.get 9
                          local.get 6
                          i32.or
                          i32.store offset=1036
                          local.get 3
                          local.get 5
                          i32.store offset=24
                          local.get 3
                          local.get 3
                          i32.store offset=8
                          local.get 3
                          local.get 3
                          i32.store offset=12
                          br 1 (;@10;)
                        end
                        local.get 0
                        i32.const 0
                        i32.const 25
                        local.get 4
                        i32.const 1
                        i32.shr_u
                        i32.sub
                        local.get 4
                        i32.const 31
                        i32.eq
                        select
                        i32.shl
                        local.set 4
                        local.get 5
                        i32.load
                        local.set 9
                        block ;; label = @11
                          loop ;; label = @12
                            local.get 9
                            local.tee 5
                            i32.load offset=4
                            i32.const -8
                            i32.and
                            local.get 0
                            i32.eq
                            br_if 1 (;@11;)
                            local.get 4
                            i32.const 29
                            i32.shr_u
                            local.set 9
                            local.get 4
                            i32.const 1
                            i32.shl
                            local.set 4
                            local.get 5
                            local.get 9
                            i32.const 4
                            i32.and
                            i32.add
                            i32.const 16
                            i32.add
                            local.tee 6
                            i32.load
                            local.tee 9
                            br_if 0 (;@12;)
                          end
                          local.get 6
                          local.get 3
                          i32.store
                          local.get 3
                          local.get 5
                          i32.store offset=24
                          local.get 3
                          local.get 3
                          i32.store offset=12
                          local.get 3
                          local.get 3
                          i32.store offset=8
                          br 1 (;@10;)
                        end
                        local.get 5
                        i32.load offset=8
                        local.tee 4
                        local.get 3
                        i32.store offset=12
                        local.get 5
                        local.get 3
                        i32.store offset=8
                        local.get 3
                        i32.const 0
                        i32.store offset=24
                        local.get 3
                        local.get 5
                        i32.store offset=12
                        local.get 3
                        local.get 4
                        i32.store offset=8
                      end
                      i32.const 0
                      i32.load offset=1044
                      local.tee 4
                      local.get 7
                      i32.le_u
                      br_if 0 (;@9;)
                      i32.const 0
                      i32.load offset=1056
                      local.tee 3
                      local.get 7
                      i32.add
                      local.tee 5
                      local.get 4
                      local.get 7
                      i32.sub
                      local.tee 4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      i32.const 0
                      local.get 4
                      i32.store offset=1044
                      i32.const 0
                      local.get 5
                      i32.store offset=1056
                      local.get 3
                      local.get 7
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 3
                      i32.const 8
                      i32.add
                      local.set 4
                      br 8 (;@1;)
                    end
                    i32.const 0
                    local.set 4
                    i32.const 0
                    i32.const 48
                    i32.store offset=1028
                    br 7 (;@1;)
                  end
                  i32.const 0
                  local.set 0
                end
                local.get 11
                i32.eqz
                br_if 0 (;@6;)
                block ;; label = @7
                  block ;; label = @8
                    local.get 6
                    local.get 6
                    i32.load offset=28
                    local.tee 5
                    i32.const 2
                    i32.shl
                    i32.const 1336
                    i32.add
                    local.tee 3
                    i32.load
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 3
                    local.get 0
                    i32.store
                    local.get 0
                    br_if 1 (;@7;)
                    i32.const 0
                    i32.const 0
                    i32.load offset=1036
                    i32.const -2
                    local.get 5
                    i32.rotl
                    i32.and
                    i32.store offset=1036
                    br 2 (;@6;)
                  end
                  local.get 11
                  i32.const 16
                  i32.const 20
                  local.get 11
                  i32.load offset=16
                  local.get 6
                  i32.eq
                  select
                  i32.add
                  local.get 0
                  i32.store
                  local.get 0
                  i32.eqz
                  br_if 1 (;@6;)
                end
                local.get 0
                local.get 11
                i32.store offset=24
                block ;; label = @7
                  local.get 6
                  i32.load offset=16
                  local.tee 3
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 0
                  local.get 3
                  i32.store offset=16
                  local.get 3
                  local.get 0
                  i32.store offset=24
                end
                local.get 6
                i32.const 20
                i32.add
                i32.load
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 0
                i32.const 20
                i32.add
                local.get 3
                i32.store
                local.get 3
                local.get 0
                i32.store offset=24
              end
              local.get 8
              local.get 4
              i32.add
              local.set 4
              local.get 6
              local.get 8
              i32.add
              local.tee 6
              i32.load offset=4
              local.set 3
            end
            local.get 6
            local.get 3
            i32.const -2
            i32.and
            i32.store offset=4
            local.get 7
            local.get 4
            i32.add
            local.get 4
            i32.store
            local.get 7
            local.get 4
            i32.const 1
            i32.or
            i32.store offset=4
            block ;; label = @5
              local.get 4
              i32.const 255
              i32.gt_u
              br_if 0 (;@5;)
              local.get 4
              i32.const -8
              i32.and
              i32.const 1072
              i32.add
              local.set 3
              block ;; label = @6
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1032
                  local.tee 5
                  i32.const 1
                  local.get 4
                  i32.const 3
                  i32.shr_u
                  i32.shl
                  local.tee 4
                  i32.and
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 5
                  local.get 4
                  i32.or
                  i32.store offset=1032
                  local.get 3
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 3
                i32.load offset=8
                local.set 4
              end
              local.get 4
              local.get 7
              i32.store offset=12
              local.get 3
              local.get 7
              i32.store offset=8
              local.get 7
              local.get 3
              i32.store offset=12
              local.get 7
              local.get 4
              i32.store offset=8
              br 1 (;@4;)
            end
            i32.const 31
            local.set 3
            block ;; label = @5
              local.get 4
              i32.const 16777215
              i32.gt_u
              br_if 0 (;@5;)
              local.get 4
              i32.const 38
              local.get 4
              i32.const 8
              i32.shr_u
              i32.clz
              local.tee 3
              i32.sub
              i32.shr_u
              i32.const 1
              i32.and
              local.get 3
              i32.const 1
              i32.shl
              i32.sub
              i32.const 62
              i32.add
              local.set 3
            end
            local.get 7
            local.get 3
            i32.store offset=28
            local.get 7
            i64.const 0
            i64.store offset=16 align=4
            local.get 3
            i32.const 2
            i32.shl
            i32.const 1336
            i32.add
            local.set 5
            block ;; label = @5
              i32.const 0
              i32.load offset=1036
              local.tee 0
              i32.const 1
              local.get 3
              i32.shl
              local.tee 9
              i32.and
              br_if 0 (;@5;)
              local.get 5
              local.get 7
              i32.store
              i32.const 0
              local.get 0
              local.get 9
              i32.or
              i32.store offset=1036
              local.get 7
              local.get 5
              i32.store offset=24
              local.get 7
              local.get 7
              i32.store offset=8
              local.get 7
              local.get 7
              i32.store offset=12
              br 1 (;@4;)
            end
            local.get 4
            i32.const 0
            i32.const 25
            local.get 3
            i32.const 1
            i32.shr_u
            i32.sub
            local.get 3
            i32.const 31
            i32.eq
            select
            i32.shl
            local.set 3
            local.get 5
            i32.load
            local.set 0
            block ;; label = @5
              loop ;; label = @6
                local.get 0
                local.tee 5
                i32.load offset=4
                i32.const -8
                i32.and
                local.get 4
                i32.eq
                br_if 1 (;@5;)
                local.get 3
                i32.const 29
                i32.shr_u
                local.set 0
                local.get 3
                i32.const 1
                i32.shl
                local.set 3
                local.get 5
                local.get 0
                i32.const 4
                i32.and
                i32.add
                i32.const 16
                i32.add
                local.tee 9
                i32.load
                local.tee 0
                br_if 0 (;@6;)
              end
              local.get 9
              local.get 7
              i32.store
              local.get 7
              local.get 5
              i32.store offset=24
              local.get 7
              local.get 7
              i32.store offset=12
              local.get 7
              local.get 7
              i32.store offset=8
              br 1 (;@4;)
            end
            local.get 5
            i32.load offset=8
            local.tee 4
            local.get 7
            i32.store offset=12
            local.get 5
            local.get 7
            i32.store offset=8
            local.get 7
            i32.const 0
            i32.store offset=24
            local.get 7
            local.get 5
            i32.store offset=12
            local.get 7
            local.get 4
            i32.store offset=8
          end
          local.get 2
          i32.const 8
          i32.add
          local.set 4
          br 2 (;@1;)
        end
        block ;; label = @3
          local.get 2
          i32.eqz
          br_if 0 (;@3;)
          block ;; label = @4
            block ;; label = @5
              local.get 9
              local.get 9
              i32.load offset=28
              local.tee 5
              i32.const 2
              i32.shl
              i32.const 1336
              i32.add
              local.tee 4
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 4
              local.get 0
              i32.store
              local.get 0
              br_if 1 (;@4;)
              i32.const 0
              local.get 11
              i32.const -2
              local.get 5
              i32.rotl
              i32.and
              local.tee 11
              i32.store offset=1036
              br 2 (;@3;)
            end
            local.get 2
            i32.const 16
            i32.const 20
            local.get 2
            i32.load offset=16
            local.get 9
            i32.eq
            select
            i32.add
            local.get 0
            i32.store
            local.get 0
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 2
          i32.store offset=24
          block ;; label = @4
            local.get 9
            i32.load offset=16
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 4
            i32.store offset=16
            local.get 4
            local.get 0
            i32.store offset=24
          end
          local.get 9
          i32.const 20
          i32.add
          i32.load
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.const 20
          i32.add
          local.get 4
          i32.store
          local.get 4
          local.get 0
          i32.store offset=24
        end
        block ;; label = @3
          block ;; label = @4
            local.get 3
            i32.const 15
            i32.gt_u
            br_if 0 (;@4;)
            local.get 9
            local.get 3
            local.get 7
            i32.add
            local.tee 4
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 9
            local.get 4
            i32.add
            local.tee 4
            local.get 4
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            br 1 (;@3;)
          end
          local.get 9
          local.get 7
          i32.add
          local.tee 0
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 9
          local.get 7
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          i32.add
          local.get 3
          i32.store
          block ;; label = @4
            local.get 3
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const -8
            i32.and
            i32.const 1072
            i32.add
            local.set 4
            block ;; label = @5
              block ;; label = @6
                i32.const 0
                i32.load offset=1032
                local.tee 5
                i32.const 1
                local.get 3
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 3
                i32.and
                br_if 0 (;@6;)
                i32.const 0
                local.get 5
                local.get 3
                i32.or
                i32.store offset=1032
                local.get 4
                local.set 3
                br 1 (;@5;)
              end
              local.get 4
              i32.load offset=8
              local.set 3
            end
            local.get 3
            local.get 0
            i32.store offset=12
            local.get 4
            local.get 0
            i32.store offset=8
            local.get 0
            local.get 4
            i32.store offset=12
            local.get 0
            local.get 3
            i32.store offset=8
            br 1 (;@3;)
          end
          i32.const 31
          local.set 4
          block ;; label = @4
            local.get 3
            i32.const 16777215
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const 38
            local.get 3
            i32.const 8
            i32.shr_u
            i32.clz
            local.tee 4
            i32.sub
            i32.shr_u
            i32.const 1
            i32.and
            local.get 4
            i32.const 1
            i32.shl
            i32.sub
            i32.const 62
            i32.add
            local.set 4
          end
          local.get 0
          local.get 4
          i32.store offset=28
          local.get 0
          i64.const 0
          i64.store offset=16 align=4
          local.get 4
          i32.const 2
          i32.shl
          i32.const 1336
          i32.add
          local.set 5
          block ;; label = @4
            local.get 11
            i32.const 1
            local.get 4
            i32.shl
            local.tee 7
            i32.and
            br_if 0 (;@4;)
            local.get 5
            local.get 0
            i32.store
            i32.const 0
            local.get 11
            local.get 7
            i32.or
            i32.store offset=1036
            local.get 0
            local.get 5
            i32.store offset=24
            local.get 0
            local.get 0
            i32.store offset=8
            local.get 0
            local.get 0
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 3
          i32.const 0
          i32.const 25
          local.get 4
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 4
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 4
          local.get 5
          i32.load
          local.set 7
          block ;; label = @4
            loop ;; label = @5
              local.get 7
              local.tee 5
              i32.load offset=4
              i32.const -8
              i32.and
              local.get 3
              i32.eq
              br_if 1 (;@4;)
              local.get 4
              i32.const 29
              i32.shr_u
              local.set 7
              local.get 4
              i32.const 1
              i32.shl
              local.set 4
              local.get 5
              local.get 7
              i32.const 4
              i32.and
              i32.add
              i32.const 16
              i32.add
              local.tee 6
              i32.load
              local.tee 7
              br_if 0 (;@5;)
            end
            local.get 6
            local.get 0
            i32.store
            local.get 0
            local.get 5
            i32.store offset=24
            local.get 0
            local.get 0
            i32.store offset=12
            local.get 0
            local.get 0
            i32.store offset=8
            br 1 (;@3;)
          end
          local.get 5
          i32.load offset=8
          local.tee 4
          local.get 0
          i32.store offset=12
          local.get 5
          local.get 0
          i32.store offset=8
          local.get 0
          i32.const 0
          i32.store offset=24
          local.get 0
          local.get 5
          i32.store offset=12
          local.get 0
          local.get 4
          i32.store offset=8
        end
        local.get 9
        i32.const 8
        i32.add
        local.set 4
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 11
        i32.eqz
        br_if 0 (;@2;)
        block ;; label = @3
          block ;; label = @4
            local.get 0
            local.get 0
            i32.load offset=28
            local.tee 5
            i32.const 2
            i32.shl
            i32.const 1336
            i32.add
            local.tee 4
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 4
            local.get 9
            i32.store
            local.get 9
            br_if 1 (;@3;)
            i32.const 0
            local.get 10
            i32.const -2
            local.get 5
            i32.rotl
            i32.and
            i32.store offset=1036
            br 2 (;@2;)
          end
          local.get 11
          i32.const 16
          i32.const 20
          local.get 11
          i32.load offset=16
          local.get 0
          i32.eq
          select
          i32.add
          local.get 9
          i32.store
          local.get 9
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 9
        local.get 11
        i32.store offset=24
        block ;; label = @3
          local.get 0
          i32.load offset=16
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 9
          local.get 4
          i32.store offset=16
          local.get 4
          local.get 9
          i32.store offset=24
        end
        local.get 0
        i32.const 20
        i32.add
        i32.load
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 9
        i32.const 20
        i32.add
        local.get 4
        i32.store
        local.get 4
        local.get 9
        i32.store offset=24
      end
      block ;; label = @2
        block ;; label = @3
          local.get 3
          i32.const 15
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          local.get 7
          i32.add
          local.tee 4
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          local.get 4
          i32.add
          local.tee 4
          local.get 4
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          br 1 (;@2;)
        end
        local.get 0
        local.get 7
        i32.add
        local.tee 5
        local.get 3
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 0
        local.get 7
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 5
        local.get 3
        i32.add
        local.get 3
        i32.store
        block ;; label = @3
          local.get 8
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          i32.const -8
          i32.and
          i32.const 1072
          i32.add
          local.set 7
          i32.const 0
          i32.load offset=1052
          local.set 4
          block ;; label = @4
            block ;; label = @5
              i32.const 1
              local.get 8
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 9
              local.get 6
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 9
              local.get 6
              i32.or
              i32.store offset=1032
              local.get 7
              local.set 9
              br 1 (;@4;)
            end
            local.get 7
            i32.load offset=8
            local.set 9
          end
          local.get 9
          local.get 4
          i32.store offset=12
          local.get 7
          local.get 4
          i32.store offset=8
          local.get 4
          local.get 7
          i32.store offset=12
          local.get 4
          local.get 9
          i32.store offset=8
        end
        i32.const 0
        local.get 5
        i32.store offset=1052
        i32.const 0
        local.get 3
        i32.store offset=1040
      end
      local.get 0
      i32.const 8
      i32.add
      local.set 4
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4
  )
  (func $free (;9;) (type 3) (param i32)
    local.get 0
    call $dlfree
  )
  (func $dlfree (;10;) (type 3) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const -8
      i32.add
      local.tee 1
      local.get 0
      i32.const -4
      i32.add
      i32.load
      local.tee 2
      i32.const -8
      i32.and
      local.tee 0
      i32.add
      local.set 3
      block ;; label = @2
        local.get 2
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 2
        i32.const 3
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 1
        i32.load
        local.tee 2
        i32.sub
        local.tee 1
        i32.const 0
        i32.load offset=1048
        local.tee 4
        i32.lt_u
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        i32.add
        local.set 0
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 1
              i32.const 0
              i32.load offset=1052
              i32.eq
              br_if 0 (;@5;)
              block ;; label = @6
                local.get 2
                i32.const 255
                i32.gt_u
                br_if 0 (;@6;)
                local.get 1
                i32.load offset=8
                local.tee 4
                local.get 2
                i32.const 3
                i32.shr_u
                local.tee 5
                i32.const 3
                i32.shl
                i32.const 1072
                i32.add
                local.tee 6
                i32.eq
                drop
                block ;; label = @7
                  local.get 1
                  i32.load offset=12
                  local.tee 2
                  local.get 4
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.const 0
                  i32.load offset=1032
                  i32.const -2
                  local.get 5
                  i32.rotl
                  i32.and
                  i32.store offset=1032
                  br 5 (;@2;)
                end
                local.get 2
                local.get 6
                i32.eq
                drop
                local.get 2
                local.get 4
                i32.store offset=8
                local.get 4
                local.get 2
                i32.store offset=12
                br 4 (;@2;)
              end
              local.get 1
              i32.load offset=24
              local.set 7
              block ;; label = @6
                local.get 1
                i32.load offset=12
                local.tee 6
                local.get 1
                i32.eq
                br_if 0 (;@6;)
                local.get 1
                i32.load offset=8
                local.tee 2
                local.get 4
                i32.lt_u
                drop
                local.get 6
                local.get 2
                i32.store offset=8
                local.get 2
                local.get 6
                i32.store offset=12
                br 3 (;@3;)
              end
              block ;; label = @6
                local.get 1
                i32.const 20
                i32.add
                local.tee 4
                i32.load
                local.tee 2
                br_if 0 (;@6;)
                local.get 1
                i32.load offset=16
                local.tee 2
                i32.eqz
                br_if 2 (;@4;)
                local.get 1
                i32.const 16
                i32.add
                local.set 4
              end
              loop ;; label = @6
                local.get 4
                local.set 5
                local.get 2
                local.tee 6
                i32.const 20
                i32.add
                local.tee 4
                i32.load
                local.tee 2
                br_if 0 (;@6;)
                local.get 6
                i32.const 16
                i32.add
                local.set 4
                local.get 6
                i32.load offset=16
                local.tee 2
                br_if 0 (;@6;)
              end
              local.get 5
              i32.const 0
              i32.store
              br 2 (;@3;)
            end
            local.get 3
            i32.load offset=4
            local.tee 2
            i32.const 3
            i32.and
            i32.const 3
            i32.ne
            br_if 2 (;@2;)
            local.get 3
            local.get 2
            i32.const -2
            i32.and
            i32.store offset=4
            i32.const 0
            local.get 0
            i32.store offset=1040
            local.get 3
            local.get 0
            i32.store
            local.get 1
            local.get 0
            i32.const 1
            i32.or
            i32.store offset=4
            return
          end
          i32.const 0
          local.set 6
        end
        local.get 7
        i32.eqz
        br_if 0 (;@2;)
        block ;; label = @3
          block ;; label = @4
            local.get 1
            local.get 1
            i32.load offset=28
            local.tee 4
            i32.const 2
            i32.shl
            i32.const 1336
            i32.add
            local.tee 2
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 2
            local.get 6
            i32.store
            local.get 6
            br_if 1 (;@3;)
            i32.const 0
            i32.const 0
            i32.load offset=1036
            i32.const -2
            local.get 4
            i32.rotl
            i32.and
            i32.store offset=1036
            br 2 (;@2;)
          end
          local.get 7
          i32.const 16
          i32.const 20
          local.get 7
          i32.load offset=16
          local.get 1
          i32.eq
          select
          i32.add
          local.get 6
          i32.store
          local.get 6
          i32.eqz
          br_if 1 (;@2;)
        end
        local.get 6
        local.get 7
        i32.store offset=24
        block ;; label = @3
          local.get 1
          i32.load offset=16
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          local.get 2
          i32.store offset=16
          local.get 2
          local.get 6
          i32.store offset=24
        end
        local.get 1
        i32.const 20
        i32.add
        i32.load
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.const 20
        i32.add
        local.get 2
        i32.store
        local.get 2
        local.get 6
        i32.store offset=24
      end
      local.get 1
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=4
      local.tee 2
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 2
                i32.const 2
                i32.and
                br_if 0 (;@6;)
                block ;; label = @7
                  local.get 3
                  i32.const 0
                  i32.load offset=1056
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 1
                  i32.store offset=1056
                  i32.const 0
                  i32.const 0
                  i32.load offset=1044
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store offset=1044
                  local.get 1
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 1
                  i32.const 0
                  i32.load offset=1052
                  i32.ne
                  br_if 6 (;@1;)
                  i32.const 0
                  i32.const 0
                  i32.store offset=1040
                  i32.const 0
                  i32.const 0
                  i32.store offset=1052
                  return
                end
                block ;; label = @7
                  local.get 3
                  i32.const 0
                  i32.load offset=1052
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 1
                  i32.store offset=1052
                  i32.const 0
                  i32.const 0
                  i32.load offset=1040
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store offset=1040
                  local.get 1
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 1
                  local.get 0
                  i32.add
                  local.get 0
                  i32.store
                  return
                end
                local.get 2
                i32.const -8
                i32.and
                local.get 0
                i32.add
                local.set 0
                block ;; label = @7
                  local.get 2
                  i32.const 255
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  local.get 2
                  i32.const 3
                  i32.shr_u
                  local.tee 5
                  i32.const 3
                  i32.shl
                  i32.const 1072
                  i32.add
                  local.tee 6
                  i32.eq
                  drop
                  block ;; label = @8
                    local.get 3
                    i32.load offset=12
                    local.tee 2
                    local.get 4
                    i32.ne
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.const 0
                    i32.load offset=1032
                    i32.const -2
                    local.get 5
                    i32.rotl
                    i32.and
                    i32.store offset=1032
                    br 5 (;@3;)
                  end
                  local.get 2
                  local.get 6
                  i32.eq
                  drop
                  local.get 2
                  local.get 4
                  i32.store offset=8
                  local.get 4
                  local.get 2
                  i32.store offset=12
                  br 4 (;@3;)
                end
                local.get 3
                i32.load offset=24
                local.set 7
                block ;; label = @7
                  local.get 3
                  i32.load offset=12
                  local.tee 6
                  local.get 3
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=8
                  local.tee 2
                  i32.const 0
                  i32.load offset=1048
                  i32.lt_u
                  drop
                  local.get 6
                  local.get 2
                  i32.store offset=8
                  local.get 2
                  local.get 6
                  i32.store offset=12
                  br 3 (;@4;)
                end
                block ;; label = @7
                  local.get 3
                  i32.const 20
                  i32.add
                  local.tee 4
                  i32.load
                  local.tee 2
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=16
                  local.tee 2
                  i32.eqz
                  br_if 2 (;@5;)
                  local.get 3
                  i32.const 16
                  i32.add
                  local.set 4
                end
                loop ;; label = @7
                  local.get 4
                  local.set 5
                  local.get 2
                  local.tee 6
                  i32.const 20
                  i32.add
                  local.tee 4
                  i32.load
                  local.tee 2
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 16
                  i32.add
                  local.set 4
                  local.get 6
                  i32.load offset=16
                  local.tee 2
                  br_if 0 (;@7;)
                end
                local.get 5
                i32.const 0
                i32.store
                br 2 (;@4;)
              end
              local.get 3
              local.get 2
              i32.const -2
              i32.and
              i32.store offset=4
              local.get 1
              local.get 0
              i32.add
              local.get 0
              i32.store
              local.get 1
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              br 3 (;@2;)
            end
            i32.const 0
            local.set 6
          end
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          block ;; label = @4
            block ;; label = @5
              local.get 3
              local.get 3
              i32.load offset=28
              local.tee 4
              i32.const 2
              i32.shl
              i32.const 1336
              i32.add
              local.tee 2
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 2
              local.get 6
              i32.store
              local.get 6
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=1036
              i32.const -2
              local.get 4
              i32.rotl
              i32.and
              i32.store offset=1036
              br 2 (;@3;)
            end
            local.get 7
            i32.const 16
            i32.const 20
            local.get 7
            i32.load offset=16
            local.get 3
            i32.eq
            select
            i32.add
            local.get 6
            i32.store
            local.get 6
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 6
          local.get 7
          i32.store offset=24
          block ;; label = @4
            local.get 3
            i32.load offset=16
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 2
            i32.store offset=16
            local.get 2
            local.get 6
            i32.store offset=24
          end
          local.get 3
          i32.const 20
          i32.add
          i32.load
          local.tee 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          i32.const 20
          i32.add
          local.get 2
          i32.store
          local.get 2
          local.get 6
          i32.store offset=24
        end
        local.get 1
        local.get 0
        i32.add
        local.get 0
        i32.store
        local.get 1
        local.get 0
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 1
        i32.const 0
        i32.load offset=1052
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.get 0
        i32.store offset=1040
        return
      end
      block ;; label = @2
        local.get 0
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.and
        i32.const 1072
        i32.add
        local.set 2
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=1032
            local.tee 4
            i32.const 1
            local.get 0
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 0
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 4
            local.get 0
            i32.or
            i32.store offset=1032
            local.get 2
            local.set 0
            br 1 (;@3;)
          end
          local.get 2
          i32.load offset=8
          local.set 0
        end
        local.get 0
        local.get 1
        i32.store offset=12
        local.get 2
        local.get 1
        i32.store offset=8
        local.get 1
        local.get 2
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
        return
      end
      i32.const 31
      local.set 2
      block ;; label = @2
        local.get 0
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 38
        local.get 0
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 2
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 2
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 2
      end
      local.get 1
      local.get 2
      i32.store offset=28
      local.get 1
      i64.const 0
      i64.store offset=16 align=4
      local.get 2
      i32.const 2
      i32.shl
      i32.const 1336
      i32.add
      local.set 4
      block ;; label = @2
        block ;; label = @3
          i32.const 0
          i32.load offset=1036
          local.tee 6
          i32.const 1
          local.get 2
          i32.shl
          local.tee 3
          i32.and
          br_if 0 (;@3;)
          local.get 4
          local.get 1
          i32.store
          i32.const 0
          local.get 6
          local.get 3
          i32.or
          i32.store offset=1036
          local.get 1
          local.get 4
          i32.store offset=24
          local.get 1
          local.get 1
          i32.store offset=8
          local.get 1
          local.get 1
          i32.store offset=12
          br 1 (;@2;)
        end
        local.get 0
        i32.const 0
        i32.const 25
        local.get 2
        i32.const 1
        i32.shr_u
        i32.sub
        local.get 2
        i32.const 31
        i32.eq
        select
        i32.shl
        local.set 2
        local.get 4
        i32.load
        local.set 6
        block ;; label = @3
          loop ;; label = @4
            local.get 6
            local.tee 4
            i32.load offset=4
            i32.const -8
            i32.and
            local.get 0
            i32.eq
            br_if 1 (;@3;)
            local.get 2
            i32.const 29
            i32.shr_u
            local.set 6
            local.get 2
            i32.const 1
            i32.shl
            local.set 2
            local.get 4
            local.get 6
            i32.const 4
            i32.and
            i32.add
            i32.const 16
            i32.add
            local.tee 3
            i32.load
            local.tee 6
            br_if 0 (;@4;)
          end
          local.get 3
          local.get 1
          i32.store
          local.get 1
          local.get 4
          i32.store offset=24
          local.get 1
          local.get 1
          i32.store offset=12
          local.get 1
          local.get 1
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 4
        i32.load offset=8
        local.tee 0
        local.get 1
        i32.store offset=12
        local.get 4
        local.get 1
        i32.store offset=8
        local.get 1
        i32.const 0
        i32.store offset=24
        local.get 1
        local.get 4
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
      end
      i32.const 0
      i32.const 0
      i32.load offset=1064
      i32.const -1
      i32.add
      local.tee 1
      i32.const -1
      local.get 1
      select
      i32.store offset=1064
    end
  )
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global $__stack_pointer (;0;) (mut i32) i32.const 67072)
  (global $GOT.data.internal.__memory_base (;1;) i32 i32.const 0)
  (export "memory" (memory 0))
  (export "_initialize" (func $_initialize))
  (export "get_num" (func $get_num))
  (export "get_str" (func $get_str))
  (export "get_arr" (func $get_arr))
  (export "malloc" (func $malloc))
  (export "free" (func $free))
  (@producers
    (processed-by "clang" "17.0.6")
  )
)
