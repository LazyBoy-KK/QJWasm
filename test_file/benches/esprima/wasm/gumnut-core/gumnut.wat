(module $gumnut.wasm
  (type (;0;) (func (param i32 i32)))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func))
  (type (;3;) (func (param i32)))
  (type (;4;) (func (param i32 i32) (result i32)))
  (type (;5;) (func (result i32)))
  (type (;6;) (func (param i32 i32 i32) (result i32)))
  (import "env" "consoleLog" (func $consoleLog (;0;) (type 0)))
  (import "env" "parserOpen" (func $blep_parser_open (;1;) (type 1)))
  (import "env" "parserCallback" (func $blep_parser_callback (;2;) (type 2)))
  (import "env" "parserClose" (func $blep_parser_close (;3;) (type 3)))
  (func $__wasm_call_ctors (;4;) (type 2))
  (func $_initialize (;5;) (type 2)
    block ;; label = @1
      global.get $GOT.data.internal.__memory_base
      i32.const 1604
      i32.add
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      unreachable
      unreachable
    end
    global.get $GOT.data.internal.__memory_base
    i32.const 1604
    i32.add
    i32.const 1
    i32.store
    call $__wasm_call_ctors
  )
  (func $consume_known_lit (;6;) (type 4) (param i32 i32) (result i32)
    (local i32)
    i32.const 0
    local.set 2
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
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            local.get 0
                                            i32.load8_u
                                            i32.const -97
                                            i32.add
                                            br_table 0 (;@20;) 1 (;@19;) 2 (;@18;) 3 (;@17;) 4 (;@16;) 5 (;@15;) 6 (;@14;) 19 (;@1;) 7 (;@13;) 19 (;@1;) 19 (;@1;) 8 (;@12;) 19 (;@1;) 9 (;@11;) 10 (;@10;) 11 (;@9;) 19 (;@1;) 12 (;@8;) 13 (;@7;) 14 (;@6;) 15 (;@5;) 16 (;@4;) 17 (;@3;) 19 (;@1;) 18 (;@2;) 19 (;@1;)
                                          end
                                          i32.const 1
                                          local.set 2
                                          block ;; label = @20
                                            block ;; label = @21
                                              local.get 0
                                              i32.load8_u offset=1
                                              i32.const -115
                                              i32.add
                                              br_table 0 (;@21;) 20 (;@1;) 20 (;@1;) 20 (;@1;) 1 (;@20;) 20 (;@1;)
                                            end
                                            block ;; label = @21
                                              block ;; label = @22
                                                block ;; label = @23
                                                  local.get 0
                                                  i32.load8_u offset=2
                                                  i32.const -115
                                                  i32.add
                                                  br_table 0 (;@23;) 2 (;@21;) 2 (;@21;) 2 (;@21;) 2 (;@21;) 2 (;@21;) 1 (;@22;) 2 (;@21;)
                                                end
                                                block ;; label = @23
                                                  block ;; label = @24
                                                    block ;; label = @25
                                                      local.get 0
                                                      i32.load8_u offset=3
                                                      i32.const 101
                                                      i32.eq
                                                      br_if 0 (;@25;)
                                                      local.get 0
                                                      i32.const 4
                                                      i32.add
                                                      local.set 2
                                                      br 1 (;@24;)
                                                    end
                                                    block ;; label = @25
                                                      local.get 0
                                                      i32.load8_u offset=4
                                                      i32.const 114
                                                      i32.eq
                                                      br_if 0 (;@25;)
                                                      local.get 0
                                                      i32.const 5
                                                      i32.add
                                                      local.set 2
                                                      br 1 (;@24;)
                                                    end
                                                    local.get 0
                                                    i32.load8_u offset=5
                                                    i32.const 116
                                                    i32.eq
                                                    br_if 1 (;@23;)
                                                    local.get 0
                                                    i32.const 6
                                                    i32.add
                                                    local.set 2
                                                  end
                                                  local.get 2
                                                  local.get 0
                                                  i32.const -1
                                                  i32.xor
                                                  i32.add
                                                  return
                                                end
                                                local.get 1
                                                i32.const 1102283776
                                                i32.store
                                                i32.const 6
                                                return
                                              end
                                              block ;; label = @22
                                                block ;; label = @23
                                                  block ;; label = @24
                                                    local.get 0
                                                    i32.load8_u offset=3
                                                    i32.const 110
                                                    i32.eq
                                                    br_if 0 (;@24;)
                                                    local.get 0
                                                    i32.const 4
                                                    i32.add
                                                    local.set 2
                                                    br 1 (;@23;)
                                                  end
                                                  local.get 0
                                                  i32.load8_u offset=4
                                                  i32.const 99
                                                  i32.eq
                                                  br_if 1 (;@22;)
                                                  local.get 0
                                                  i32.const 5
                                                  i32.add
                                                  local.set 2
                                                end
                                                local.get 2
                                                local.get 0
                                                i32.const -1
                                                i32.xor
                                                i32.add
                                                return
                                              end
                                              local.get 1
                                              i32.const 1098089472
                                              i32.store
                                              i32.const 5
                                              return
                                            end
                                            local.get 1
                                            i32.const 1085506560
                                            i32.store
                                            i32.const 2
                                            return
                                          end
                                          block ;; label = @20
                                            block ;; label = @21
                                              block ;; label = @22
                                                local.get 0
                                                i32.load8_u offset=2
                                                i32.const 97
                                                i32.eq
                                                br_if 0 (;@22;)
                                                local.get 0
                                                i32.const 3
                                                i32.add
                                                local.set 2
                                                br 1 (;@21;)
                                              end
                                              block ;; label = @22
                                                local.get 0
                                                i32.load8_u offset=3
                                                i32.const 105
                                                i32.eq
                                                br_if 0 (;@22;)
                                                local.get 0
                                                i32.const 4
                                                i32.add
                                                local.set 2
                                                br 1 (;@21;)
                                              end
                                              local.get 0
                                              i32.load8_u offset=4
                                              i32.const 116
                                              i32.eq
                                              br_if 1 (;@20;)
                                              local.get 0
                                              i32.const 5
                                              i32.add
                                              local.set 2
                                            end
                                            local.get 2
                                            local.get 0
                                            i32.const -1
                                            i32.xor
                                            i32.add
                                            return
                                          end
                                          local.get 1
                                          i32.const 1098351621
                                          i32.store
                                          i32.const 5
                                          return
                                        end
                                        block ;; label = @19
                                          block ;; label = @20
                                            block ;; label = @21
                                              local.get 0
                                              i32.load8_u offset=1
                                              i32.const 114
                                              i32.eq
                                              br_if 0 (;@21;)
                                              local.get 0
                                              i32.const 2
                                              i32.add
                                              local.set 2
                                              br 1 (;@20;)
                                            end
                                            block ;; label = @21
                                              local.get 0
                                              i32.load8_u offset=2
                                              i32.const 101
                                              i32.eq
                                              br_if 0 (;@21;)
                                              local.get 0
                                              i32.const 3
                                              i32.add
                                              local.set 2
                                              br 1 (;@20;)
                                            end
                                            block ;; label = @21
                                              local.get 0
                                              i32.load8_u offset=3
                                              i32.const 97
                                              i32.eq
                                              br_if 0 (;@21;)
                                              local.get 0
                                              i32.const 4
                                              i32.add
                                              local.set 2
                                              br 1 (;@20;)
                                            end
                                            local.get 0
                                            i32.load8_u offset=4
                                            i32.const 107
                                            i32.eq
                                            br_if 1 (;@19;)
                                            local.get 0
                                            i32.const 5
                                            i32.add
                                            local.set 2
                                          end
                                          local.get 2
                                          local.get 0
                                          i32.const -1
                                          i32.xor
                                          i32.add
                                          return
                                        end
                                        local.get 1
                                        i32.const 1098024961
                                        i32.store
                                        i32.const 5
                                        return
                                      end
                                      i32.const 1
                                      local.set 2
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            local.get 0
                                            i32.load8_u offset=1
                                            i32.const -97
                                            i32.add
                                            br_table 0 (;@20;) 19 (;@1;) 19 (;@1;) 19 (;@1;) 19 (;@1;) 19 (;@1;) 19 (;@1;) 19 (;@1;) 19 (;@1;) 19 (;@1;) 19 (;@1;) 1 (;@19;) 19 (;@1;) 19 (;@1;) 2 (;@18;) 19 (;@1;)
                                          end
                                          i32.const 2
                                          local.set 2
                                          block ;; label = @20
                                            block ;; label = @21
                                              local.get 0
                                              i32.load8_u offset=2
                                              i32.const -115
                                              i32.add
                                              br_table 0 (;@21;) 1 (;@20;) 20 (;@1;)
                                            end
                                            i32.const 3
                                            local.set 2
                                            local.get 0
                                            i32.load8_u offset=3
                                            i32.const 101
                                            i32.ne
                                            br_if 19 (;@1;)
                                            local.get 1
                                            i32.const 1092717577
                                            i32.store
                                            i32.const 4
                                            return
                                          end
                                          block ;; label = @20
                                            block ;; label = @21
                                              block ;; label = @22
                                                local.get 0
                                                i32.load8_u offset=3
                                                i32.const 99
                                                i32.eq
                                                br_if 0 (;@22;)
                                                local.get 0
                                                i32.const 4
                                                i32.add
                                                local.set 2
                                                br 1 (;@21;)
                                              end
                                              local.get 0
                                              i32.load8_u offset=4
                                              i32.const 104
                                              i32.eq
                                              br_if 1 (;@20;)
                                              local.get 0
                                              i32.const 5
                                              i32.add
                                              local.set 2
                                            end
                                            local.get 2
                                            local.get 0
                                            i32.const -1
                                            i32.xor
                                            i32.add
                                            return
                                          end
                                          local.get 1
                                          i32.const 1096912065
                                          i32.store
                                          i32.const 5
                                          return
                                        end
                                        block ;; label = @19
                                          block ;; label = @20
                                            block ;; label = @21
                                              local.get 0
                                              i32.load8_u offset=2
                                              i32.const 97
                                              i32.eq
                                              br_if 0 (;@21;)
                                              local.get 0
                                              i32.const 3
                                              i32.add
                                              local.set 2
                                              br 1 (;@20;)
                                            end
                                            block ;; label = @21
                                              local.get 0
                                              i32.load8_u offset=3
                                              i32.const 115
                                              i32.eq
                                              br_if 0 (;@21;)
                                              local.get 0
                                              i32.const 4
                                              i32.add
                                              local.set 2
                                              br 1 (;@20;)
                                            end
                                            local.get 0
                                            i32.load8_u offset=4
                                            i32.const 115
                                            i32.eq
                                            br_if 1 (;@19;)
                                            local.get 0
                                            i32.const 5
                                            i32.add
                                            local.set 2
                                          end
                                          local.get 2
                                          local.get 0
                                          i32.const -1
                                          i32.xor
                                          i32.add
                                          return
                                        end
                                        local.get 1
                                        i32.const 1097632769
                                        i32.store
                                        i32.const 5
                                        return
                                      end
                                      i32.const 2
                                      local.set 2
                                      local.get 0
                                      i32.load8_u offset=2
                                      i32.const 110
                                      i32.ne
                                      br_if 16 (;@1;)
                                      i32.const 3
                                      local.set 2
                                      block ;; label = @18
                                        block ;; label = @19
                                          local.get 0
                                          i32.load8_u offset=3
                                          i32.const -115
                                          i32.add
                                          br_table 0 (;@19;) 1 (;@18;) 18 (;@1;)
                                        end
                                        i32.const 4
                                        local.set 2
                                        local.get 0
                                        i32.load8_u offset=4
                                        i32.const 116
                                        i32.ne
                                        br_if 17 (;@1;)
                                        local.get 1
                                        i32.const 1097829409
                                        i32.store
                                        i32.const 5
                                        return
                                      end
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            local.get 0
                                            i32.load8_u offset=4
                                            i32.const 105
                                            i32.eq
                                            br_if 0 (;@20;)
                                            local.get 0
                                            i32.const 5
                                            i32.add
                                            local.set 2
                                            br 1 (;@19;)
                                          end
                                          block ;; label = @20
                                            local.get 0
                                            i32.load8_u offset=5
                                            i32.const 110
                                            i32.eq
                                            br_if 0 (;@20;)
                                            local.get 0
                                            i32.const 6
                                            i32.add
                                            local.set 2
                                            br 1 (;@19;)
                                          end
                                          block ;; label = @20
                                            local.get 0
                                            i32.load8_u offset=6
                                            i32.const 117
                                            i32.eq
                                            br_if 0 (;@20;)
                                            local.get 0
                                            i32.const 7
                                            i32.add
                                            local.set 2
                                            br 1 (;@19;)
                                          end
                                          local.get 0
                                          i32.load8_u offset=7
                                          i32.const 101
                                          i32.eq
                                          br_if 1 (;@18;)
                                          local.get 0
                                          i32.const 8
                                          i32.add
                                          local.set 2
                                        end
                                        local.get 2
                                        local.get 0
                                        i32.const -1
                                        i32.xor
                                        i32.add
                                        return
                                      end
                                      local.get 1
                                      i32.const 1110412289
                                      i32.store
                                      i32.const 8
                                      return
                                    end
                                    i32.const 1
                                    local.set 2
                                    block ;; label = @17
                                      block ;; label = @18
                                        local.get 0
                                        i32.load8_u offset=1
                                        i32.const -101
                                        i32.add
                                        br_table 0 (;@18;) 17 (;@1;) 17 (;@1;) 17 (;@1;) 17 (;@1;) 17 (;@1;) 17 (;@1;) 17 (;@1;) 17 (;@1;) 17 (;@1;) 1 (;@17;) 17 (;@1;)
                                      end
                                      i32.const 2
                                      local.set 2
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            local.get 0
                                            i32.load8_u offset=2
                                            i32.const -98
                                            i32.add
                                            br_table 0 (;@20;) 19 (;@1;) 19 (;@1;) 19 (;@1;) 1 (;@19;) 19 (;@1;) 19 (;@1;) 19 (;@1;) 19 (;@1;) 19 (;@1;) 2 (;@18;) 19 (;@1;)
                                          end
                                          block ;; label = @20
                                            block ;; label = @21
                                              block ;; label = @22
                                                local.get 0
                                                i32.load8_u offset=3
                                                i32.const 117
                                                i32.eq
                                                br_if 0 (;@22;)
                                                local.get 0
                                                i32.const 4
                                                i32.add
                                                local.set 2
                                                br 1 (;@21;)
                                              end
                                              block ;; label = @22
                                                local.get 0
                                                i32.load8_u offset=4
                                                i32.const 103
                                                i32.eq
                                                br_if 0 (;@22;)
                                                local.get 0
                                                i32.const 5
                                                i32.add
                                                local.set 2
                                                br 1 (;@21;)
                                              end
                                              block ;; label = @22
                                                local.get 0
                                                i32.load8_u offset=5
                                                i32.const 103
                                                i32.eq
                                                br_if 0 (;@22;)
                                                local.get 0
                                                i32.const 6
                                                i32.add
                                                local.set 2
                                                br 1 (;@21;)
                                              end
                                              block ;; label = @22
                                                local.get 0
                                                i32.load8_u offset=6
                                                i32.const 101
                                                i32.eq
                                                br_if 0 (;@22;)
                                                local.get 0
                                                i32.const 7
                                                i32.add
                                                local.set 2
                                                br 1 (;@21;)
                                              end
                                              local.get 0
                                              i32.load8_u offset=7
                                              i32.const 114
                                              i32.eq
                                              br_if 1 (;@20;)
                                              local.get 0
                                              i32.const 8
                                              i32.add
                                              local.set 2
                                            end
                                            local.get 2
                                            local.get 0
                                            i32.const -1
                                            i32.xor
                                            i32.add
                                            return
                                          end
                                          local.get 1
                                          i32.const 1109757953
                                          i32.store
                                          i32.const 8
                                          return
                                        end
                                        block ;; label = @19
                                          block ;; label = @20
                                            block ;; label = @21
                                              local.get 0
                                              i32.load8_u offset=3
                                              i32.const 97
                                              i32.eq
                                              br_if 0 (;@21;)
                                              local.get 0
                                              i32.const 4
                                              i32.add
                                              local.set 2
                                              br 1 (;@20;)
                                            end
                                            block ;; label = @21
                                              local.get 0
                                              i32.load8_u offset=4
                                              i32.const 117
                                              i32.eq
                                              br_if 0 (;@21;)
                                              local.get 0
                                              i32.const 5
                                              i32.add
                                              local.set 2
                                              br 1 (;@20;)
                                            end
                                            block ;; label = @21
                                              local.get 0
                                              i32.load8_u offset=5
                                              i32.const 108
                                              i32.eq
                                              br_if 0 (;@21;)
                                              local.get 0
                                              i32.const 6
                                              i32.add
                                              local.set 2
                                              br 1 (;@20;)
                                            end
                                            local.get 0
                                            i32.load8_u offset=6
                                            i32.const 116
                                            i32.eq
                                            br_if 1 (;@19;)
                                            local.get 0
                                            i32.const 7
                                            i32.add
                                            local.set 2
                                          end
                                          local.get 2
                                          local.get 0
                                          i32.const -1
                                          i32.xor
                                          i32.add
                                          return
                                        end
                                        local.get 1
                                        i32.const 1105563657
                                        i32.store
                                        i32.const 7
                                        return
                                      end
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            local.get 0
                                            i32.load8_u offset=3
                                            i32.const 101
                                            i32.eq
                                            br_if 0 (;@20;)
                                            local.get 0
                                            i32.const 4
                                            i32.add
                                            local.set 2
                                            br 1 (;@19;)
                                          end
                                          block ;; label = @20
                                            local.get 0
                                            i32.load8_u offset=4
                                            i32.const 116
                                            i32.eq
                                            br_if 0 (;@20;)
                                            local.get 0
                                            i32.const 5
                                            i32.add
                                            local.set 2
                                            br 1 (;@19;)
                                          end
                                          local.get 0
                                          i32.load8_u offset=5
                                          i32.const 101
                                          i32.eq
                                          br_if 1 (;@18;)
                                          local.get 0
                                          i32.const 6
                                          i32.add
                                          local.set 2
                                        end
                                        local.get 2
                                        local.get 0
                                        i32.const -1
                                        i32.xor
                                        i32.add
                                        return
                                      end
                                      local.get 1
                                      i32.const 1101369349
                                      i32.store
                                      i32.const 6
                                      return
                                    end
                                    local.get 1
                                    i32.const 1085247553
                                    i32.store
                                    i32.const 2
                                    return
                                  end
                                  i32.const 1
                                  local.set 2
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        local.get 0
                                        i32.load8_u offset=1
                                        i32.const -108
                                        i32.add
                                        br_table 0 (;@18;) 17 (;@1;) 1 (;@17;) 17 (;@1;) 17 (;@1;) 17 (;@1;) 17 (;@1;) 17 (;@1;) 17 (;@1;) 17 (;@1;) 17 (;@1;) 17 (;@1;) 2 (;@16;) 17 (;@1;)
                                      end
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            local.get 0
                                            i32.load8_u offset=2
                                            i32.const 115
                                            i32.eq
                                            br_if 0 (;@20;)
                                            local.get 0
                                            i32.const 3
                                            i32.add
                                            local.set 2
                                            br 1 (;@19;)
                                          end
                                          local.get 0
                                          i32.load8_u offset=3
                                          i32.const 101
                                          i32.eq
                                          br_if 1 (;@18;)
                                          local.get 0
                                          i32.const 4
                                          i32.add
                                          local.set 2
                                        end
                                        local.get 2
                                        local.get 0
                                        i32.const -1
                                        i32.xor
                                        i32.add
                                        return
                                      end
                                      local.get 1
                                      i32.const 1093440577
                                      i32.store
                                      i32.const 4
                                      return
                                    end
                                    block ;; label = @17
                                      block ;; label = @18
                                        block ;; label = @19
                                          local.get 0
                                          i32.load8_u offset=2
                                          i32.const 117
                                          i32.eq
                                          br_if 0 (;@19;)
                                          local.get 0
                                          i32.const 3
                                          i32.add
                                          local.set 2
                                          br 1 (;@18;)
                                        end
                                        local.get 0
                                        i32.load8_u offset=3
                                        i32.const 109
                                        i32.eq
                                        br_if 1 (;@17;)
                                        local.get 0
                                        i32.const 4
                                        i32.add
                                        local.set 2
                                      end
                                      local.get 2
                                      local.get 0
                                      i32.const -1
                                      i32.xor
                                      i32.add
                                      return
                                    end
                                    local.get 1
                                    i32.const 1093571585
                                    i32.store
                                    i32.const 4
                                    return
                                  end
                                  i32.const 2
                                  local.set 2
                                  block ;; label = @16
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=2
                                      i32.const -112
                                      i32.add
                                      br_table 0 (;@17;) 16 (;@1;) 16 (;@1;) 16 (;@1;) 1 (;@16;) 16 (;@1;)
                                    end
                                    block ;; label = @17
                                      block ;; label = @18
                                        block ;; label = @19
                                          local.get 0
                                          i32.load8_u offset=3
                                          i32.const 111
                                          i32.eq
                                          br_if 0 (;@19;)
                                          local.get 0
                                          i32.const 4
                                          i32.add
                                          local.set 2
                                          br 1 (;@18;)
                                        end
                                        block ;; label = @19
                                          local.get 0
                                          i32.load8_u offset=4
                                          i32.const 114
                                          i32.eq
                                          br_if 0 (;@19;)
                                          local.get 0
                                          i32.const 5
                                          i32.add
                                          local.set 2
                                          br 1 (;@18;)
                                        end
                                        local.get 0
                                        i32.load8_u offset=5
                                        i32.const 116
                                        i32.eq
                                        br_if 1 (;@17;)
                                        local.get 0
                                        i32.const 6
                                        i32.add
                                        local.set 2
                                      end
                                      local.get 2
                                      local.get 0
                                      i32.const -1
                                      i32.xor
                                      i32.add
                                      return
                                    end
                                    local.get 1
                                    i32.const 1102615553
                                    i32.store
                                    i32.const 6
                                    return
                                  end
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        local.get 0
                                        i32.load8_u offset=3
                                        i32.const 101
                                        i32.eq
                                        br_if 0 (;@18;)
                                        local.get 0
                                        i32.const 4
                                        i32.add
                                        local.set 2
                                        br 1 (;@17;)
                                      end
                                      block ;; label = @18
                                        local.get 0
                                        i32.load8_u offset=4
                                        i32.const 110
                                        i32.eq
                                        br_if 0 (;@18;)
                                        local.get 0
                                        i32.const 5
                                        i32.add
                                        local.set 2
                                        br 1 (;@17;)
                                      end
                                      block ;; label = @18
                                        local.get 0
                                        i32.load8_u offset=5
                                        i32.const 100
                                        i32.eq
                                        br_if 0 (;@18;)
                                        local.get 0
                                        i32.const 6
                                        i32.add
                                        local.set 2
                                        br 1 (;@17;)
                                      end
                                      local.get 0
                                      i32.load8_u offset=6
                                      i32.const 115
                                      i32.eq
                                      br_if 1 (;@16;)
                                      local.get 0
                                      i32.const 7
                                      i32.add
                                      local.set 2
                                    end
                                    local.get 2
                                    local.get 0
                                    i32.const -1
                                    i32.xor
                                    i32.add
                                    return
                                  end
                                  local.get 1
                                  i32.const 1106809857
                                  i32.store
                                  i32.const 7
                                  return
                                end
                                i32.const 1
                                local.set 2
                                block ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        block ;; label = @19
                                          local.get 0
                                          i32.load8_u offset=1
                                          i32.const -97
                                          i32.add
                                          br_table 0 (;@19;) 18 (;@1;) 18 (;@1;) 18 (;@1;) 18 (;@1;) 18 (;@1;) 18 (;@1;) 18 (;@1;) 1 (;@18;) 18 (;@1;) 18 (;@1;) 18 (;@1;) 18 (;@1;) 18 (;@1;) 2 (;@17;) 18 (;@1;) 18 (;@1;) 3 (;@16;) 18 (;@1;) 18 (;@1;) 4 (;@15;) 18 (;@1;)
                                        end
                                        block ;; label = @19
                                          block ;; label = @20
                                            block ;; label = @21
                                              local.get 0
                                              i32.load8_u offset=2
                                              i32.const 108
                                              i32.eq
                                              br_if 0 (;@21;)
                                              local.get 0
                                              i32.const 3
                                              i32.add
                                              local.set 2
                                              br 1 (;@20;)
                                            end
                                            block ;; label = @21
                                              local.get 0
                                              i32.load8_u offset=3
                                              i32.const 115
                                              i32.eq
                                              br_if 0 (;@21;)
                                              local.get 0
                                              i32.const 4
                                              i32.add
                                              local.set 2
                                              br 1 (;@20;)
                                            end
                                            local.get 0
                                            i32.load8_u offset=4
                                            i32.const 101
                                            i32.eq
                                            br_if 1 (;@19;)
                                            local.get 0
                                            i32.const 5
                                            i32.add
                                            local.set 2
                                          end
                                          local.get 2
                                          local.get 0
                                          i32.const -1
                                          i32.xor
                                          i32.add
                                          return
                                        end
                                        local.get 1
                                        i32.const 1096914968
                                        i32.store
                                        i32.const 5
                                        return
                                      end
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            local.get 0
                                            i32.load8_u offset=2
                                            i32.const 110
                                            i32.eq
                                            br_if 0 (;@20;)
                                            local.get 0
                                            i32.const 3
                                            i32.add
                                            local.set 2
                                            br 1 (;@19;)
                                          end
                                          block ;; label = @20
                                            local.get 0
                                            i32.load8_u offset=3
                                            i32.const 97
                                            i32.eq
                                            br_if 0 (;@20;)
                                            local.get 0
                                            i32.const 4
                                            i32.add
                                            local.set 2
                                            br 1 (;@19;)
                                          end
                                          block ;; label = @20
                                            local.get 0
                                            i32.load8_u offset=4
                                            i32.const 108
                                            i32.eq
                                            br_if 0 (;@20;)
                                            local.get 0
                                            i32.const 5
                                            i32.add
                                            local.set 2
                                            br 1 (;@19;)
                                          end
                                          block ;; label = @20
                                            local.get 0
                                            i32.load8_u offset=5
                                            i32.const 108
                                            i32.eq
                                            br_if 0 (;@20;)
                                            local.get 0
                                            i32.const 6
                                            i32.add
                                            local.set 2
                                            br 1 (;@19;)
                                          end
                                          local.get 0
                                          i32.load8_u offset=6
                                          i32.const 121
                                          i32.eq
                                          br_if 1 (;@18;)
                                          local.get 0
                                          i32.const 7
                                          i32.add
                                          local.set 2
                                        end
                                        local.get 2
                                        local.get 0
                                        i32.const -1
                                        i32.xor
                                        i32.add
                                        return
                                      end
                                      local.get 1
                                      i32.const 1105827905
                                      i32.store
                                      i32.const 7
                                      return
                                    end
                                    i32.const 2
                                    local.set 2
                                    local.get 0
                                    i32.load8_u offset=2
                                    i32.const 114
                                    i32.ne
                                    br_if 15 (;@1;)
                                    local.get 1
                                    i32.const 1089444033
                                    i32.store
                                    i32.const 3
                                    return
                                  end
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        local.get 0
                                        i32.load8_u offset=2
                                        i32.const 111
                                        i32.eq
                                        br_if 0 (;@18;)
                                        local.get 0
                                        i32.const 3
                                        i32.add
                                        local.set 2
                                        br 1 (;@17;)
                                      end
                                      local.get 0
                                      i32.load8_u offset=3
                                      i32.const 109
                                      i32.eq
                                      br_if 1 (;@16;)
                                      local.get 0
                                      i32.const 4
                                      i32.add
                                      local.set 2
                                    end
                                    local.get 2
                                    local.get 0
                                    i32.const -1
                                    i32.xor
                                    i32.add
                                    return
                                  end
                                  local.get 1
                                  i32.const 1093834752
                                  i32.store
                                  i32.const 4
                                  return
                                end
                                block ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=2
                                      i32.const 110
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 3
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=3
                                      i32.const 99
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 4
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=4
                                      i32.const 116
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 5
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=5
                                      i32.const 105
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 6
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=6
                                      i32.const 111
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 7
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    local.get 0
                                    i32.load8_u offset=7
                                    i32.const 110
                                    i32.eq
                                    br_if 1 (;@15;)
                                    local.get 0
                                    i32.const 8
                                    i32.add
                                    local.set 2
                                  end
                                  local.get 2
                                  local.get 0
                                  i32.const -1
                                  i32.xor
                                  i32.add
                                  return
                                end
                                local.get 1
                                i32.const 1110808577
                                i32.store
                                i32.const 8
                                return
                              end
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 0
                                    i32.load8_u offset=1
                                    i32.const 101
                                    i32.eq
                                    br_if 0 (;@16;)
                                    local.get 0
                                    i32.const 2
                                    i32.add
                                    local.set 2
                                    br 1 (;@15;)
                                  end
                                  local.get 0
                                  i32.load8_u offset=2
                                  i32.const 116
                                  i32.eq
                                  br_if 1 (;@14;)
                                  local.get 0
                                  i32.const 3
                                  i32.add
                                  local.set 2
                                end
                                local.get 2
                                local.get 0
                                i32.const -1
                                i32.xor
                                i32.add
                                return
                              end
                              local.get 1
                              i32.const 1088789504
                              i32.store
                              i32.const 3
                              return
                            end
                            i32.const 1
                            local.set 2
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  local.get 0
                                  i32.load8_u offset=1
                                  i32.const -102
                                  i32.add
                                  br_table 0 (;@15;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 14 (;@1;) 1 (;@14;) 2 (;@13;) 14 (;@1;)
                                end
                                local.get 1
                                i32.const 1084662977
                                i32.store
                                i32.const 2
                                return
                              end
                              i32.const 2
                              local.set 2
                              local.get 0
                              i32.load8_u offset=2
                              i32.const 112
                              i32.ne
                              br_if 12 (;@1;)
                              i32.const 3
                              local.set 2
                              block ;; label = @14
                                block ;; label = @15
                                  local.get 0
                                  i32.load8_u offset=3
                                  i32.const -108
                                  i32.add
                                  br_table 0 (;@15;) 14 (;@1;) 14 (;@1;) 1 (;@14;) 14 (;@1;)
                                end
                                block ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=4
                                      i32.const 101
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 5
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=5
                                      i32.const 109
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 6
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=6
                                      i32.const 101
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 7
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=7
                                      i32.const 110
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 8
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=8
                                      i32.const 116
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 9
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    local.get 0
                                    i32.load8_u offset=9
                                    i32.const 115
                                    i32.eq
                                    br_if 1 (;@15;)
                                    local.get 0
                                    i32.const 10
                                    i32.add
                                    local.set 2
                                  end
                                  local.get 2
                                  local.get 0
                                  i32.const -1
                                  i32.xor
                                  i32.add
                                  return
                                end
                                local.get 1
                                i32.const 1118675969
                                i32.store
                                i32.const 10
                                return
                              end
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 0
                                    i32.load8_u offset=4
                                    i32.const 114
                                    i32.eq
                                    br_if 0 (;@16;)
                                    local.get 0
                                    i32.const 5
                                    i32.add
                                    local.set 2
                                    br 1 (;@15;)
                                  end
                                  local.get 0
                                  i32.load8_u offset=5
                                  i32.const 116
                                  i32.eq
                                  br_if 1 (;@14;)
                                  local.get 0
                                  i32.const 6
                                  i32.add
                                  local.set 2
                                end
                                local.get 2
                                local.get 0
                                i32.const -1
                                i32.xor
                                i32.add
                                return
                              end
                              local.get 1
                              i32.const 1101898776
                              i32.store
                              i32.const 6
                              return
                            end
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  local.get 0
                                  i32.load8_u offset=2
                                  i32.const -115
                                  i32.add
                                  br_table 0 (;@15;) 1 (;@14;) 2 (;@13;)
                                end
                                block ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=3
                                      i32.const 116
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 4
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=4
                                      i32.const 97
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 5
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=5
                                      i32.const 110
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 6
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=6
                                      i32.const 99
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 7
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=7
                                      i32.const 101
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 8
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    block ;; label = @17
                                      local.get 0
                                      i32.load8_u offset=8
                                      i32.const 111
                                      i32.eq
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 9
                                      i32.add
                                      local.set 2
                                      br 1 (;@16;)
                                    end
                                    local.get 0
                                    i32.load8_u offset=9
                                    i32.const 102
                                    i32.eq
                                    br_if 1 (;@15;)
                                    local.get 0
                                    i32.const 10
                                    i32.add
                                    local.set 2
                                  end
                                  local.get 2
                                  local.get 0
                                  i32.const -1
                                  i32.xor
                                  i32.add
                                  return
                                end
                                local.get 1
                                i32.const 1118741507
                                i32.store
                                i32.const 10
                                return
                              end
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 0
                                    i32.load8_u offset=3
                                    i32.const 101
                                    i32.eq
                                    br_if 0 (;@16;)
                                    local.get 0
                                    i32.const 4
                                    i32.add
                                    local.set 2
                                    br 1 (;@15;)
                                  end
                                  block ;; label = @16
                                    local.get 0
                                    i32.load8_u offset=4
                                    i32.const 114
                                    i32.eq
                                    br_if 0 (;@16;)
                                    local.get 0
                                    i32.const 5
                                    i32.add
                                    local.set 2
                                    br 1 (;@15;)
                                  end
                                  block ;; label = @16
                                    local.get 0
                                    i32.load8_u offset=5
                                    i32.const 102
                                    i32.eq
                                    br_if 0 (;@16;)
                                    local.get 0
                                    i32.const 6
                                    i32.add
                                    local.set 2
                                    br 1 (;@15;)
                                  end
                                  block ;; label = @16
                                    local.get 0
                                    i32.load8_u offset=6
                                    i32.const 97
                                    i32.eq
                                    br_if 0 (;@16;)
                                    local.get 0
                                    i32.const 7
                                    i32.add
                                    local.set 2
                                    br 1 (;@15;)
                                  end
                                  block ;; label = @16
                                    local.get 0
                                    i32.load8_u offset=7
                                    i32.const 99
                                    i32.eq
                                    br_if 0 (;@16;)
                                    local.get 0
                                    i32.const 8
                                    i32.add
                                    local.set 2
                                    br 1 (;@15;)
                                  end
                                  local.get 0
                                  i32.load8_u offset=8
                                  i32.const 101
                                  i32.eq
                                  br_if 1 (;@14;)
                                  local.get 0
                                  i32.const 9
                                  i32.add
                                  local.set 2
                                end
                                local.get 2
                                local.get 0
                                i32.const -1
                                i32.xor
                                i32.add
                                return
                              end
                              local.get 1
                              i32.const 1114547201
                              i32.store
                              i32.const 9
                              return
                            end
                            local.get 1
                            i32.const 1085187075
                            i32.store
                            i32.const 2
                            return
                          end
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                local.get 0
                                i32.load8_u offset=1
                                i32.const 101
                                i32.eq
                                br_if 0 (;@14;)
                                local.get 0
                                i32.const 2
                                i32.add
                                local.set 2
                                br 1 (;@13;)
                              end
                              local.get 0
                              i32.load8_u offset=2
                              i32.const 116
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 0
                              i32.const 3
                              i32.add
                              local.set 2
                            end
                            local.get 2
                            local.get 0
                            i32.const -1
                            i32.xor
                            i32.add
                            return
                          end
                          local.get 1
                          i32.const 1088794657
                          i32.store
                          i32.const 3
                          return
                        end
                        i32.const 1
                        local.set 2
                        block ;; label = @11
                          block ;; label = @12
                            local.get 0
                            i32.load8_u offset=1
                            i32.const -101
                            i32.add
                            br_table 0 (;@12;) 11 (;@1;) 11 (;@1;) 11 (;@1;) 11 (;@1;) 11 (;@1;) 11 (;@1;) 11 (;@1;) 11 (;@1;) 11 (;@1;) 11 (;@1;) 11 (;@1;) 11 (;@1;) 11 (;@1;) 11 (;@1;) 11 (;@1;) 1 (;@11;) 11 (;@1;)
                          end
                          i32.const 2
                          local.set 2
                          local.get 0
                          i32.load8_u offset=2
                          i32.const 119
                          i32.ne
                          br_if 10 (;@1;)
                          local.get 1
                          i32.const 1088796677
                          i32.store
                          i32.const 3
                          return
                        end
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              local.get 0
                              i32.load8_u offset=2
                              i32.const 108
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 3
                              i32.add
                              local.set 2
                              br 1 (;@12;)
                            end
                            local.get 0
                            i32.load8_u offset=3
                            i32.const 108
                            i32.eq
                            br_if 1 (;@11;)
                            local.get 0
                            i32.const 4
                            i32.add
                            local.set 2
                          end
                          local.get 2
                          local.get 0
                          i32.const -1
                          i32.xor
                          i32.add
                          return
                        end
                        local.get 1
                        i32.const 1094039576
                        i32.store
                        i32.const 4
                        return
                      end
                      i32.const 1
                      local.set 2
                      local.get 0
                      i32.load8_u offset=1
                      i32.const 102
                      i32.ne
                      br_if 8 (;@1;)
                      local.get 1
                      i32.const 1084668928
                      i32.store
                      i32.const 2
                      return
                    end
                    i32.const 1
                    local.set 2
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          local.get 0
                          i32.load8_u offset=1
                          i32.const -97
                          i32.add
                          br_table 0 (;@11;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 1 (;@10;) 10 (;@1;) 10 (;@1;) 2 (;@9;) 10 (;@1;)
                        end
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              local.get 0
                              i32.load8_u offset=2
                              i32.const 99
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 3
                              i32.add
                              local.set 2
                              br 1 (;@12;)
                            end
                            block ;; label = @13
                              local.get 0
                              i32.load8_u offset=3
                              i32.const 107
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 4
                              i32.add
                              local.set 2
                              br 1 (;@12;)
                            end
                            block ;; label = @13
                              local.get 0
                              i32.load8_u offset=4
                              i32.const 97
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 5
                              i32.add
                              local.set 2
                              br 1 (;@12;)
                            end
                            block ;; label = @13
                              local.get 0
                              i32.load8_u offset=5
                              i32.const 103
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 6
                              i32.add
                              local.set 2
                              br 1 (;@12;)
                            end
                            local.get 0
                            i32.load8_u offset=6
                            i32.const 101
                            i32.eq
                            br_if 1 (;@11;)
                            local.get 0
                            i32.const 7
                            i32.add
                            local.set 2
                          end
                          local.get 2
                          local.get 0
                          i32.const -1
                          i32.xor
                          i32.add
                          return
                        end
                        local.get 1
                        i32.const 1105313793
                        i32.store
                        i32.const 7
                        return
                      end
                      i32.const 2
                      local.set 2
                      block ;; label = @10
                        block ;; label = @11
                          local.get 0
                          i32.load8_u offset=2
                          i32.const -105
                          i32.add
                          br_table 0 (;@11;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 1 (;@10;) 10 (;@1;)
                        end
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              local.get 0
                              i32.load8_u offset=3
                              i32.const 118
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 4
                              i32.add
                              local.set 2
                              br 1 (;@12;)
                            end
                            block ;; label = @13
                              local.get 0
                              i32.load8_u offset=4
                              i32.const 97
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 5
                              i32.add
                              local.set 2
                              br 1 (;@12;)
                            end
                            block ;; label = @13
                              local.get 0
                              i32.load8_u offset=5
                              i32.const 116
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 6
                              i32.add
                              local.set 2
                              br 1 (;@12;)
                            end
                            local.get 0
                            i32.load8_u offset=6
                            i32.const 101
                            i32.eq
                            br_if 1 (;@11;)
                            local.get 0
                            i32.const 7
                            i32.add
                            local.set 2
                          end
                          local.get 2
                          local.get 0
                          i32.const -1
                          i32.xor
                          i32.add
                          return
                        end
                        local.get 1
                        i32.const 1106427905
                        i32.store
                        i32.const 7
                        return
                      end
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            local.get 0
                            i32.load8_u offset=3
                            i32.const 116
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const 4
                            i32.add
                            local.set 2
                            br 1 (;@11;)
                          end
                          block ;; label = @12
                            local.get 0
                            i32.load8_u offset=4
                            i32.const 101
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const 5
                            i32.add
                            local.set 2
                            br 1 (;@11;)
                          end
                          block ;; label = @12
                            local.get 0
                            i32.load8_u offset=5
                            i32.const 99
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const 6
                            i32.add
                            local.set 2
                            br 1 (;@11;)
                          end
                          block ;; label = @12
                            local.get 0
                            i32.load8_u offset=6
                            i32.const 116
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const 7
                            i32.add
                            local.set 2
                            br 1 (;@11;)
                          end
                          block ;; label = @12
                            local.get 0
                            i32.load8_u offset=7
                            i32.const 101
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const 8
                            i32.add
                            local.set 2
                            br 1 (;@11;)
                          end
                          local.get 0
                          i32.load8_u offset=8
                          i32.const 100
                          i32.eq
                          br_if 1 (;@10;)
                          local.get 0
                          i32.const 9
                          i32.add
                          local.set 2
                        end
                        local.get 2
                        local.get 0
                        i32.const -1
                        i32.xor
                        i32.add
                        return
                      end
                      local.get 1
                      i32.const 1114816513
                      i32.store
                      i32.const 9
                      return
                    end
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          local.get 0
                          i32.load8_u offset=2
                          i32.const 98
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 3
                          i32.add
                          local.set 2
                          br 1 (;@10;)
                        end
                        block ;; label = @11
                          local.get 0
                          i32.load8_u offset=3
                          i32.const 108
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 4
                          i32.add
                          local.set 2
                          br 1 (;@10;)
                        end
                        block ;; label = @11
                          local.get 0
                          i32.load8_u offset=4
                          i32.const 105
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 5
                          i32.add
                          local.set 2
                          br 1 (;@10;)
                        end
                        local.get 0
                        i32.load8_u offset=5
                        i32.const 99
                        i32.eq
                        br_if 1 (;@9;)
                        local.get 0
                        i32.const 6
                        i32.add
                        local.set 2
                      end
                      local.get 2
                      local.get 0
                      i32.const -1
                      i32.xor
                      i32.add
                      return
                    end
                    local.get 1
                    i32.const 1102430209
                    i32.store
                    i32.const 6
                    return
                  end
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        local.get 0
                        i32.load8_u offset=1
                        i32.const 101
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 2
                        i32.add
                        local.set 2
                        br 1 (;@9;)
                      end
                      block ;; label = @10
                        local.get 0
                        i32.load8_u offset=2
                        i32.const 116
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 3
                        i32.add
                        local.set 2
                        br 1 (;@9;)
                      end
                      block ;; label = @10
                        local.get 0
                        i32.load8_u offset=3
                        i32.const 117
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 4
                        i32.add
                        local.set 2
                        br 1 (;@9;)
                      end
                      block ;; label = @10
                        local.get 0
                        i32.load8_u offset=4
                        i32.const 114
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 5
                        i32.add
                        local.set 2
                        br 1 (;@9;)
                      end
                      local.get 0
                      i32.load8_u offset=5
                      i32.const 110
                      i32.eq
                      br_if 1 (;@8;)
                      local.get 0
                      i32.const 6
                      i32.add
                      local.set 2
                    end
                    local.get 2
                    local.get 0
                    i32.const -1
                    i32.xor
                    i32.add
                    return
                  end
                  local.get 1
                  i32.const 1101383681
                  i32.store
                  i32.const 6
                  return
                end
                i32.const 1
                local.set 2
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        local.get 0
                        i32.load8_u offset=1
                        i32.const -101
                        i32.add
                        br_table 0 (;@10;) 9 (;@1;) 9 (;@1;) 9 (;@1;) 9 (;@1;) 9 (;@1;) 9 (;@1;) 9 (;@1;) 9 (;@1;) 9 (;@1;) 9 (;@1;) 9 (;@1;) 9 (;@1;) 9 (;@1;) 9 (;@1;) 1 (;@9;) 2 (;@8;) 9 (;@1;) 3 (;@7;) 9 (;@1;)
                      end
                      i32.const 2
                      local.set 2
                      local.get 0
                      i32.load8_u offset=2
                      i32.const 116
                      i32.ne
                      br_if 8 (;@1;)
                      local.get 1
                      i32.const 1088801792
                      i32.store
                      i32.const 3
                      return
                    end
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          local.get 0
                          i32.load8_u offset=2
                          i32.const 97
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 3
                          i32.add
                          local.set 2
                          br 1 (;@10;)
                        end
                        block ;; label = @11
                          local.get 0
                          i32.load8_u offset=3
                          i32.const 116
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 4
                          i32.add
                          local.set 2
                          br 1 (;@10;)
                        end
                        block ;; label = @11
                          local.get 0
                          i32.load8_u offset=4
                          i32.const 105
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 5
                          i32.add
                          local.set 2
                          br 1 (;@10;)
                        end
                        local.get 0
                        i32.load8_u offset=5
                        i32.const 99
                        i32.eq
                        br_if 1 (;@9;)
                        local.get 0
                        i32.const 6
                        i32.add
                        local.set 2
                      end
                      local.get 2
                      local.get 0
                      i32.const -1
                      i32.xor
                      i32.add
                      return
                    end
                    local.get 1
                    i32.const 1102367745
                    i32.store
                    i32.const 6
                    return
                  end
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        local.get 0
                        i32.load8_u offset=2
                        i32.const 112
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 3
                        i32.add
                        local.set 2
                        br 1 (;@9;)
                      end
                      block ;; label = @10
                        local.get 0
                        i32.load8_u offset=3
                        i32.const 101
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 4
                        i32.add
                        local.set 2
                        br 1 (;@9;)
                      end
                      local.get 0
                      i32.load8_u offset=4
                      i32.const 114
                      i32.eq
                      br_if 1 (;@8;)
                      local.get 0
                      i32.const 5
                      i32.add
                      local.set 2
                    end
                    local.get 2
                    local.get 0
                    i32.const -1
                    i32.xor
                    i32.add
                    return
                  end
                  local.get 1
                  i32.const 1098239000
                  i32.store
                  i32.const 5
                  return
                end
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      local.get 0
                      i32.load8_u offset=2
                      i32.const 105
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 3
                      i32.add
                      local.set 2
                      br 1 (;@8;)
                    end
                    block ;; label = @9
                      local.get 0
                      i32.load8_u offset=3
                      i32.const 116
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 4
                      i32.add
                      local.set 2
                      br 1 (;@8;)
                    end
                    block ;; label = @9
                      local.get 0
                      i32.load8_u offset=4
                      i32.const 99
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 5
                      i32.add
                      local.set 2
                      br 1 (;@8;)
                    end
                    local.get 0
                    i32.load8_u offset=5
                    i32.const 104
                    i32.eq
                    br_if 1 (;@7;)
                    local.get 0
                    i32.const 6
                    i32.add
                    local.set 2
                  end
                  local.get 2
                  local.get 0
                  i32.const -1
                  i32.xor
                  i32.add
                  return
                end
                local.get 1
                i32.const 1102564545
                i32.store
                i32.const 6
                return
              end
              i32.const 1
              local.set 2
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    local.get 0
                    i32.load8_u offset=1
                    i32.const -104
                    i32.add
                    br_table 0 (;@8;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 1 (;@7;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 2 (;@6;) 7 (;@1;)
                  end
                  i32.const 2
                  local.set 2
                  block ;; label = @8
                    block ;; label = @9
                      local.get 0
                      i32.load8_u offset=2
                      i32.const -105
                      i32.add
                      br_table 0 (;@9;) 8 (;@1;) 8 (;@1;) 8 (;@1;) 8 (;@1;) 8 (;@1;) 8 (;@1;) 8 (;@1;) 8 (;@1;) 1 (;@8;) 8 (;@1;)
                    end
                    i32.const 3
                    local.set 2
                    local.get 0
                    i32.load8_u offset=3
                    i32.const 115
                    i32.ne
                    br_if 7 (;@1;)
                    local.get 1
                    i32.const 1093193752
                    i32.store
                    i32.const 4
                    return
                  end
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        local.get 0
                        i32.load8_u offset=3
                        i32.const 111
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 4
                        i32.add
                        local.set 2
                        br 1 (;@9;)
                      end
                      local.get 0
                      i32.load8_u offset=4
                      i32.const 119
                      i32.eq
                      br_if 1 (;@8;)
                      local.get 0
                      i32.const 5
                      i32.add
                      local.set 2
                    end
                    local.get 2
                    local.get 0
                    i32.const -1
                    i32.xor
                    i32.add
                    return
                  end
                  local.get 1
                  i32.const 1097388033
                  i32.store
                  i32.const 5
                  return
                end
                i32.const 2
                local.set 2
                block ;; label = @7
                  block ;; label = @8
                    local.get 0
                    i32.load8_u offset=2
                    i32.const -117
                    i32.add
                    br_table 0 (;@8;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 1 (;@7;) 7 (;@1;)
                  end
                  i32.const 3
                  local.set 2
                  local.get 0
                  i32.load8_u offset=3
                  i32.const 101
                  i32.ne
                  br_if 6 (;@1;)
                  local.get 1
                  i32.const 1093849112
                  i32.store
                  i32.const 4
                  return
                end
                local.get 1
                i32.const 1089654849
                i32.store
                i32.const 3
                return
              end
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    local.get 0
                    i32.load8_u offset=2
                    i32.const 112
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 3
                    i32.add
                    local.set 2
                    br 1 (;@7;)
                  end
                  block ;; label = @8
                    local.get 0
                    i32.load8_u offset=3
                    i32.const 101
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 4
                    i32.add
                    local.set 2
                    br 1 (;@7;)
                  end
                  block ;; label = @8
                    local.get 0
                    i32.load8_u offset=4
                    i32.const 111
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 5
                    i32.add
                    local.set 2
                    br 1 (;@7;)
                  end
                  local.get 0
                  i32.load8_u offset=5
                  i32.const 102
                  i32.eq
                  br_if 1 (;@6;)
                  local.get 0
                  i32.const 6
                  i32.add
                  local.set 2
                end
                local.get 2
                local.get 0
                i32.const -1
                i32.xor
                i32.add
                return
              end
              local.get 1
              i32.const 1102696453
              i32.store
              i32.const 6
              return
            end
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  local.get 0
                  i32.load8_u offset=1
                  i32.const 110
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 0
                  i32.const 2
                  i32.add
                  local.set 2
                  br 1 (;@6;)
                end
                block ;; label = @7
                  local.get 0
                  i32.load8_u offset=2
                  i32.const 100
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 0
                  i32.const 3
                  i32.add
                  local.set 2
                  br 1 (;@6;)
                end
                block ;; label = @7
                  local.get 0
                  i32.load8_u offset=3
                  i32.const 101
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 0
                  i32.const 4
                  i32.add
                  local.set 2
                  br 1 (;@6;)
                end
                block ;; label = @7
                  local.get 0
                  i32.load8_u offset=4
                  i32.const 102
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 0
                  i32.const 5
                  i32.add
                  local.set 2
                  br 1 (;@6;)
                end
                block ;; label = @7
                  local.get 0
                  i32.load8_u offset=5
                  i32.const 105
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 0
                  i32.const 6
                  i32.add
                  local.set 2
                  br 1 (;@6;)
                end
                block ;; label = @7
                  local.get 0
                  i32.load8_u offset=6
                  i32.const 110
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 0
                  i32.const 7
                  i32.add
                  local.set 2
                  br 1 (;@6;)
                end
                block ;; label = @7
                  local.get 0
                  i32.load8_u offset=7
                  i32.const 101
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 0
                  i32.const 8
                  i32.add
                  local.set 2
                  br 1 (;@6;)
                end
                local.get 0
                i32.load8_u offset=8
                i32.const 100
                i32.eq
                br_if 1 (;@5;)
                local.get 0
                i32.const 9
                i32.add
                local.set 2
              end
              local.get 2
              local.get 0
              i32.const -1
              i32.xor
              i32.add
              return
            end
            local.get 1
            i32.const 1114559504
            i32.store
            i32.const 9
            return
          end
          i32.const 1
          local.set 2
          block ;; label = @4
            block ;; label = @5
              local.get 0
              i32.load8_u offset=1
              i32.const -97
              i32.add
              br_table 0 (;@5;) 4 (;@1;) 4 (;@1;) 4 (;@1;) 4 (;@1;) 4 (;@1;) 4 (;@1;) 4 (;@1;) 4 (;@1;) 4 (;@1;) 4 (;@1;) 4 (;@1;) 4 (;@1;) 4 (;@1;) 1 (;@4;) 4 (;@1;)
            end
            i32.const 2
            local.set 2
            local.get 0
            i32.load8_u offset=2
            i32.const 114
            i32.ne
            br_if 3 (;@1;)
            local.get 1
            i32.const 1088542753
            i32.store
            i32.const 3
            return
          end
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 0
                i32.load8_u offset=2
                i32.const 105
                i32.eq
                br_if 0 (;@6;)
                local.get 0
                i32.const 3
                i32.add
                local.set 2
                br 1 (;@5;)
              end
              local.get 0
              i32.load8_u offset=3
              i32.const 100
              i32.eq
              br_if 1 (;@4;)
              local.get 0
              i32.const 4
              i32.add
              local.set 2
            end
            local.get 2
            local.get 0
            i32.const -1
            i32.xor
            i32.add
            return
          end
          local.get 1
          i32.const 1093654533
          i32.store
          i32.const 4
          return
        end
        i32.const 1
        local.set 2
        block ;; label = @3
          block ;; label = @4
            local.get 0
            i32.load8_u offset=1
            i32.const -104
            i32.add
            br_table 0 (;@4;) 1 (;@3;) 3 (;@1;)
          end
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 0
                i32.load8_u offset=2
                i32.const 105
                i32.eq
                br_if 0 (;@6;)
                local.get 0
                i32.const 3
                i32.add
                local.set 2
                br 1 (;@5;)
              end
              block ;; label = @6
                local.get 0
                i32.load8_u offset=3
                i32.const 108
                i32.eq
                br_if 0 (;@6;)
                local.get 0
                i32.const 4
                i32.add
                local.set 2
                br 1 (;@5;)
              end
              local.get 0
              i32.load8_u offset=4
              i32.const 101
              i32.eq
              br_if 1 (;@4;)
              local.get 0
              i32.const 5
              i32.add
              local.set 2
            end
            local.get 2
            local.get 0
            i32.const -1
            i32.xor
            i32.add
            return
          end
          local.get 1
          i32.const 1097391297
          i32.store
          i32.const 5
          return
        end
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              local.get 0
              i32.load8_u offset=2
              i32.const 116
              i32.eq
              br_if 0 (;@5;)
              local.get 0
              i32.const 3
              i32.add
              local.set 2
              br 1 (;@4;)
            end
            local.get 0
            i32.load8_u offset=3
            i32.const 104
            i32.eq
            br_if 1 (;@3;)
            local.get 0
            i32.const 4
            i32.add
            local.set 2
          end
          local.get 2
          local.get 0
          i32.const -1
          i32.xor
          i32.add
          return
        end
        local.get 1
        i32.const 1093262529
        i32.store
        i32.const 4
        return
      end
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 0
            i32.load8_u offset=1
            i32.const 105
            i32.eq
            br_if 0 (;@4;)
            local.get 0
            i32.const 2
            i32.add
            local.set 2
            br 1 (;@3;)
          end
          block ;; label = @4
            local.get 0
            i32.load8_u offset=2
            i32.const 101
            i32.eq
            br_if 0 (;@4;)
            local.get 0
            i32.const 3
            i32.add
            local.set 2
            br 1 (;@3;)
          end
          block ;; label = @4
            local.get 0
            i32.load8_u offset=3
            i32.const 108
            i32.eq
            br_if 0 (;@4;)
            local.get 0
            i32.const 4
            i32.add
            local.set 2
            br 1 (;@3;)
          end
          i32.const 5
          local.set 2
          local.get 0
          i32.load8_u offset=4
          i32.const 100
          i32.eq
          br_if 1 (;@2;)
          local.get 0
          i32.const 5
          i32.add
          local.set 2
        end
        local.get 2
        local.get 0
        i32.const -1
        i32.xor
        i32.add
        return
      end
      local.get 1
      i32.const 1097458693
      i32.store
    end
    local.get 2
  )
  (func $blep_parser_init (;7;) (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    block ;; label = @1
      local.get 0
      local.get 1
      call $blep_token_init
      local.tee 2
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      i32.store offset=1608
      i32.const 1024
      i32.const 10
      call $consoleLog
      block ;; label = @2
        local.get 0
        i32.load8_u
        i32.const 35
        i32.ne
        br_if 0 (;@2;)
        local.get 0
        i32.load8_u offset=1
        i32.const 33
        i32.ne
        br_if 0 (;@2;)
        i32.const 1612
        local.get 0
        i32.const 10
        i32.const 1612
        i32.load offset=56
        local.get 0
        i32.sub
        call $memchr
        local.tee 3
        local.get 0
        local.get 1
        i32.add
        local.get 3
        select
        i32.store offset=52
        call $blep_token_peek
        drop
        i32.const 1612
        local.get 0
        i32.store offset=24
      end
      i32.const 1035
      i32.const 10
      call $consoleLog
      call $blep_token_next
      drop
    end
    local.get 2
  )
  (func $blep_parser_run (;8;) (type 5) (result i32)
    (local i32 i32 i32)
    block ;; label = @1
      i32.const 1612
      i32.load offset=16
      br_if 0 (;@1;)
      i32.const 0
      return
    end
    i32.const 1612
    i32.load offset=4
    local.set 0
    block ;; label = @1
      i32.const 1
      call $consume_statement
      local.tee 1
      br_if 0 (;@1;)
      i32.const -1
      i32.const 1612
      i32.load offset=4
      local.tee 1
      local.get 0
      i32.sub
      local.tee 2
      i32.const 1612
      i32.load offset=16
      select
      local.get 2
      local.get 1
      local.get 0
      i32.eq
      select
      local.set 1
    end
    local.get 1
  )
  (func $consume_statement (;9;) (type 1) (param i32) (result i32)
    (local i32 i32 i32)
    i32.const -1
    local.set 1
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
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            i32.const 1612
                                            i32.load offset=16
                                            br_table 18 (;@2;) 0 (;@20;) 2 (;@18;) 3 (;@17;) 18 (;@2;) 1 (;@19;) 3 (;@17;) 3 (;@17;) 3 (;@17;) 14 (;@6;) 3 (;@17;) 3 (;@17;) 3 (;@17;) 0 (;@20;) 0 (;@20;) 16 (;@4;) 3 (;@17;)
                                          end
                                          block ;; label = @20
                                            block ;; label = @21
                                              i32.const 1612
                                              i32.load offset=20
                                              local.tee 1
                                              i32.const 1101898775
                                              i32.gt_s
                                              br_if 0 (;@21;)
                                              block ;; label = @22
                                                block ;; label = @23
                                                  local.get 1
                                                  i32.const 1098024960
                                                  i32.gt_s
                                                  br_if 0 (;@23;)
                                                  local.get 1
                                                  i32.const 1092717577
                                                  i32.eq
                                                  br_if 9 (;@14;)
                                                  local.get 1
                                                  i32.const 1097388033
                                                  i32.eq
                                                  br_if 1 (;@22;)
                                                  local.get 1
                                                  i32.const 1097632769
                                                  i32.ne
                                                  br_if 18 (;@5;)
                                                  local.get 0
                                                  br_if 14 (;@9;)
                                                  call $consume_expr_statement
                                                  return
                                                end
                                                local.get 1
                                                i32.const 1098024961
                                                i32.eq
                                                br_if 12 (;@10;)
                                                local.get 1
                                                i32.const 1098089472
                                                i32.eq
                                                br_if 2 (;@20;)
                                                local.get 1
                                                i32.const 1101383681
                                                i32.ne
                                                br_if 17 (;@5;)
                                              end
                                              i32.const 0
                                              i32.load offset=1608
                                              local.tee 2
                                              i32.eqz
                                              br_if 8 (;@13;)
                                              i32.const 0
                                              i32.const 1
                                              i32.store offset=1608
                                              i32.const 1612
                                              i32.const 14
                                              i32.store offset=16
                                              i32.const 1612
                                              i32.load offset=12
                                              local.set 3
                                              br 9 (;@12;)
                                            end
                                            block ;; label = @21
                                              block ;; label = @22
                                                local.get 1
                                                i32.const 1109757952
                                                i32.gt_s
                                                br_if 0 (;@22;)
                                                local.get 1
                                                i32.const 1101898776
                                                i32.eq
                                                br_if 1 (;@21;)
                                                local.get 1
                                                i32.const 1102615553
                                                i32.eq
                                                br_if 15 (;@7;)
                                                local.get 1
                                                i32.const 1105563657
                                                i32.ne
                                                br_if 17 (;@5;)
                                                i32.const 0
                                                i32.load offset=1608
                                                local.tee 0
                                                i32.eqz
                                                br_if 6 (;@16;)
                                                i32.const 1612
                                                i32.const 14
                                                i32.store offset=16
                                                i32.const 0
                                                i32.const 1
                                                i32.store offset=1608
                                                br 7 (;@15;)
                                              end
                                              local.get 1
                                              i32.const 1109757953
                                              i32.eq
                                              br_if 10 (;@11;)
                                              local.get 1
                                              i32.const 1110412289
                                              i32.eq
                                              br_if 11 (;@10;)
                                              local.get 1
                                              i32.const 1110808577
                                              i32.ne
                                              br_if 16 (;@5;)
                                              br 20 (;@1;)
                                            end
                                            call $blep_token_peek
                                            drop
                                            i32.const 1612
                                            i32.const 40
                                            i32.add
                                            i32.load
                                            i32.const 7
                                            i32.eq
                                            br_if 12 (;@8;)
                                            i32.const 1612
                                            i32.const 44
                                            i32.add
                                            i32.load
                                            i32.const 1077950464
                                            i32.eq
                                            br_if 12 (;@8;)
                                            i32.const 1
                                            local.set 1
                                            local.get 0
                                            i32.const 1
                                            i32.ne
                                            br_if 15 (;@5;)
                                            block ;; label = @21
                                              i32.const 0
                                              i32.load offset=1608
                                              local.tee 0
                                              br_if 0 (;@21;)
                                              i32.const 10
                                              call $blep_parser_open
                                              i32.const 0
                                              i32.ne
                                              local.set 1
                                            end
                                            i32.const 0
                                            local.get 1
                                            i32.store offset=1608
                                            call $consume_import
                                            local.tee 1
                                            br_if 18 (;@2;)
                                            block ;; label = @21
                                              i32.const 1612
                                              i32.load offset=16
                                              i32.const 2
                                              i32.ne
                                              br_if 0 (;@21;)
                                              i32.const 1612
                                              i32.load offset=20
                                              br_if 0 (;@21;)
                                              block ;; label = @22
                                                i32.const 0
                                                i32.load offset=1608
                                                br_if 0 (;@22;)
                                                call $blep_parser_callback
                                              end
                                              call $blep_token_next
                                              drop
                                            end
                                            block ;; label = @21
                                              i32.const 0
                                              i32.load offset=1608
                                              br_if 0 (;@21;)
                                              i32.const 10
                                              call $blep_parser_close
                                            end
                                            i32.const 0
                                            local.get 0
                                            i32.store offset=1608
                                            i32.const 0
                                            return
                                          end
                                          call $blep_token_peek
                                          drop
                                          i32.const 1612
                                          i32.const 44
                                          i32.add
                                          i32.load
                                          i32.const 1110808577
                                          i32.eq
                                          br_if 18 (;@1;)
                                          br 14 (;@5;)
                                        end
                                        i32.const 1612
                                        i32.const 16
                                        i32.store offset=16
                                        block ;; label = @19
                                          block ;; label = @20
                                            i32.const 0
                                            i32.load offset=1608
                                            local.tee 0
                                            i32.eqz
                                            br_if 0 (;@20;)
                                            i32.const 0
                                            i32.const 1
                                            i32.store offset=1608
                                            br 1 (;@19;)
                                          end
                                          i32.const 0
                                          i32.const 4
                                          call $blep_parser_open
                                          local.tee 1
                                          i32.const 0
                                          i32.ne
                                          i32.store offset=1608
                                          local.get 1
                                          br_if 0 (;@19;)
                                          call $blep_parser_callback
                                        end
                                        call $blep_token_next
                                        drop
                                        loop ;; label = @19
                                          i32.const 2
                                          call $consume_statement
                                          local.tee 1
                                          br_if 17 (;@2;)
                                          i32.const 1612
                                          i32.load offset=16
                                          i32.const 9
                                          i32.ne
                                          br_if 0 (;@19;)
                                        end
                                        i32.const 1612
                                        i32.const 16
                                        i32.store offset=20
                                        block ;; label = @19
                                          i32.const 0
                                          i32.load offset=1608
                                          br_if 0 (;@19;)
                                          call $blep_parser_callback
                                        end
                                        call $blep_token_next
                                        drop
                                        block ;; label = @19
                                          i32.const 0
                                          i32.load offset=1608
                                          br_if 0 (;@19;)
                                          i32.const 4
                                          call $blep_parser_close
                                        end
                                        i32.const 0
                                        local.get 0
                                        i32.store offset=1608
                                        i32.const 0
                                        return
                                      end
                                      block ;; label = @18
                                        block ;; label = @19
                                          i32.const 0
                                          i32.load offset=1608
                                          local.tee 1
                                          i32.eqz
                                          br_if 0 (;@19;)
                                          i32.const 0
                                          i32.const 1
                                          i32.store offset=1608
                                          br 1 (;@18;)
                                        end
                                        i32.const 0
                                        i32.const 7
                                        call $blep_parser_open
                                        local.tee 0
                                        i32.const 0
                                        i32.ne
                                        i32.store offset=1608
                                        local.get 0
                                        br_if 0 (;@18;)
                                        call $blep_parser_callback
                                      end
                                      call $blep_token_next
                                      drop
                                      block ;; label = @18
                                        i32.const 0
                                        i32.load offset=1608
                                        br_if 0 (;@18;)
                                        i32.const 7
                                        call $blep_parser_close
                                      end
                                      i32.const 0
                                      local.get 1
                                      i32.store offset=1608
                                      i32.const 0
                                      return
                                    end
                                    i32.const 1
                                    local.set 1
                                    block ;; label = @17
                                      i32.const 0
                                      i32.load offset=1608
                                      local.tee 2
                                      br_if 0 (;@17;)
                                      i32.const 1
                                      call $blep_parser_open
                                      i32.const 0
                                      i32.ne
                                      local.set 1
                                    end
                                    i32.const 0
                                    local.get 1
                                    i32.store offset=1608
                                    i32.const 1612
                                    i32.load offset=4
                                    local.set 3
                                    i32.const 1
                                    call $consume_expr_internal
                                    local.tee 1
                                    br_if 14 (;@2;)
                                    block ;; label = @17
                                      loop ;; label = @18
                                        i32.const 1612
                                        i32.load offset=20
                                        local.tee 0
                                        i32.const 1077948416
                                        i32.ne
                                        br_if 1 (;@17;)
                                        block ;; label = @19
                                          i32.const 0
                                          i32.load offset=1608
                                          br_if 0 (;@19;)
                                          call $blep_parser_callback
                                        end
                                        call $blep_token_next
                                        drop
                                        i32.const 1
                                        call $consume_expr_internal
                                        local.tee 1
                                        i32.eqz
                                        br_if 0 (;@18;)
                                        br 16 (;@2;)
                                      end
                                    end
                                    i32.const -1
                                    local.set 1
                                    local.get 3
                                    i32.const 1612
                                    i32.load offset=4
                                    i32.eq
                                    br_if 14 (;@2;)
                                    block ;; label = @17
                                      i32.const 1612
                                      i32.load offset=16
                                      i32.const 2
                                      i32.ne
                                      br_if 0 (;@17;)
                                      local.get 0
                                      br_if 0 (;@17;)
                                      block ;; label = @18
                                        i32.const 0
                                        i32.load offset=1608
                                        br_if 0 (;@18;)
                                        call $blep_parser_callback
                                      end
                                      call $blep_token_next
                                      drop
                                    end
                                    block ;; label = @17
                                      i32.const 0
                                      i32.load offset=1608
                                      br_if 0 (;@17;)
                                      i32.const 1
                                      call $blep_parser_close
                                    end
                                    i32.const 0
                                    local.get 2
                                    i32.store offset=1608
                                    i32.const 0
                                    return
                                  end
                                  i32.const 8
                                  call $blep_parser_open
                                  local.set 1
                                  i32.const 1612
                                  i32.const 14
                                  i32.store offset=16
                                  i32.const 0
                                  local.get 1
                                  i32.const 0
                                  i32.ne
                                  i32.store offset=1608
                                  local.get 1
                                  br_if 0 (;@15;)
                                  call $blep_parser_callback
                                end
                                call $blep_token_next
                                drop
                                block ;; label = @15
                                  i32.const 1612
                                  i32.load offset=16
                                  i32.const 4
                                  i32.ne
                                  local.tee 1
                                  br_if 0 (;@15;)
                                  block ;; label = @16
                                    i32.const 0
                                    i32.load offset=1608
                                    br_if 0 (;@16;)
                                    call $blep_parser_callback
                                  end
                                  call $blep_token_next
                                  drop
                                  block ;; label = @16
                                    i32.const 0
                                    i32.load offset=1608
                                    br_if 0 (;@16;)
                                    i32.const 8
                                    call $blep_parser_close
                                  end
                                  i32.const 0
                                  local.get 0
                                  i32.store offset=1608
                                end
                                i32.const -1
                                i32.const 0
                                local.get 1
                                select
                                return
                              end
                              block ;; label = @14
                                block ;; label = @15
                                  i32.const 0
                                  i32.load offset=1608
                                  local.tee 2
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  i32.const 1612
                                  i32.const 14
                                  i32.store offset=16
                                  i32.const 0
                                  i32.const 1
                                  i32.store offset=1608
                                  br 1 (;@14;)
                                end
                                i32.const 8
                                call $blep_parser_open
                                local.set 1
                                i32.const 1612
                                i32.const 14
                                i32.store offset=16
                                i32.const 0
                                local.get 1
                                i32.const 0
                                i32.ne
                                i32.store offset=1608
                                local.get 1
                                br_if 0 (;@14;)
                                call $blep_parser_callback
                              end
                              call $blep_token_next
                              drop
                              i32.const 1
                              local.set 1
                              block ;; label = @14
                                i32.const 0
                                i32.load offset=1608
                                local.tee 3
                                br_if 0 (;@14;)
                                i32.const 1
                                call $blep_parser_open
                                i32.const 0
                                i32.ne
                                local.set 1
                              end
                              i32.const 0
                              local.get 1
                              i32.store offset=1608
                              i32.const 1612
                              i32.load offset=4
                              local.set 1
                              i32.const 0
                              call $consume_expr_internal
                              local.tee 0
                              i32.const -1
                              i32.const 0
                              local.get 1
                              i32.const 1612
                              i32.load offset=4
                              i32.eq
                              select
                              local.get 0
                              select
                              local.tee 1
                              br_if 11 (;@2;)
                              block ;; label = @14
                                i32.const 0
                                i32.load offset=1608
                                br_if 0 (;@14;)
                                i32.const 1
                                call $blep_parser_close
                              end
                              i32.const 0
                              local.get 3
                              i32.store offset=1608
                              i32.const -1
                              local.set 1
                              i32.const 1612
                              i32.load offset=16
                              i32.const 4
                              i32.ne
                              br_if 11 (;@2;)
                              block ;; label = @14
                                local.get 3
                                br_if 0 (;@14;)
                                call $blep_parser_callback
                              end
                              call $blep_token_next
                              drop
                              block ;; label = @14
                                i32.const 0
                                i32.load offset=1608
                                br_if 0 (;@14;)
                                i32.const 8
                                call $blep_parser_close
                              end
                              i32.const 0
                              local.get 2
                              i32.store offset=1608
                              i32.const 0
                              return
                            end
                            i32.const 7
                            call $blep_parser_open
                            local.set 1
                            i32.const 1612
                            i32.const 14
                            i32.store offset=16
                            i32.const 0
                            local.get 1
                            i32.const 0
                            i32.ne
                            i32.store offset=1608
                            i32.const 1612
                            i32.load offset=12
                            local.set 3
                            local.get 1
                            br_if 0 (;@12;)
                            call $blep_parser_callback
                          end
                          call $blep_token_next
                          drop
                          i32.const 0
                          i32.load offset=1608
                          local.set 0
                          i32.const 1612
                          i32.load offset=16
                          local.set 1
                          block ;; label = @12
                            local.get 3
                            i32.const 1612
                            i32.load offset=12
                            i32.ne
                            br_if 0 (;@12;)
                            local.get 1
                            i32.const 2
                            i32.eq
                            br_if 0 (;@12;)
                            i32.const 1
                            local.set 1
                            block ;; label = @13
                              local.get 0
                              br_if 0 (;@13;)
                              i32.const 1
                              call $blep_parser_open
                              i32.const 0
                              i32.ne
                              local.set 1
                            end
                            i32.const 0
                            local.get 1
                            i32.store offset=1608
                            i32.const 1
                            call $consume_expr_internal
                            local.tee 1
                            br_if 10 (;@2;)
                            block ;; label = @13
                              loop ;; label = @14
                                i32.const 0
                                i32.load offset=1608
                                local.set 1
                                i32.const 1612
                                i32.load offset=20
                                i32.const 1077948416
                                i32.ne
                                br_if 1 (;@13;)
                                block ;; label = @15
                                  local.get 1
                                  br_if 0 (;@15;)
                                  call $blep_parser_callback
                                end
                                call $blep_token_next
                                drop
                                i32.const 1
                                call $consume_expr_internal
                                local.tee 1
                                i32.eqz
                                br_if 0 (;@14;)
                                br 12 (;@2;)
                              end
                            end
                            block ;; label = @13
                              local.get 1
                              br_if 0 (;@13;)
                              i32.const 1
                              call $blep_parser_close
                            end
                            i32.const 0
                            local.get 0
                            i32.store offset=1608
                            i32.const 1612
                            i32.load offset=16
                            local.set 1
                          end
                          block ;; label = @12
                            local.get 1
                            i32.const 2
                            i32.ne
                            br_if 0 (;@12;)
                            i32.const 1612
                            i32.load offset=20
                            br_if 0 (;@12;)
                            block ;; label = @13
                              local.get 0
                              br_if 0 (;@13;)
                              call $blep_parser_callback
                            end
                            call $blep_token_next
                            drop
                            i32.const 0
                            i32.load offset=1608
                            local.set 0
                          end
                          block ;; label = @12
                            local.get 0
                            br_if 0 (;@12;)
                            i32.const 7
                            call $blep_parser_close
                          end
                          i32.const 0
                          local.get 2
                          i32.store offset=1608
                          i32.const 0
                          return
                        end
                        block ;; label = @11
                          block ;; label = @12
                            i32.const 0
                            i32.load offset=1608
                            local.tee 1
                            i32.eqz
                            br_if 0 (;@12;)
                            i32.const 1612
                            i32.const 14
                            i32.store offset=16
                            i32.const 0
                            i32.const 1
                            i32.store offset=1608
                            br 1 (;@11;)
                          end
                          i32.const 7
                          call $blep_parser_open
                          local.set 0
                          i32.const 1612
                          i32.const 14
                          i32.store offset=16
                          i32.const 0
                          local.get 0
                          i32.const 0
                          i32.ne
                          i32.store offset=1608
                          local.get 0
                          br_if 0 (;@11;)
                          call $blep_parser_callback
                        end
                        call $blep_token_next
                        drop
                        block ;; label = @11
                          i32.const 1612
                          i32.load offset=16
                          i32.const 2
                          i32.ne
                          br_if 0 (;@11;)
                          i32.const 1612
                          i32.load offset=20
                          br_if 0 (;@11;)
                          block ;; label = @12
                            i32.const 0
                            i32.load offset=1608
                            br_if 0 (;@12;)
                            call $blep_parser_callback
                          end
                          call $blep_token_next
                          drop
                        end
                        block ;; label = @11
                          i32.const 0
                          i32.load offset=1608
                          br_if 0 (;@11;)
                          i32.const 7
                          call $blep_parser_close
                        end
                        i32.const 0
                        local.get 1
                        i32.store offset=1608
                        i32.const 0
                        return
                      end
                      block ;; label = @10
                        block ;; label = @11
                          i32.const 0
                          i32.load offset=1608
                          local.tee 0
                          i32.eqz
                          br_if 0 (;@11;)
                          i32.const 0
                          i32.const 1
                          i32.store offset=1608
                          i32.const 1612
                          i32.const 14
                          i32.store offset=16
                          i32.const 1612
                          i32.load offset=12
                          local.set 3
                          br 1 (;@10;)
                        end
                        i32.const 7
                        call $blep_parser_open
                        local.set 1
                        i32.const 1612
                        i32.const 14
                        i32.store offset=16
                        i32.const 0
                        local.get 1
                        i32.const 0
                        i32.ne
                        i32.store offset=1608
                        i32.const 1612
                        i32.load offset=12
                        local.set 3
                        local.get 1
                        br_if 0 (;@10;)
                        call $blep_parser_callback
                      end
                      call $blep_token_next
                      drop
                      i32.const 1612
                      i32.load offset=16
                      local.set 1
                      block ;; label = @10
                        local.get 3
                        i32.const 1612
                        i32.load offset=12
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 1
                        i32.const 1
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 1612
                        i64.const 15
                        i64.store offset=16 align=4
                        block ;; label = @11
                          i32.const 0
                          i32.load offset=1608
                          br_if 0 (;@11;)
                          call $blep_parser_callback
                        end
                        call $blep_token_next
                        drop
                        i32.const 1612
                        i32.load offset=16
                        local.set 1
                      end
                      block ;; label = @10
                        local.get 1
                        i32.const 2
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 1612
                        i32.load offset=20
                        br_if 0 (;@10;)
                        block ;; label = @11
                          i32.const 0
                          i32.load offset=1608
                          br_if 0 (;@11;)
                          call $blep_parser_callback
                        end
                        call $blep_token_next
                        drop
                      end
                      block ;; label = @10
                        i32.const 0
                        i32.load offset=1608
                        br_if 0 (;@10;)
                        i32.const 7
                        call $blep_parser_close
                      end
                      i32.const 0
                      local.get 0
                      i32.store offset=1608
                      i32.const 0
                      return
                    end
                    i32.const 18
                    call $consume_class
                    return
                  end
                  call $consume_expr_statement
                  return
                end
                local.get 0
                i32.const 1
                i32.ne
                br_if 1 (;@5;)
                call $consume_export_wrap
                return
              end
              i32.const 0
              local.set 1
              br 3 (;@2;)
            end
            i32.const 1612
            i32.load8_u offset=20
            i32.const 8
            i32.and
            br_if 1 (;@3;)
            call $blep_token_peek
            i32.const 4
            i32.ne
            br_if 1 (;@3;)
            i32.const 1612
            i64.const 15
            i64.store offset=16 align=4
          end
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=1608
              local.tee 0
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              i32.const 1
              i32.store offset=1608
              br 1 (;@4;)
            end
            i32.const 0
            i32.const 8
            call $blep_parser_open
            local.tee 1
            i32.const 0
            i32.ne
            i32.store offset=1608
            local.get 1
            br_if 0 (;@4;)
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
          i32.const -1
          local.set 1
          i32.const 1612
          i32.load offset=16
          i32.const 4
          i32.ne
          br_if 1 (;@2;)
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
          i32.const 0
          call $consume_statement
          local.tee 1
          br_if 1 (;@2;)
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            i32.const 8
            call $blep_parser_close
          end
          i32.const 0
          local.get 0
          i32.store offset=1608
          i32.const 0
          return
        end
        block ;; label = @3
          i32.const 1612
          i32.load offset=20
          local.tee 1
          i32.const 64
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          call $consume_control
          return
        end
        block ;; label = @3
          local.get 1
          i32.const 32
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          call $consume_decl_stack
          return
        end
        block ;; label = @3
          block ;; label = @4
            local.get 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 4
            i32.and
            i32.eqz
            br_if 1 (;@3;)
          end
          call $consume_expr_statement
          return
        end
        block ;; label = @3
          local.get 1
          i32.const 1
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=1608
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              i32.const 1612
              i32.const 14
              i32.store offset=16
              i32.const 0
              i32.const 1
              i32.store offset=1608
              br 1 (;@4;)
            end
            i32.const 7
            call $blep_parser_open
            local.set 0
            i32.const 1612
            i32.const 14
            i32.store offset=16
            i32.const 0
            local.get 0
            i32.const 0
            i32.ne
            i32.store offset=1608
            local.get 0
            br_if 0 (;@4;)
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
          block ;; label = @4
            i32.const 1612
            i32.load offset=16
            i32.const 2
            i32.ne
            br_if 0 (;@4;)
            i32.const 1612
            i32.load offset=20
            br_if 0 (;@4;)
            block ;; label = @5
              i32.const 0
              i32.load offset=1608
              br_if 0 (;@5;)
              call $blep_parser_callback
            end
            call $blep_token_next
            drop
          end
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            i32.const 7
            call $blep_parser_close
          end
          i32.const 0
          local.get 1
          i32.store offset=1608
          i32.const 0
          return
        end
        call $consume_expr_statement
        return
      end
      local.get 1
      return
    end
    block ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      call $consume_expr_statement
      return
    end
    i32.const 18
    call $consume_function
  )
  (func $consume_expr_statement (;10;) (type 5) (result i32)
    (local i32 i32 i32)
    i32.const 1
    local.set 0
    block ;; label = @1
      i32.const 0
      i32.load offset=1608
      local.tee 1
      br_if 0 (;@1;)
      i32.const 1
      call $blep_parser_open
      i32.const 0
      i32.ne
      local.set 0
    end
    i32.const 0
    local.get 0
    i32.store offset=1608
    i32.const 1612
    i32.load offset=4
    local.set 2
    block ;; label = @1
      i32.const 1
      call $consume_expr_internal
      local.tee 0
      br_if 0 (;@1;)
      block ;; label = @2
        loop ;; label = @3
          i32.const 1612
          i32.load offset=20
          local.tee 0
          i32.const 1077948416
          i32.ne
          br_if 1 (;@2;)
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
          i32.const 1
          call $consume_expr_internal
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          br 2 (;@1;)
        end
      end
      block ;; label = @2
        local.get 2
        i32.const 1612
        i32.load offset=4
        i32.ne
        br_if 0 (;@2;)
        i32.const -1
        return
      end
      block ;; label = @2
        i32.const 1612
        i32.load offset=16
        i32.const 2
        i32.ne
        br_if 0 (;@2;)
        local.get 0
        br_if 0 (;@2;)
        block ;; label = @3
          i32.const 0
          i32.load offset=1608
          br_if 0 (;@3;)
          call $blep_parser_callback
        end
        call $blep_token_next
        drop
      end
      i32.const 0
      local.set 0
      block ;; label = @2
        i32.const 0
        i32.load offset=1608
        br_if 0 (;@2;)
        i32.const 1
        call $blep_parser_close
      end
      i32.const 0
      local.get 1
      i32.store offset=1608
    end
    local.get 0
  )
  (func $consume_import (;11;) (type 5) (result i32)
    (local i32 i32 i32)
    i32.const 1612
    i32.const 14
    i32.store offset=16
    block ;; label = @1
      i32.const 0
      i32.load offset=1608
      br_if 0 (;@1;)
      call $blep_parser_callback
    end
    call $blep_token_next
    drop
    block ;; label = @1
      block ;; label = @2
        i32.const 1612
        i32.load offset=16
        local.tee 0
        i32.const 10
        i32.eq
        br_if 0 (;@2;)
        loop ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            local.get 0
                            i32.const -1
                            i32.add
                            i32.const 31
                            i32.rotl
                            br_table 2 (;@10;) 1 (;@11;) 0 (;@12;) 5 (;@7;) 5 (;@7;) 5 (;@7;) 2 (;@10;) 5 (;@7;)
                          end
                          block ;; label = @12
                            i32.const 0
                            call $consume_module_list_deep
                            i32.eqz
                            br_if 0 (;@12;)
                            i32.const -1
                            return
                          end
                          i32.const 1612
                          i32.load offset=20
                          local.tee 0
                          i32.const 1077948416
                          i32.ne
                          br_if 5 (;@6;)
                          i32.const 0
                          i32.load offset=1608
                          br_if 7 (;@4;)
                          br 6 (;@5;)
                        end
                        block ;; label = @11
                          i32.const 1612
                          i32.load offset=20
                          local.tee 0
                          i32.const 1077946368
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 0
                          i32.const 1077948416
                          i32.ne
                          br_if 5 (;@6;)
                          i32.const 0
                          i32.load offset=1608
                          i32.eqz
                          br_if 6 (;@5;)
                          br 7 (;@4;)
                        end
                        block ;; label = @11
                          i32.const 0
                          i32.load offset=1608
                          br_if 0 (;@11;)
                          call $blep_parser_callback
                        end
                        call $blep_token_next
                        drop
                        block ;; label = @11
                          i32.const 1612
                          i32.load offset=20
                          i32.const 1085506560
                          i32.eq
                          br_if 0 (;@11;)
                          i32.const -1
                          return
                        end
                        i32.const 1612
                        i32.const 14
                        i32.store offset=16
                        block ;; label = @11
                          i32.const 0
                          i32.load offset=1608
                          br_if 0 (;@11;)
                          call $blep_parser_callback
                        end
                        call $blep_token_next
                        drop
                        i32.const -1
                        local.set 1
                        block ;; label = @11
                          i32.const 1612
                          i32.load offset=16
                          i32.const -1
                          i32.add
                          br_table 0 (;@11;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 10 (;@1;) 0 (;@11;) 10 (;@1;)
                        end
                        i32.const 1612
                        i64.const 25769803789
                        i64.store offset=16 align=4
                        i32.const 0
                        i32.load offset=1608
                        i32.eqz
                        br_if 1 (;@9;)
                        br 2 (;@8;)
                      end
                      i32.const 1612
                      i64.const 25769803789
                      i64.store offset=16 align=4
                      i32.const 0
                      i32.load offset=1608
                      br_if 1 (;@8;)
                    end
                    call $blep_parser_callback
                  end
                  call $blep_token_next
                  drop
                  i32.const 1612
                  i32.load offset=20
                  local.tee 0
                  i32.const 1077948416
                  i32.ne
                  br_if 1 (;@6;)
                  i32.const 0
                  i32.load offset=1608
                  i32.eqz
                  br_if 2 (;@5;)
                  br 3 (;@4;)
                end
                i32.const 1612
                i32.load offset=20
                local.set 0
              end
              i32.const -1
              local.set 1
              local.get 0
              i32.const 1093834752
              i32.ne
              br_if 4 (;@1;)
              i32.const 1612
              i32.const 14
              i32.store offset=16
              block ;; label = @6
                i32.const 0
                i32.load offset=1608
                br_if 0 (;@6;)
                call $blep_parser_callback
              end
              call $blep_token_next
              drop
              i32.const 1612
              i32.load offset=16
              i32.const 10
              i32.ne
              br_if 4 (;@1;)
              br 3 (;@2;)
            end
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
          i32.const 1612
          i32.load offset=16
          local.set 0
          br 0 (;@3;)
        end
      end
      block ;; label = @2
        i32.const 1612
        i32.load offset=4
        local.tee 0
        i32.load8_u
        i32.const 96
        i32.ne
        br_if 0 (;@2;)
        i32.const 1612
        i32.load offset=8
        local.tee 2
        i32.const 2
        i32.lt_s
        br_if 0 (;@2;)
        i32.const -1
        local.set 1
        local.get 0
        local.get 2
        i32.add
        i32.const -1
        i32.add
        i32.load8_u
        i32.const 96
        i32.ne
        br_if 1 (;@1;)
      end
      i32.const 1612
      i32.const 32
      i32.store offset=20
      block ;; label = @2
        i32.const 0
        i32.load offset=1608
        br_if 0 (;@2;)
        call $blep_parser_callback
      end
      call $blep_token_next
      drop
      block ;; label = @2
        i32.const 1612
        i32.load offset=20
        i32.const 1102283776
        i32.ne
        br_if 0 (;@2;)
        i32.const 1612
        i32.const 14
        i32.store offset=16
        block ;; label = @3
          i32.const 0
          i32.load offset=1608
          br_if 0 (;@3;)
          call $blep_parser_callback
        end
        call $blep_token_next
        drop
        i32.const -1
        local.set 1
        i32.const 1612
        i32.load offset=16
        i32.const 5
        i32.ne
        br_if 1 (;@1;)
        i32.const 0
        call $consume_dict
        local.tee 1
        br_if 1 (;@1;)
      end
      i32.const 0
      local.set 1
    end
    local.get 1
  )
  (func $consume_expr_internal (;12;) (type 1) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 1612
    i32.const 44
    i32.add
    local.set 1
    i32.const 1612
    i32.const 40
    i32.add
    local.set 2
    i32.const 1612
    i32.const 32
    i32.add
    local.set 3
    i32.const 1612
    i32.const 28
    i32.add
    local.set 4
    i32.const 0
    local.set 5
    loop (result i32) ;; label = @1
      i32.const 1612
      i32.load offset=4
      local.set 6
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
                                    i32.const 1612
                                    i32.load offset=16
                                    i32.const -1
                                    i32.add
                                    br_table 0 (;@16;) 10 (;@6;) 10 (;@6;) 10 (;@6;) 10 (;@6;) 10 (;@6;) 1 (;@15;) 10 (;@6;)
                                  end
                                  call $blep_token_peek
                                  drop
                                  i32.const 1612
                                  i32.load offset=20
                                  local.set 7
                                  local.get 1
                                  i32.load
                                  local.tee 8
                                  i32.const 1084126208
                                  i32.eq
                                  br_if 1 (;@14;)
                                  local.get 7
                                  i32.const 1098089472
                                  i32.ne
                                  br_if 9 (;@6;)
                                  block ;; label = @16
                                    local.get 2
                                    i32.load
                                    i32.const -1
                                    i32.add
                                    br_table 0 (;@16;) 10 (;@6;) 10 (;@6;) 10 (;@6;) 10 (;@6;) 10 (;@6;) 1 (;@15;) 10 (;@6;)
                                  end
                                  local.get 8
                                  i32.const 1110808577
                                  i32.ne
                                  br_if 2 (;@13;)
                                  br 9 (;@6;)
                                end
                                i32.const 0
                                i32.load offset=1608
                                br_if 8 (;@6;)
                                i32.const 0
                                i32.const 1
                                i32.store offset=1608
                                call $blep_token_set_restore
                                drop
                                block ;; label = @15
                                  i32.const 1612
                                  i32.load offset=20
                                  i32.const 1098089472
                                  i32.ne
                                  br_if 0 (;@15;)
                                  block ;; label = @16
                                    i32.const 0
                                    i32.load offset=1608
                                    br_if 0 (;@16;)
                                    call $blep_parser_callback
                                  end
                                  call $blep_token_next
                                  drop
                                end
                                block ;; label = @15
                                  block ;; label = @16
                                    i32.const 0
                                    i32.load offset=1608
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.set 7
                                    br 1 (;@15;)
                                  end
                                  i32.const 1
                                  local.set 7
                                end
                                loop ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            block ;; label = @21
                                              block ;; label = @22
                                                local.get 7
                                                br_table 0 (;@22;) 1 (;@21;) 1 (;@21;)
                                              end
                                              call $blep_parser_callback
                                              br 1 (;@20;)
                                            end
                                            call $blep_token_next
                                            drop
                                            block ;; label = @21
                                              i32.const 1612
                                              i32.load offset=20
                                              local.tee 7
                                              i32.const 1087256576
                                              i32.ne
                                              br_if 0 (;@21;)
                                              block ;; label = @22
                                                i32.const 0
                                                i32.load offset=1608
                                                br_if 0 (;@22;)
                                                call $blep_parser_callback
                                              end
                                              call $blep_token_next
                                              drop
                                            end
                                            block ;; label = @21
                                              block ;; label = @22
                                                block ;; label = @23
                                                  block ;; label = @24
                                                    i32.const 1612
                                                    i32.load offset=16
                                                    i32.const -1
                                                    i32.add
                                                    br_table 0 (;@24;) 1 (;@23;) 1 (;@23;) 1 (;@23;) 2 (;@22;) 2 (;@22;) 1 (;@23;) 1 (;@23;) 1 (;@23;) 1 (;@23;) 1 (;@23;) 1 (;@23;) 0 (;@24;) 1 (;@23;)
                                                  end
                                                  i32.const 1612
                                                  i64.const 8589934605
                                                  i64.store offset=16 align=4
                                                  call $blep_token_peek
                                                  drop
                                                  block ;; label = @24
                                                    block ;; label = @25
                                                      local.get 1
                                                      i32.load
                                                      local.tee 7
                                                      i32.const 1077965824
                                                      i32.eq
                                                      br_if 0 (;@25;)
                                                      local.get 7
                                                      i32.const 1085187075
                                                      i32.eq
                                                      br_if 0 (;@25;)
                                                      local.get 7
                                                      i32.const 1084668928
                                                      i32.ne
                                                      br_if 1 (;@24;)
                                                    end
                                                    i32.const 1612
                                                    i32.const 1612
                                                    i32.load offset=20
                                                    i32.const 16
                                                    i32.or
                                                    i32.store offset=20
                                                  end
                                                  block ;; label = @24
                                                    i32.const 0
                                                    i32.load offset=1608
                                                    br_if 0 (;@24;)
                                                    call $blep_parser_callback
                                                  end
                                                  call $blep_token_next
                                                  drop
                                                  br 2 (;@21;)
                                                end
                                                local.get 7
                                                i32.const 1087256576
                                                i32.eq
                                                br_if 4 (;@18;)
                                                br 1 (;@21;)
                                              end
                                              i32.const 2
                                              call $consume_destructuring
                                              br_if 3 (;@18;)
                                            end
                                            block ;; label = @21
                                              i32.const 1612
                                              i32.load offset=20
                                              local.tee 7
                                              i32.const 1077965824
                                              i32.ne
                                              br_if 0 (;@21;)
                                              block ;; label = @22
                                                i32.const 0
                                                i32.load offset=1608
                                                br_if 0 (;@22;)
                                                call $blep_parser_callback
                                              end
                                              call $blep_token_next
                                              drop
                                              i32.const 1
                                              local.set 7
                                              block ;; label = @22
                                                i32.const 0
                                                i32.load offset=1608
                                                local.tee 8
                                                br_if 0 (;@22;)
                                                i32.const 1
                                                call $blep_parser_open
                                                i32.const 0
                                                i32.ne
                                                local.set 7
                                              end
                                              i32.const 0
                                              local.get 7
                                              i32.store offset=1608
                                              i32.const 1612
                                              i32.load offset=4
                                              local.set 7
                                              i32.const 0
                                              call $consume_expr_internal
                                              br_if 3 (;@18;)
                                              local.get 7
                                              i32.const 1612
                                              i32.load offset=4
                                              i32.eq
                                              br_if 3 (;@18;)
                                              block ;; label = @22
                                                i32.const 0
                                                i32.load offset=1608
                                                br_if 0 (;@22;)
                                                i32.const 1
                                                call $blep_parser_close
                                              end
                                              i32.const 0
                                              local.get 8
                                              i32.store offset=1608
                                              i32.const 1612
                                              i32.load offset=20
                                              local.set 7
                                            end
                                            local.get 7
                                            i32.const 1077948416
                                            i32.ne
                                            br_if 1 (;@19;)
                                            i32.const 0
                                            i32.load offset=1608
                                            i32.eqz
                                            br_if 4 (;@16;)
                                          end
                                          i32.const 1
                                          local.set 7
                                          br 4 (;@15;)
                                        end
                                        i32.const 0
                                        i32.load offset=1608
                                        local.set 7
                                        i32.const 1612
                                        i32.load offset=16
                                        i32.const 9
                                        i32.ne
                                        br_if 1 (;@17;)
                                        block ;; label = @19
                                          local.get 7
                                          br_if 0 (;@19;)
                                          call $blep_parser_callback
                                        end
                                        call $blep_token_next
                                        drop
                                        i32.const 0
                                        i32.load offset=1608
                                        local.set 7
                                        i32.const 1612
                                        i32.load offset=20
                                        i32.const 1084126208
                                        i32.ne
                                        br_if 1 (;@17;)
                                        i32.const 0
                                        local.get 7
                                        i32.const -1
                                        i32.add
                                        i32.store offset=1608
                                        call $blep_token_restore
                                        drop
                                        i32.const 1612
                                        i32.load offset=20
                                        local.set 7
                                        br 4 (;@14;)
                                      end
                                      i32.const 0
                                      i32.load offset=1608
                                      local.set 7
                                    end
                                    i32.const 0
                                    local.get 7
                                    i32.const -1
                                    i32.add
                                    i32.store offset=1608
                                    call $blep_token_restore
                                    drop
                                    br 10 (;@6;)
                                  end
                                  i32.const 0
                                  local.set 7
                                  br 0 (;@15;)
                                end
                              end
                              local.get 7
                              i32.const 1098089472
                              i32.ne
                              br_if 1 (;@12;)
                            end
                            block ;; label = @13
                              call $blep_token_peek
                              i32.const 3
                              i32.ne
                              br_if 0 (;@13;)
                              local.get 1
                              i32.load
                              i32.const 1084126208
                              i32.eq
                              br_if 1 (;@12;)
                            end
                            i32.const 1612
                            i32.const 14
                            i32.store offset=16
                            i32.const 0
                            i32.load offset=1608
                            local.tee 9
                            br_if 2 (;@10;)
                            i32.const 1
                            local.set 7
                            br 1 (;@11;)
                          end
                          i32.const 0
                          local.set 7
                          i32.const 1
                          local.set 8
                          i32.const 1
                          local.set 10
                          i32.const 0
                          i32.load offset=1608
                          local.tee 9
                          br_if 4 (;@7;)
                        end
                        i32.const 0
                        local.set 9
                        i32.const 0
                        i32.const 5
                        call $blep_parser_open
                        local.tee 10
                        i32.const 0
                        i32.ne
                        local.tee 8
                        i32.store offset=1608
                        local.get 7
                        i32.eqz
                        br_if 2 (;@8;)
                        i32.const 0
                        local.set 9
                        local.get 10
                        br_if 1 (;@9;)
                        call $blep_parser_callback
                        br 1 (;@9;)
                      end
                      i32.const 0
                      i32.const 1
                      i32.store offset=1608
                    end
                    call $blep_token_next
                    drop
                    i32.const 0
                    i32.load offset=1608
                    local.set 8
                  end
                  i32.const 1
                  local.set 10
                  local.get 8
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 8
                  i32.const 11
                  call $blep_parser_open
                  i32.const 0
                  i32.ne
                  local.set 10
                end
                i32.const 0
                local.get 10
                i32.store offset=1608
                i32.const -1
                local.set 7
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        i32.const 1612
                        i32.load offset=16
                        i32.const -1
                        i32.add
                        br_table 0 (;@10;) 5 (;@5;) 5 (;@5;) 5 (;@5;) 5 (;@5;) 5 (;@5;) 1 (;@9;) 5 (;@5;)
                      end
                      i32.const 1612
                      i64.const 8589934605
                      i64.store offset=16 align=4
                      local.get 10
                      i32.eqz
                      br_if 1 (;@8;)
                      br 2 (;@7;)
                    end
                    block ;; label = @9
                      local.get 10
                      br_if 0 (;@9;)
                      call $blep_parser_callback
                    end
                    call $blep_token_next
                    drop
                    block ;; label = @9
                      i32.const 1612
                      i32.load offset=16
                      i32.const 9
                      i32.eq
                      br_if 0 (;@9;)
                      i32.const 4
                      i32.const 0
                      call $consume_definition_list
                      local.tee 7
                      br_if 4 (;@5;)
                      i32.const 1612
                      i32.load offset=16
                      i32.const 9
                      i32.eq
                      br_if 0 (;@9;)
                      i32.const -1
                      return
                    end
                    i32.const 0
                    i32.load offset=1608
                    br_if 1 (;@7;)
                  end
                  call $blep_parser_callback
                end
                call $blep_token_next
                drop
                i32.const -1
                local.set 7
                i32.const 1612
                i32.load offset=20
                i32.const 1084126208
                i32.ne
                br_if 1 (;@5;)
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1608
                  br_if 0 (;@7;)
                  call $blep_parser_callback
                end
                call $blep_token_next
                drop
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      i32.const 1612
                      i32.load offset=16
                      i32.const 5
                      i32.ne
                      br_if 0 (;@9;)
                      i32.const 0
                      call $consume_statement
                      local.set 7
                      br 1 (;@8;)
                    end
                    i32.const 1612
                    i32.load offset=4
                    local.set 11
                    local.get 0
                    call $consume_expr_internal
                    local.tee 10
                    i32.const -1
                    i32.const 0
                    local.get 11
                    i32.const 1612
                    i32.load offset=4
                    local.tee 12
                    i32.eq
                    select
                    local.get 10
                    select
                    local.set 7
                    local.get 10
                    br_if 0 (;@8;)
                    local.get 11
                    local.get 12
                    i32.ne
                    br_if 1 (;@7;)
                  end
                  local.get 7
                  br_if 2 (;@5;)
                end
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1608
                  br_if 0 (;@7;)
                  i32.const 11
                  call $blep_parser_close
                end
                i32.const 0
                local.get 8
                i32.store offset=1608
                block ;; label = @7
                  local.get 8
                  br_if 0 (;@7;)
                  i32.const 5
                  call $blep_parser_close
                end
                i32.const 0
                local.get 9
                i32.store offset=1608
              end
              block ;; label = @6
                block ;; label = @7
                  local.get 6
                  i32.const 1612
                  i32.load offset=4
                  i32.eq
                  br_if 0 (;@7;)
                  block ;; label = @8
                    local.get 5
                    br_if 0 (;@8;)
                    i32.const 0
                    return
                  end
                  i32.const 0
                  local.set 8
                  i32.const 1612
                  i32.load offset=16
                  i32.const 9
                  i32.eq
                  br_if 1 (;@6;)
                  i32.const 1612
                  i32.load offset=20
                  i32.const 1077948416
                  i32.eq
                  br_if 1 (;@6;)
                  i32.const -1
                  return
                end
                block ;; label = @7
                  i32.const 1612
                  i32.load offset=16
                  i32.const -5
                  i32.add
                  i32.const 1
                  i32.gt_u
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.load offset=1608
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.const 1
                  i32.store offset=1608
                  call $blep_token_set_restore
                  drop
                  i32.const 0
                  call $consume_destructuring
                  local.set 7
                  i32.const 0
                  i32.const 0
                  i32.load offset=1608
                  i32.const -1
                  i32.add
                  i32.store offset=1608
                  i32.const 1612
                  i32.load offset=20
                  local.set 8
                  call $blep_token_restore
                  drop
                  local.get 7
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const 1077965824
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  call $consume_destructuring
                  local.tee 7
                  br_if 2 (;@5;)
                end
                i32.const 0
                i32.const 1612
                i32.load offset=12
                local.get 6
                i32.const 1612
                i32.load offset=4
                i32.eq
                select
                local.set 8
              end
              loop ;; label = @6
                i32.const 1612
                i32.load offset=16
                local.set 7
                block ;; label = @7
                  loop ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            block ;; label = @21
                                              block ;; label = @22
                                                block ;; label = @23
                                                  block ;; label = @24
                                                    block ;; label = @25
                                                      block ;; label = @26
                                                        block ;; label = @27
                                                          local.get 7
                                                          i32.const -1
                                                          i32.add
                                                          br_table 1 (;@26;) 6 (;@21;) 0 (;@27;) 6 (;@21;) 6 (;@21;) 6 (;@21;) 6 (;@21;) 6 (;@21;) 6 (;@21;) 6 (;@21;) 2 (;@25;) 6 (;@21;)
                                                        end
                                                        local.get 8
                                                        br_if 5 (;@21;)
                                                        i32.const 11
                                                        local.set 7
                                                        i32.const 1612
                                                        i32.load offset=4
                                                        i32.load8_u
                                                        i32.const 47
                                                        i32.eq
                                                        br_if 2 (;@24;)
                                                        br 5 (;@21;)
                                                      end
                                                      i32.const 1612
                                                      i32.const 13
                                                      i32.store offset=16
                                                      block ;; label = @26
                                                        block ;; label = @27
                                                          block ;; label = @28
                                                            i32.const 1612
                                                            i32.load offset=20
                                                            local.tee 7
                                                            i32.const 1097632768
                                                            i32.gt_s
                                                            br_if 0 (;@28;)
                                                            local.get 7
                                                            i32.const 1084668928
                                                            i32.eq
                                                            br_if 2 (;@26;)
                                                            local.get 7
                                                            i32.const 1088796677
                                                            i32.ne
                                                            br_if 1 (;@27;)
                                                            call $blep_token_peek
                                                            drop
                                                            local.get 1
                                                            i32.load
                                                            i32.const 1077950464
                                                            i32.eq
                                                            br_if 7 (;@21;)
                                                            br 18 (;@10;)
                                                          end
                                                          local.get 7
                                                          i32.const 1098089472
                                                          i32.eq
                                                          br_if 4 (;@23;)
                                                          local.get 7
                                                          i32.const 1097632769
                                                          i32.eq
                                                          br_if 5 (;@22;)
                                                          local.get 7
                                                          i32.const 1110808577
                                                          i32.eq
                                                          br_if 5 (;@22;)
                                                        end
                                                        local.get 7
                                                        i32.const 6
                                                        i32.and
                                                        br_if 16 (;@10;)
                                                        local.get 7
                                                        i32.const 1
                                                        i32.and
                                                        i32.eqz
                                                        br_if 5 (;@21;)
                                                        local.get 0
                                                        i32.eqz
                                                        br_if 4 (;@22;)
                                                        local.get 5
                                                        br_if 4 (;@22;)
                                                        i32.const 0
                                                        return
                                                      end
                                                      local.get 0
                                                      br_if 14 (;@11;)
                                                      local.get 8
                                                      br_if 15 (;@10;)
                                                      br 14 (;@11;)
                                                    end
                                                    i32.const 3
                                                    local.set 7
                                                    local.get 8
                                                    i32.eqz
                                                    br_if 3 (;@21;)
                                                  end
                                                  local.get 7
                                                  call $blep_token_update
                                                  drop
                                                  br 2 (;@21;)
                                                end
                                                call $blep_token_peek
                                                drop
                                                local.get 1
                                                i32.load
                                                i32.const 1110808577
                                                i32.ne
                                                br_if 1 (;@21;)
                                              end
                                              i32.const 1612
                                              i32.const 14
                                              i32.store offset=16
                                              br 1 (;@20;)
                                            end
                                            i32.const 1612
                                            i32.load offset=16
                                            local.tee 10
                                            i32.const 3
                                            i32.eq
                                            br_if 11 (;@9;)
                                            i32.const 0
                                            local.set 7
                                            local.get 10
                                            i32.const -5
                                            i32.add
                                            br_table 2 (;@18;) 1 (;@19;) 4 (;@16;) 3 (;@17;) 5 (;@15;) 6 (;@14;) 7 (;@13;) 7 (;@13;) 9 (;@11;) 0 (;@20;) 15 (;@5;)
                                          end
                                          block ;; label = @20
                                            local.get 0
                                            i32.eqz
                                            br_if 0 (;@20;)
                                            local.get 8
                                            i32.eqz
                                            br_if 0 (;@20;)
                                            local.get 5
                                            br_if 0 (;@20;)
                                            i32.const 0
                                            return
                                          end
                                          i32.const 1612
                                          i32.load offset=12
                                          local.set 8
                                          i32.const 1612
                                          i32.load offset=20
                                          local.tee 7
                                          i32.const 1097632769
                                          i32.eq
                                          br_if 7 (;@12;)
                                          block ;; label = @20
                                            block ;; label = @21
                                              local.get 7
                                              i32.const 1110808577
                                              i32.eq
                                              br_if 0 (;@21;)
                                              local.get 7
                                              i32.const 1098089472
                                              i32.ne
                                              br_if 1 (;@20;)
                                            end
                                            i32.const 0
                                            call $consume_function
                                            local.tee 7
                                            i32.eqz
                                            br_if 14 (;@6;)
                                            br 15 (;@5;)
                                          end
                                          block ;; label = @20
                                            i32.const 0
                                            i32.load offset=1608
                                            br_if 0 (;@20;)
                                            call $blep_parser_callback
                                          end
                                          call $blep_token_next
                                          drop
                                          br 13 (;@6;)
                                        end
                                        i32.const 1612
                                        i32.load offset=12
                                        local.set 8
                                        block ;; label = @19
                                          i32.const 0
                                          i32.load offset=1608
                                          br_if 0 (;@19;)
                                          call $blep_parser_callback
                                        end
                                        call $blep_token_next
                                        drop
                                        loop ;; label = @19
                                          i32.const 0
                                          call $consume_expr_internal
                                          local.tee 7
                                          br_if 14 (;@5;)
                                          block ;; label = @20
                                            i32.const 1612
                                            i32.load offset=20
                                            i32.const 1077948416
                                            i32.ne
                                            br_if 0 (;@20;)
                                            block ;; label = @21
                                              i32.const 0
                                              i32.load offset=1608
                                              br_if 0 (;@21;)
                                              call $blep_parser_callback
                                            end
                                            call $blep_token_next
                                            drop
                                            br 1 (;@19;)
                                          end
                                        end
                                        block ;; label = @19
                                          i32.const 1612
                                          i32.load offset=16
                                          i32.const 9
                                          i32.eq
                                          br_if 0 (;@19;)
                                          i32.const -1
                                          return
                                        end
                                        block ;; label = @19
                                          i32.const 0
                                          i32.load offset=1608
                                          br_if 0 (;@19;)
                                          call $blep_parser_callback
                                        end
                                        call $blep_token_next
                                        drop
                                        br 12 (;@6;)
                                      end
                                      block ;; label = @18
                                        local.get 0
                                        i32.eqz
                                        br_if 0 (;@18;)
                                        local.get 8
                                        i32.eqz
                                        br_if 0 (;@18;)
                                        local.get 5
                                        i32.eqz
                                        br_if 13 (;@5;)
                                      end
                                      i32.const 1612
                                      i32.load offset=12
                                      local.set 8
                                      i32.const 0
                                      call $consume_dict
                                      local.tee 7
                                      i32.eqz
                                      br_if 11 (;@6;)
                                      br 12 (;@5;)
                                    end
                                    block ;; label = @17
                                      i32.const 0
                                      i32.load offset=1608
                                      br_if 0 (;@17;)
                                      call $blep_parser_callback
                                    end
                                    call $blep_token_next
                                    drop
                                    loop ;; label = @17
                                      i32.const 0
                                      call $consume_expr_internal
                                      local.tee 7
                                      br_if 12 (;@5;)
                                      block ;; label = @18
                                        i32.const 1612
                                        i32.load offset=20
                                        i32.const 1077948416
                                        i32.ne
                                        br_if 0 (;@18;)
                                        block ;; label = @19
                                          i32.const 0
                                          i32.load offset=1608
                                          br_if 0 (;@19;)
                                          call $blep_parser_callback
                                        end
                                        call $blep_token_next
                                        drop
                                        br 1 (;@17;)
                                      end
                                    end
                                    block ;; label = @17
                                      i32.const 1612
                                      i32.load offset=16
                                      i32.const 9
                                      i32.eq
                                      br_if 0 (;@17;)
                                      i32.const -1
                                      return
                                    end
                                    block ;; label = @17
                                      i32.const 0
                                      i32.load offset=1608
                                      br_if 0 (;@17;)
                                      call $blep_parser_callback
                                    end
                                    call $blep_token_next
                                    drop
                                    i32.const 0
                                    local.set 8
                                    br 10 (;@6;)
                                  end
                                  block ;; label = @16
                                    local.get 8
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    block ;; label = @17
                                      i32.const 0
                                      i32.load offset=1608
                                      br_if 0 (;@17;)
                                      call $blep_parser_callback
                                    end
                                    call $blep_token_next
                                    drop
                                    loop ;; label = @17
                                      i32.const 0
                                      call $consume_expr_internal
                                      local.tee 7
                                      br_if 12 (;@5;)
                                      block ;; label = @18
                                        i32.const 1612
                                        i32.load offset=20
                                        i32.const 1077948416
                                        i32.ne
                                        br_if 0 (;@18;)
                                        block ;; label = @19
                                          i32.const 0
                                          i32.load offset=1608
                                          br_if 0 (;@19;)
                                          call $blep_parser_callback
                                        end
                                        call $blep_token_next
                                        drop
                                        br 1 (;@17;)
                                      end
                                    end
                                    block ;; label = @17
                                      i32.const 1612
                                      i32.load offset=16
                                      i32.const 9
                                      i32.eq
                                      br_if 0 (;@17;)
                                      i32.const -1
                                      return
                                    end
                                    block ;; label = @17
                                      i32.const 0
                                      i32.load offset=1608
                                      br_if 0 (;@17;)
                                      call $blep_parser_callback
                                    end
                                    call $blep_token_next
                                    drop
                                    i32.const 1612
                                    i32.load offset=12
                                    local.set 8
                                    br 10 (;@6;)
                                  end
                                  block ;; label = @16
                                    i32.const 0
                                    i32.load offset=1608
                                    br_if 0 (;@16;)
                                    call $blep_parser_callback
                                  end
                                  local.get 5
                                  i32.const 1
                                  i32.add
                                  local.set 10
                                  call $blep_token_next
                                  drop
                                  block ;; label = @16
                                    i32.const 1612
                                    i32.load offset=16
                                    i32.const 1
                                    i32.eq
                                    br_if 0 (;@16;)
                                    local.get 10
                                    local.set 5
                                    br 15 (;@1;)
                                  end
                                  block ;; label = @16
                                    i32.const 1612
                                    i32.load8_u offset=20
                                    i32.const 1
                                    i32.and
                                    i32.eqz
                                    br_if 0 (;@16;)
                                    local.get 10
                                    local.set 5
                                    br 15 (;@1;)
                                  end
                                  block ;; label = @16
                                    call $blep_token_peek
                                    i32.const 9
                                    i32.eq
                                    br_if 0 (;@16;)
                                    local.get 10
                                    local.set 5
                                    br 15 (;@1;)
                                  end
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        i32.const 0
                                        i32.load offset=1608
                                        i32.eqz
                                        br_if 0 (;@18;)
                                        i32.const 1612
                                        i32.const 13
                                        i32.store offset=16
                                        br 1 (;@17;)
                                      end
                                      i32.const 0
                                      i32.const 1
                                      i32.store offset=1608
                                      call $blep_token_set_restore
                                      drop
                                      loop ;; label = @18
                                        block ;; label = @19
                                          i32.const 0
                                          i32.load offset=1608
                                          br_if 0 (;@19;)
                                          call $blep_parser_callback
                                        end
                                        call $blep_token_next
                                        drop
                                        call $blep_token_peek
                                        drop
                                        block ;; label = @19
                                          local.get 2
                                          i32.load
                                          i32.const 9
                                          i32.ne
                                          br_if 0 (;@19;)
                                          local.get 5
                                          i32.const 0
                                          i32.ne
                                          local.set 7
                                          local.get 5
                                          i32.const -1
                                          i32.add
                                          local.set 5
                                          local.get 7
                                          br_if 1 (;@18;)
                                        end
                                      end
                                      call $blep_token_peek
                                      drop
                                      i32.const 1
                                      local.set 8
                                      block ;; label = @18
                                        local.get 1
                                        i32.load
                                        local.tee 5
                                        i32.const 1077965824
                                        i32.eq
                                        br_if 0 (;@18;)
                                        i32.const 0
                                        local.set 8
                                        local.get 3
                                        i32.load
                                        local.tee 7
                                        i32.const 2
                                        i32.lt_s
                                        br_if 0 (;@18;)
                                        local.get 4
                                        i32.load
                                        local.get 7
                                        i32.add
                                        local.tee 7
                                        i32.const -1
                                        i32.add
                                        i32.load8_u
                                        i32.const 61
                                        i32.ne
                                        br_if 0 (;@18;)
                                        local.get 7
                                        i32.const -2
                                        i32.add
                                        i32.load8_u
                                        i32.const 61
                                        i32.ne
                                        local.set 8
                                      end
                                      i32.const 0
                                      i32.const 0
                                      i32.load offset=1608
                                      i32.const -1
                                      i32.add
                                      i32.store offset=1608
                                      call $blep_token_restore
                                      drop
                                      i32.const 1612
                                      i32.const 13
                                      i32.store offset=16
                                      i32.const 16
                                      local.set 7
                                      local.get 5
                                      i32.const 1082993664
                                      i32.eq
                                      local.get 8
                                      i32.or
                                      br_if 1 (;@16;)
                                    end
                                    i32.const 0
                                    local.set 7
                                  end
                                  i32.const 1612
                                  local.get 7
                                  i32.store offset=20
                                  block ;; label = @16
                                    i32.const 0
                                    i32.load offset=1608
                                    br_if 0 (;@16;)
                                    call $blep_parser_callback
                                  end
                                  call $blep_token_next
                                  drop
                                  i32.const 0
                                  local.set 8
                                  local.get 10
                                  local.set 5
                                  br 9 (;@6;)
                                end
                                local.get 5
                                i32.eqz
                                br_if 9 (;@5;)
                                block ;; label = @15
                                  i32.const 0
                                  i32.load offset=1608
                                  br_if 0 (;@15;)
                                  call $blep_parser_callback
                                end
                                call $blep_token_next
                                drop
                                block ;; label = @15
                                  i32.const 0
                                  i32.load offset=1608
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  i32.const 1612
                                  i32.load offset=20
                                  i32.const 1084126208
                                  i32.ne
                                  br_if 0 (;@15;)
                                  call $blep_token_next
                                  drop
                                  block ;; label = @16
                                    block ;; label = @17
                                      i32.const 1612
                                      i32.load offset=16
                                      i32.const 5
                                      i32.ne
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      call $consume_statement
                                      local.set 7
                                      br 1 (;@16;)
                                    end
                                    i32.const 1612
                                    i32.load offset=4
                                    local.set 10
                                    local.get 0
                                    call $consume_expr_internal
                                    local.tee 8
                                    i32.const -1
                                    i32.const 0
                                    local.get 10
                                    i32.const 1612
                                    i32.load offset=4
                                    local.tee 9
                                    i32.eq
                                    select
                                    local.get 8
                                    select
                                    local.set 7
                                    local.get 8
                                    br_if 0 (;@16;)
                                    local.get 10
                                    local.get 9
                                    i32.ne
                                    br_if 1 (;@15;)
                                  end
                                  local.get 7
                                  br_if 10 (;@5;)
                                end
                                local.get 5
                                i32.const -1
                                i32.add
                                local.set 5
                                i32.const 1612
                                i32.load offset=48
                                local.set 8
                                br 8 (;@6;)
                              end
                              block ;; label = @14
                                i32.const 1612
                                i32.load offset=4
                                local.tee 10
                                i32.load8_u
                                local.tee 9
                                i32.const 96
                                i32.eq
                                br_if 0 (;@14;)
                                local.get 9
                                i32.const 125
                                i32.eq
                                br_if 9 (;@5;)
                                block ;; label = @15
                                  local.get 0
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 8
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 5
                                  i32.eqz
                                  br_if 10 (;@5;)
                                end
                                i32.const 1612
                                i32.load offset=12
                                local.set 8
                                block ;; label = @15
                                  i32.const 0
                                  i32.load offset=1608
                                  br_if 0 (;@15;)
                                  call $blep_parser_callback
                                end
                                call $blep_token_next
                                drop
                                br 8 (;@6;)
                              end
                              loop ;; label = @14
                                local.get 10
                                i32.const 1612
                                i32.load offset=8
                                i32.add
                                i32.const -1
                                i32.add
                                i32.load8_u
                                local.set 8
                                block ;; label = @15
                                  i32.const 0
                                  i32.load offset=1608
                                  br_if 0 (;@15;)
                                  call $blep_parser_callback
                                end
                                call $blep_token_next
                                drop
                                block ;; label = @15
                                  local.get 8
                                  i32.const 123
                                  i32.eq
                                  br_if 0 (;@15;)
                                  i32.const -1
                                  local.set 7
                                  local.get 8
                                  i32.const 96
                                  i32.ne
                                  br_if 10 (;@5;)
                                  i32.const 1612
                                  i32.load offset=12
                                  local.set 8
                                  br 9 (;@6;)
                                end
                                loop ;; label = @15
                                  i32.const 0
                                  call $consume_expr_internal
                                  local.tee 7
                                  br_if 10 (;@5;)
                                  block ;; label = @16
                                    i32.const 1612
                                    i32.load offset=20
                                    i32.const 1077948416
                                    i32.ne
                                    br_if 0 (;@16;)
                                    block ;; label = @17
                                      i32.const 0
                                      i32.load offset=1608
                                      br_if 0 (;@17;)
                                      call $blep_parser_callback
                                    end
                                    call $blep_token_next
                                    drop
                                    br 1 (;@15;)
                                  end
                                end
                                block ;; label = @15
                                  i32.const 1612
                                  i32.load offset=16
                                  i32.const 10
                                  i32.ne
                                  br_if 0 (;@15;)
                                  i32.const -1
                                  local.set 7
                                  i32.const 1612
                                  i32.load offset=4
                                  local.tee 10
                                  i32.load8_u
                                  i32.const 125
                                  i32.ne
                                  br_if 10 (;@5;)
                                  br 1 (;@14;)
                                end
                              end
                              i32.const -1
                              return
                            end
                            block ;; label = @13
                              local.get 0
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 8
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 5
                              i32.eqz
                              br_if 8 (;@5;)
                            end
                            i32.const 1612
                            i32.load offset=12
                            local.set 8
                            block ;; label = @13
                              i32.const 0
                              i32.load offset=1608
                              br_if 0 (;@13;)
                              call $blep_parser_callback
                            end
                            call $blep_token_next
                            drop
                            br 6 (;@6;)
                          end
                          i32.const 0
                          call $consume_class
                          local.tee 7
                          i32.eqz
                          br_if 5 (;@6;)
                          br 6 (;@5;)
                        end
                        block ;; label = @11
                          local.get 0
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 8
                          i32.eqz
                          br_if 0 (;@11;)
                          local.get 5
                          br_if 0 (;@11;)
                          i32.const 0
                          return
                        end
                        i32.const 1612
                        i32.const 0
                        i32.store offset=20
                        i32.const 1612
                        i32.load offset=12
                        local.set 8
                        call $blep_token_peek
                        drop
                        block ;; label = @11
                          block ;; label = @12
                            local.get 1
                            i32.load
                            local.tee 7
                            i32.const 1077965824
                            i32.eq
                            br_if 0 (;@12;)
                            i32.const 0
                            local.set 10
                            block ;; label = @13
                              local.get 3
                              i32.load
                              local.tee 9
                              i32.const 2
                              i32.lt_s
                              br_if 0 (;@13;)
                              local.get 4
                              i32.load
                              local.get 9
                              i32.add
                              local.tee 9
                              i32.const -1
                              i32.add
                              i32.load8_u
                              i32.const 61
                              i32.ne
                              br_if 0 (;@13;)
                              local.get 9
                              i32.const -2
                              i32.add
                              i32.load8_u
                              i32.const 61
                              i32.ne
                              local.set 10
                            end
                            local.get 7
                            i32.const 1082993664
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 10
                            i32.eqz
                            br_if 1 (;@11;)
                          end
                          i32.const 1612
                          i32.const 16
                          i32.store offset=20
                        end
                        block ;; label = @11
                          i32.const 0
                          i32.load offset=1608
                          br_if 0 (;@11;)
                          call $blep_parser_callback
                        end
                        call $blep_token_next
                        drop
                        br 4 (;@6;)
                      end
                      i32.const 1612
                      i32.const 3
                      i32.store offset=16
                    end
                    block ;; label = @9
                      i32.const 1612
                      i32.load offset=20
                      local.tee 7
                      i32.const 4
                      i32.and
                      i32.eqz
                      br_if 0 (;@9;)
                      block ;; label = @10
                        local.get 0
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 6
                        i32.const 1612
                        i32.load offset=4
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 8
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 5
                        br_if 0 (;@10;)
                        i32.const 0
                        return
                      end
                      block ;; label = @10
                        local.get 7
                        i32.const 1097458693
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 1612
                        i32.load offset=12
                        local.set 7
                        block ;; label = @11
                          i32.const 0
                          i32.load offset=1608
                          br_if 0 (;@11;)
                          call $blep_parser_callback
                        end
                        call $blep_token_next
                        drop
                        i32.const 0
                        local.set 8
                        local.get 0
                        i32.eqz
                        br_if 4 (;@6;)
                        i32.const 1612
                        i32.load offset=12
                        local.get 7
                        i32.eq
                        br_if 4 (;@6;)
                        i32.const 0
                        local.set 7
                        local.get 5
                        br_if 4 (;@6;)
                        br 5 (;@5;)
                      end
                      block ;; label = @10
                        i32.const 0
                        i32.load offset=1608
                        br_if 0 (;@10;)
                        call $blep_parser_callback
                      end
                      call $blep_token_next
                      drop
                      i32.const 0
                      local.set 8
                      br 3 (;@6;)
                    end
                    block ;; label = @9
                      block ;; label = @10
                        local.get 7
                        i32.const 1077965824
                        i32.eq
                        br_if 0 (;@10;)
                        i32.const 1612
                        i32.load offset=8
                        local.tee 10
                        i32.const 2
                        i32.lt_s
                        br_if 1 (;@9;)
                        i32.const 1612
                        i32.load offset=4
                        local.get 10
                        i32.add
                        local.tee 10
                        i32.const -1
                        i32.add
                        i32.load8_u
                        i32.const 61
                        i32.ne
                        br_if 1 (;@9;)
                        local.get 10
                        i32.const -2
                        i32.add
                        i32.load8_u
                        i32.const 61
                        i32.eq
                        br_if 1 (;@9;)
                      end
                      i32.const 0
                      i32.load offset=1608
                      i32.eqz
                      br_if 6 (;@3;)
                      br 7 (;@2;)
                    end
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            local.get 7
                            i32.const 1083079679
                            i32.gt_s
                            br_if 0 (;@12;)
                            local.get 7
                            i32.const 1077950464
                            i32.eq
                            br_if 2 (;@10;)
                            local.get 7
                            i32.const 1077948416
                            i32.eq
                            br_if 1 (;@11;)
                            local.get 7
                            i32.const 1082993664
                            i32.eq
                            br_if 3 (;@9;)
                            br 5 (;@7;)
                          end
                          local.get 7
                          i32.const 1083079680
                          i32.eq
                          br_if 1 (;@10;)
                          block ;; label = @12
                            local.get 7
                            i32.const 1084126208
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 7
                            i32.const 1097458693
                            i32.ne
                            br_if 5 (;@7;)
                            block ;; label = @13
                              i32.const 0
                              i32.load offset=1608
                              br_if 0 (;@13;)
                              call $blep_parser_callback
                            end
                            call $blep_token_next
                            drop
                          end
                          block ;; label = @12
                            i32.const 0
                            i32.load offset=1608
                            br_if 0 (;@12;)
                            call $blep_parser_callback
                          end
                          call $blep_token_next
                          drop
                          i32.const 1612
                          i32.load offset=16
                          i32.const 5
                          i32.ne
                          br_if 10 (;@1;)
                          i32.const 0
                          call $consume_statement
                          local.tee 7
                          i32.eqz
                          br_if 10 (;@1;)
                          br 6 (;@5;)
                        end
                        local.get 5
                        br_if 6 (;@4;)
                        i32.const 0
                        return
                      end
                      block ;; label = @10
                        local.get 0
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 8
                        br_if 0 (;@10;)
                        local.get 5
                        br_if 0 (;@10;)
                        i32.const 0
                        return
                      end
                      block ;; label = @10
                        i32.const 0
                        i32.load offset=1608
                        br_if 0 (;@10;)
                        call $blep_parser_callback
                      end
                      call $blep_token_next
                      drop
                      block ;; label = @10
                        i32.const 1612
                        i32.load offset=16
                        local.tee 7
                        i32.const -2
                        i32.and
                        i32.const 6
                        i32.ne
                        br_if 0 (;@10;)
                        i32.const 1612
                        i32.load offset=12
                        local.set 8
                        br 2 (;@8;)
                      end
                      block ;; label = @10
                        local.get 7
                        i32.const 1
                        i32.eq
                        br_if 0 (;@10;)
                        i32.const -1
                        return
                      end
                      i32.const 1612
                      i32.const 8
                      i32.store offset=20
                      block ;; label = @10
                        i32.const 0
                        i32.load offset=1608
                        br_if 0 (;@10;)
                        call $blep_parser_callback
                      end
                      call $blep_token_next
                      drop
                      br 3 (;@6;)
                    end
                    block ;; label = @9
                      local.get 8
                      i32.eqz
                      br_if 0 (;@9;)
                      block ;; label = @10
                        local.get 0
                        i32.eqz
                        br_if 0 (;@10;)
                        i32.const 1612
                        i32.load offset=12
                        local.get 8
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 5
                        br_if 0 (;@10;)
                        i32.const 0
                        return
                      end
                      block ;; label = @10
                        i32.const 0
                        i32.load offset=1608
                        br_if 0 (;@10;)
                        call $blep_parser_callback
                      end
                      call $blep_token_next
                      drop
                      br 3 (;@6;)
                    end
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=1608
                      br_if 0 (;@9;)
                      call $blep_parser_callback
                    end
                    call $blep_token_next
                    drop
                    i32.const 0
                    local.set 8
                    i32.const 0
                    local.set 10
                    block ;; label = @9
                      i32.const 1612
                      i32.load offset=16
                      local.tee 7
                      i32.const 7
                      i32.ne
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 10
                      loop ;; label = @10
                        block ;; label = @11
                          i32.const 0
                          i32.load offset=1608
                          br_if 0 (;@11;)
                          call $blep_parser_callback
                        end
                        local.get 10
                        i32.const 1
                        i32.add
                        local.set 10
                        call $blep_token_next
                        drop
                        i32.const 1612
                        i32.load offset=16
                        local.tee 7
                        i32.const 7
                        i32.eq
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 10
                    local.get 5
                    i32.add
                    local.set 5
                    local.get 7
                    i32.const 1
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  call $blep_token_peek
                  drop
                  block ;; label = @8
                    local.get 2
                    i32.load
                    local.tee 7
                    i32.const 9
                    i32.eq
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 8
                    local.get 10
                    br_if 2 (;@6;)
                    local.get 7
                    i32.const -2
                    i32.and
                    i32.const 6
                    i32.eq
                    br_if 2 (;@6;)
                    local.get 1
                    i32.load
                    local.tee 7
                    i32.const 1077950464
                    i32.eq
                    br_if 2 (;@6;)
                    local.get 7
                    i32.const 1083079680
                    i32.eq
                    br_if 2 (;@6;)
                  end
                  i32.const 1612
                  i64.const 68719476749
                  i64.store offset=16 align=4
                  i32.const 1612
                  i32.load offset=12
                  local.set 8
                  block ;; label = @8
                    i32.const 0
                    i32.load offset=1608
                    br_if 0 (;@8;)
                    call $blep_parser_callback
                  end
                  call $blep_token_next
                  drop
                  br 1 (;@6;)
                end
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1608
                  br_if 0 (;@7;)
                  call $blep_parser_callback
                end
                call $blep_token_next
                drop
                i32.const 0
                local.set 8
                br 0 (;@6;)
              end
            end
            local.get 7
            return
          end
          i32.const 0
          i32.load offset=1608
          br_if 1 (;@2;)
        end
        call $blep_parser_callback
      end
      call $blep_token_next
      drop
      br 0 (;@1;)
    end
  )
  (func $consume_class (;13;) (type 1) (param i32) (result i32)
    (local i32 i32 i32)
    i32.const 1612
    i32.const 14
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=1608
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1
        i32.store offset=1608
        br 1 (;@1;)
      end
      i32.const 0
      i32.const 6
      call $blep_parser_open
      local.tee 2
      i32.const 0
      i32.ne
      i32.store offset=1608
      local.get 2
      br_if 0 (;@1;)
      call $blep_parser_callback
    end
    call $blep_token_next
    drop
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              i32.const 1612
              i32.load offset=20
              local.tee 2
              i32.const 1106809857
              i32.eq
              br_if 0 (;@5;)
              i32.const 1612
              i32.load offset=16
              i32.const 1
              i32.eq
              br_if 1 (;@4;)
            end
            local.get 0
            i32.eqz
            br_if 3 (;@1;)
            i32.const 0
            i32.load offset=1608
            br_if 3 (;@1;)
            i32.const 1612
            i32.const 0
            i64.load offset=1612 align=4
            i64.store offset=24 align=4
            i32.const 1612
            i32.const 40
            i32.add
            i32.const 1612
            i32.const 16
            i32.add
            local.tee 2
            i64.load align=4
            i64.store align=4
            i32.const 1612
            i32.const 32
            i32.add
            i32.const 1612
            i32.const 8
            i32.add
            local.tee 3
            i64.load align=4
            i64.store align=4
            i32.const 1612
            local.get 0
            i32.store offset=20
            local.get 3
            i32.const 0
            i32.store
            local.get 2
            i32.const 13
            i32.store
            i32.const 1612
            i32.const 1612
            i32.const 28
            i32.add
            i32.load
            i32.store offset=24
            br 1 (;@3;)
          end
          block ;; label = @4
            local.get 0
            i32.eqz
            br_if 0 (;@4;)
            i32.const 1612
            local.get 0
            i32.store offset=20
            i32.const 1612
            i32.const 13
            i32.store offset=16
            i32.const 0
            i32.load offset=1608
            i32.eqz
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          i32.const 1612
          i64.const 1
          i64.store offset=16 align=4
          i32.const 0
          i32.load offset=1608
          br_if 1 (;@2;)
        end
        call $blep_parser_callback
      end
      call $blep_token_next
      drop
      i32.const 1612
      i32.load offset=20
      local.set 2
    end
    block ;; label = @1
      block ;; label = @2
        local.get 2
        i32.const 1106809857
        i32.ne
        br_if 0 (;@2;)
        i32.const 1612
        i32.const 14
        i32.store offset=16
        block ;; label = @3
          i32.const 0
          i32.load offset=1608
          br_if 0 (;@3;)
          call $blep_parser_callback
        end
        call $blep_token_next
        drop
        i32.const 1
        local.set 2
        block ;; label = @3
          i32.const 0
          i32.load offset=1608
          local.tee 3
          br_if 0 (;@3;)
          i32.const 1
          call $blep_parser_open
          i32.const 0
          i32.ne
          local.set 2
        end
        i32.const 0
        local.get 2
        i32.store offset=1608
        i32.const 1612
        i32.load offset=4
        local.set 2
        i32.const 1
        call $consume_expr_internal
        local.tee 0
        i32.const -1
        i32.const 0
        local.get 2
        i32.const 1612
        i32.load offset=4
        i32.eq
        select
        local.get 0
        select
        local.tee 2
        br_if 1 (;@1;)
        block ;; label = @3
          i32.const 0
          i32.load offset=1608
          br_if 0 (;@3;)
          i32.const 1
          call $blep_parser_close
        end
        i32.const 0
        local.get 3
        i32.store offset=1608
      end
      i32.const 1
      call $consume_dict
      local.tee 2
      br_if 0 (;@1;)
      i32.const 0
      local.set 2
      block ;; label = @2
        i32.const 0
        i32.load offset=1608
        br_if 0 (;@2;)
        i32.const 6
        call $blep_parser_close
      end
      i32.const 0
      local.get 1
      i32.store offset=1608
    end
    local.get 2
  )
  (func $consume_export_wrap (;14;) (type 5) (result i32)
    (local i32 i32 i32 i32)
    i32.const 1612
    i32.const 14
    i32.store offset=16
    call $blep_token_peek
    drop
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              i32.const 1612
              i32.const 44
              i32.add
              i32.load
              i32.const 1077946368
              i32.eq
              br_if 0 (;@5;)
              i32.const 0
              i32.load offset=1608
              local.set 0
              i32.const 1612
              i32.const 40
              i32.add
              i32.load
              i32.const 5
              i32.ne
              br_if 1 (;@4;)
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    local.get 0
                    br_if 0 (;@8;)
                    i32.const 0
                    i32.const 1
                    i32.store offset=1608
                    call $blep_token_set_restore
                    drop
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=1608
                      br_if 0 (;@9;)
                      call $blep_parser_callback
                    end
                    call $blep_token_next
                    drop
                    i32.const -1
                    local.set 1
                    i32.const 1
                    call $consume_module_list_deep
                    br_if 7 (;@1;)
                    i32.const 0
                    i32.const 0
                    i32.load offset=1608
                    i32.const -1
                    i32.add
                    i32.store offset=1608
                    i32.const 1612
                    i32.load offset=20
                    local.set 1
                    call $blep_token_restore
                    drop
                    local.get 1
                    i32.const 1093834752
                    i32.eq
                    br_if 3 (;@5;)
                    i32.const 0
                    i32.load offset=1608
                    local.tee 0
                    i32.eqz
                    br_if 1 (;@7;)
                  end
                  i32.const 0
                  i32.const 1
                  i32.store offset=1608
                  br 1 (;@6;)
                end
                i32.const 0
                local.set 0
                i32.const 0
                i32.const 10
                call $blep_parser_open
                local.tee 1
                i32.const 0
                i32.ne
                i32.store offset=1608
                local.get 1
                br_if 0 (;@6;)
                call $blep_parser_callback
              end
              call $blep_token_next
              drop
              i32.const -1
              local.set 1
              i32.const 1
              call $consume_module_list_deep
              br_if 4 (;@1;)
              block ;; label = @6
                i32.const 1612
                i32.load offset=16
                i32.const 2
                i32.ne
                br_if 0 (;@6;)
                i32.const 1612
                i32.load offset=20
                br_if 0 (;@6;)
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1608
                  br_if 0 (;@7;)
                  call $blep_parser_callback
                end
                call $blep_token_next
                drop
              end
              i32.const 0
              i32.load offset=1608
              br_if 3 (;@2;)
              i32.const 10
              local.set 1
              br 2 (;@3;)
            end
            block ;; label = @5
              block ;; label = @6
                i32.const 0
                i32.load offset=1608
                local.tee 0
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                i32.const 1
                i32.store offset=1608
                br 1 (;@5;)
              end
              i32.const 0
              i32.const 10
              call $blep_parser_open
              local.tee 1
              i32.const 0
              i32.ne
              i32.store offset=1608
              local.get 1
              br_if 0 (;@5;)
              call $blep_parser_callback
            end
            call $blep_token_next
            drop
            i32.const -1
            local.set 1
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    i32.const 1612
                    i32.load offset=16
                    i32.const -3
                    i32.add
                    br_table 1 (;@7;) 7 (;@1;) 0 (;@8;) 7 (;@1;)
                  end
                  i32.const 2
                  call $consume_module_list_deep
                  i32.eqz
                  br_if 1 (;@6;)
                  i32.const -1
                  return
                end
                block ;; label = @7
                  i32.const 1612
                  i32.load offset=20
                  i32.const 1077946368
                  i32.eq
                  br_if 0 (;@7;)
                  i32.const -1
                  return
                end
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1608
                  br_if 0 (;@7;)
                  call $blep_parser_callback
                end
                call $blep_token_next
                drop
                i32.const 1612
                i32.load offset=20
                local.tee 2
                i32.const 1085506560
                i32.ne
                br_if 1 (;@5;)
                i32.const 1612
                i32.const 14
                i32.store offset=16
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1608
                  br_if 0 (;@7;)
                  call $blep_parser_callback
                end
                call $blep_token_next
                drop
                i32.const -1
                local.set 1
                block ;; label = @7
                  i32.const 1612
                  i32.load offset=16
                  i32.const -1
                  i32.add
                  br_table 0 (;@7;) 6 (;@1;) 6 (;@1;) 6 (;@1;) 6 (;@1;) 6 (;@1;) 6 (;@1;) 6 (;@1;) 6 (;@1;) 6 (;@1;) 6 (;@1;) 6 (;@1;) 0 (;@7;) 6 (;@1;)
                end
                i32.const 1612
                i64.const 137438953473
                i64.store offset=16 align=4
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1608
                  br_if 0 (;@7;)
                  call $blep_parser_callback
                end
                call $blep_token_next
                drop
              end
              i32.const 1612
              i32.load offset=20
              local.set 2
            end
            i32.const -3
            local.set 1
            local.get 2
            i32.const 1093834752
            i32.ne
            br_if 3 (;@1;)
            i32.const 1612
            i32.const 14
            i32.store offset=16
            block ;; label = @5
              i32.const 0
              i32.load offset=1608
              br_if 0 (;@5;)
              call $blep_parser_callback
            end
            call $blep_token_next
            drop
            i32.const -1
            local.set 1
            i32.const 1612
            i32.load offset=16
            i32.const 10
            i32.ne
            br_if 3 (;@1;)
            block ;; label = @5
              i32.const 1612
              i32.load offset=4
              local.tee 2
              i32.load8_u
              i32.const 96
              i32.ne
              br_if 0 (;@5;)
              i32.const 1612
              i32.load offset=8
              local.tee 3
              i32.const 2
              i32.lt_s
              br_if 0 (;@5;)
              i32.const -1
              local.set 1
              local.get 2
              local.get 3
              i32.add
              i32.const -1
              i32.add
              i32.load8_u
              i32.const 96
              i32.ne
              br_if 4 (;@1;)
            end
            i32.const 1612
            i32.const 32
            i32.store offset=20
            block ;; label = @5
              i32.const 0
              i32.load offset=1608
              br_if 0 (;@5;)
              call $blep_parser_callback
            end
            call $blep_token_next
            drop
            block ;; label = @5
              i32.const 1612
              i32.load offset=16
              i32.const 2
              i32.ne
              br_if 0 (;@5;)
              i32.const 1612
              i32.load offset=20
              br_if 0 (;@5;)
              block ;; label = @6
                i32.const 0
                i32.load offset=1608
                br_if 0 (;@6;)
                call $blep_parser_callback
              end
              call $blep_token_next
              drop
            end
            i32.const 0
            i32.load offset=1608
            br_if 2 (;@2;)
            i32.const 10
            local.set 1
            br 1 (;@3;)
          end
          block ;; label = @4
            block ;; label = @5
              local.get 0
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              i32.const 1
              i32.store offset=1608
              br 1 (;@4;)
            end
            i32.const 0
            i32.const 9
            call $blep_parser_open
            local.tee 1
            i32.const 0
            i32.ne
            i32.store offset=1608
            local.get 1
            br_if 0 (;@4;)
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
          i32.const 50
          local.set 3
          i32.const 1612
          i32.load offset=20
          local.tee 2
          local.set 1
          block ;; label = @4
            local.get 2
            i32.const 1105563657
            i32.ne
            br_if 0 (;@4;)
            i32.const 1612
            i32.const 14
            i32.store offset=16
            block ;; label = @5
              i32.const 0
              i32.load offset=1608
              br_if 0 (;@5;)
              call $blep_parser_callback
            end
            call $blep_token_next
            drop
            i32.const 1612
            i32.load offset=20
            local.set 1
            i32.const 146
            local.set 3
          end
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 1
                i32.const 1110808577
                i32.eq
                br_if 0 (;@6;)
                block ;; label = @7
                  local.get 1
                  i32.const 1098089472
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 1
                  i32.const 1097632769
                  i32.ne
                  br_if 2 (;@5;)
                  local.get 3
                  call $consume_class
                  local.set 1
                  br 3 (;@4;)
                end
                call $blep_token_peek
                drop
                i32.const 1612
                i32.const 44
                i32.add
                i32.load
                i32.const 1110808577
                i32.ne
                br_if 1 (;@5;)
              end
              local.get 3
              call $consume_function
              local.set 1
              br 1 (;@4;)
            end
            block ;; label = @5
              local.get 2
              i32.const 1105563657
              i32.ne
              br_if 0 (;@5;)
              call $consume_expr_statement
              local.set 1
              br 1 (;@4;)
            end
            i32.const -1
            local.set 1
            i32.const 1612
            i32.load8_u offset=20
            i32.const 32
            i32.and
            i32.eqz
            br_if 3 (;@1;)
            i32.const 32
            call $consume_decl_stack
            local.set 1
          end
          local.get 1
          br_if 2 (;@1;)
          block ;; label = @4
            i32.const 1612
            i32.load offset=16
            i32.const 2
            i32.ne
            br_if 0 (;@4;)
            i32.const 1612
            i32.load offset=20
            br_if 0 (;@4;)
            block ;; label = @5
              i32.const 0
              i32.load offset=1608
              br_if 0 (;@5;)
              call $blep_parser_callback
            end
            call $blep_token_next
            drop
          end
          i32.const 0
          i32.load offset=1608
          br_if 1 (;@2;)
          i32.const 9
          local.set 1
        end
        local.get 1
        call $blep_parser_close
      end
      i32.const 0
      local.set 1
      i32.const 0
      local.get 0
      i32.store offset=1608
    end
    local.get 1
  )
  (func $consume_control (;15;) (type 5) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    i32.const 1612
    i32.load offset=20
    local.set 0
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=1608
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1612
        i32.const 14
        i32.store offset=16
        i32.const 0
        i32.const 1
        i32.store offset=1608
        br 1 (;@1;)
      end
      i32.const 3
      call $blep_parser_open
      local.set 2
      i32.const 1612
      i32.const 14
      i32.store offset=16
      i32.const 0
      local.get 2
      i32.const 0
      i32.ne
      i32.store offset=1608
      local.get 2
      br_if 0 (;@1;)
      call $blep_parser_callback
    end
    local.get 0
    i32.const 128
    i32.and
    local.set 2
    call $blep_token_next
    drop
    block ;; label = @1
      local.get 0
      i32.const 1089444033
      i32.ne
      br_if 0 (;@1;)
      i32.const 1612
      i32.load offset=20
      i32.const 1098351621
      i32.ne
      br_if 0 (;@1;)
      i32.const 1612
      i32.const 14
      i32.store offset=16
      block ;; label = @2
        i32.const 0
        i32.load offset=1608
        br_if 0 (;@2;)
        call $blep_parser_callback
      end
      call $blep_token_next
      drop
      i32.const 1098351621
      local.set 0
    end
    block ;; label = @1
      block ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1612
        i32.load offset=16
        i32.const 7
        i32.ne
        br_if 0 (;@2;)
        block ;; label = @3
          i32.const 0
          i32.load offset=1608
          br_if 0 (;@3;)
          call $blep_parser_callback
        end
        call $blep_token_next
        drop
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 0
                i32.const 1089444033
                i32.eq
                br_if 0 (;@6;)
                local.get 0
                i32.const 1098351621
                i32.eq
                br_if 0 (;@6;)
                block ;; label = @7
                  local.get 0
                  i32.const 1096912065
                  i32.ne
                  br_if 0 (;@7;)
                  block ;; label = @8
                    i32.const 1612
                    i32.load offset=20
                    local.tee 3
                    i32.const 1087256576
                    i32.ne
                    br_if 0 (;@8;)
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=1608
                      br_if 0 (;@9;)
                      call $blep_parser_callback
                    end
                    call $blep_token_next
                    drop
                  end
                  i32.const -1
                  local.set 2
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        i32.const 1612
                        i32.load offset=16
                        local.tee 4
                        i32.const -1
                        i32.add
                        br_table 0 (;@10;) 2 (;@8;) 2 (;@8;) 2 (;@8;) 1 (;@9;) 1 (;@9;) 2 (;@8;) 2 (;@8;) 2 (;@8;) 2 (;@8;) 2 (;@8;) 2 (;@8;) 0 (;@10;) 2 (;@8;)
                      end
                      i32.const 1612
                      i64.const 8589934605
                      i64.store offset=16 align=4
                      call $blep_token_peek
                      drop
                      block ;; label = @10
                        block ;; label = @11
                          i32.const 1612
                          i32.const 44
                          i32.add
                          i32.load
                          local.tee 2
                          i32.const 1077965824
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 2
                          i32.const 1085187075
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 2
                          i32.const 1084668928
                          i32.ne
                          br_if 1 (;@10;)
                        end
                        i32.const 1612
                        i32.const 1612
                        i32.load offset=20
                        i32.const 16
                        i32.or
                        i32.store offset=20
                      end
                      block ;; label = @10
                        i32.const 0
                        i32.load offset=1608
                        br_if 0 (;@10;)
                        call $blep_parser_callback
                      end
                      call $blep_token_next
                      drop
                      br 4 (;@5;)
                    end
                    i32.const 2
                    call $consume_destructuring
                    local.tee 2
                    i32.eqz
                    br_if 3 (;@5;)
                    br 7 (;@1;)
                  end
                  local.get 3
                  i32.const 1087256576
                  i32.ne
                  br_if 3 (;@4;)
                  br 6 (;@1;)
                end
                i32.const 0
                i32.load offset=1608
                local.set 4
                i32.const 1612
                i32.load offset=16
                i32.const 9
                i32.eq
                br_if 3 (;@3;)
                i32.const 1
                local.set 2
                block ;; label = @7
                  local.get 4
                  br_if 0 (;@7;)
                  i32.const 1
                  call $blep_parser_open
                  i32.const 0
                  i32.ne
                  local.set 2
                end
                i32.const 0
                local.get 2
                i32.store offset=1608
                i32.const 0
                call $consume_expr_internal
                local.tee 2
                br_if 5 (;@1;)
                block ;; label = @7
                  loop ;; label = @8
                    i32.const 0
                    i32.load offset=1608
                    local.set 2
                    i32.const 1612
                    i32.load offset=20
                    i32.const 1077948416
                    i32.ne
                    br_if 1 (;@7;)
                    block ;; label = @9
                      local.get 2
                      br_if 0 (;@9;)
                      call $blep_parser_callback
                    end
                    call $blep_token_next
                    drop
                    i32.const 0
                    call $consume_expr_internal
                    local.tee 2
                    i32.eqz
                    br_if 0 (;@8;)
                    br 7 (;@1;)
                  end
                end
                block ;; label = @7
                  local.get 2
                  br_if 0 (;@7;)
                  i32.const 1
                  call $blep_parser_close
                end
                i32.const 0
                local.get 4
                i32.store offset=1608
                br 1 (;@5;)
              end
              block ;; label = @6
                i32.const 1612
                i32.load offset=16
                i32.const 2
                i32.eq
                br_if 0 (;@6;)
                block ;; label = @7
                  i32.const 1612
                  i32.load offset=20
                  local.tee 2
                  i32.const 32
                  i32.and
                  br_if 0 (;@7;)
                  i32.const 0
                  call $consume_expr_internal
                  local.tee 2
                  br_if 6 (;@1;)
                  loop ;; label = @8
                    i32.const 1612
                    i32.load offset=20
                    i32.const 1077948416
                    i32.ne
                    br_if 2 (;@6;)
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=1608
                      br_if 0 (;@9;)
                      call $blep_parser_callback
                    end
                    call $blep_token_next
                    drop
                    i32.const 0
                    call $consume_expr_internal
                    local.tee 2
                    i32.eqz
                    br_if 0 (;@8;)
                    br 7 (;@1;)
                  end
                end
                block ;; label = @7
                  block ;; label = @8
                    i32.const 0
                    i32.load offset=1608
                    local.tee 5
                    i32.eqz
                    br_if 0 (;@8;)
                    i32.const 1612
                    i32.const 14
                    i32.store offset=16
                    i32.const 0
                    i32.const 1
                    i32.store offset=1608
                    local.get 2
                    i32.const 1088542753
                    i32.eq
                    i32.const 2
                    i32.shl
                    local.set 4
                    br 1 (;@7;)
                  end
                  i32.const 2
                  call $blep_parser_open
                  local.set 2
                  i32.const 1612
                  i32.const 14
                  i32.store offset=16
                  i32.const 0
                  local.get 2
                  i32.const 0
                  i32.ne
                  i32.store offset=1608
                  i32.const 1612
                  i32.load offset=20
                  i32.const 1088542753
                  i32.eq
                  i32.const 2
                  i32.shl
                  local.set 4
                  local.get 2
                  br_if 0 (;@7;)
                  call $blep_parser_callback
                end
                call $blep_token_next
                drop
                i32.const 1612
                i32.load offset=4
                local.set 3
                local.get 4
                call $consume_optional_definition
                local.tee 2
                br_if 5 (;@1;)
                block ;; label = @7
                  local.get 3
                  i32.const 1612
                  i32.load offset=4
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const -1
                  return
                end
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      i32.const 1612
                      i32.load offset=20
                      local.tee 2
                      i32.const 1085187075
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 2
                      i32.const 1084668928
                      i32.ne
                      br_if 1 (;@8;)
                    end
                    i32.const 1612
                    i32.const 3
                    i32.store offset=16
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=1608
                      br_if 0 (;@9;)
                      call $blep_parser_callback
                    end
                    call $blep_token_next
                    drop
                    i32.const 1
                    local.set 2
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=1608
                      local.tee 4
                      br_if 0 (;@9;)
                      i32.const 1
                      call $blep_parser_open
                      i32.const 0
                      i32.ne
                      local.set 2
                    end
                    i32.const 0
                    local.get 2
                    i32.store offset=1608
                    i32.const 1612
                    i32.load offset=4
                    local.set 2
                    i32.const 0
                    call $consume_expr_internal
                    local.tee 3
                    i32.const -1
                    i32.const 0
                    local.get 2
                    i32.const 1612
                    i32.load offset=4
                    i32.eq
                    select
                    local.get 3
                    select
                    local.tee 2
                    br_if 7 (;@1;)
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=1608
                      br_if 0 (;@9;)
                      i32.const 1
                      call $blep_parser_close
                    end
                    i32.const 0
                    local.set 2
                    i32.const 0
                    local.get 4
                    i32.store offset=1608
                    br 1 (;@7;)
                  end
                  i32.const 0
                  call $consume_optional_assign_suffix
                  local.tee 2
                  br_if 6 (;@1;)
                  block ;; label = @8
                    i32.const 1612
                    i32.load offset=20
                    i32.const 1077948416
                    i32.ne
                    br_if 0 (;@8;)
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=1608
                      br_if 0 (;@9;)
                      call $blep_parser_callback
                    end
                    call $blep_token_next
                    drop
                    local.get 4
                    i32.const 0
                    call $consume_definition_list
                    local.tee 2
                    br_if 7 (;@1;)
                  end
                  local.get 0
                  i32.const 1089444033
                  i32.eq
                  local.set 2
                  i32.const 0
                  i32.load offset=1608
                  local.set 4
                end
                block ;; label = @7
                  local.get 4
                  br_if 0 (;@7;)
                  i32.const 2
                  call $blep_parser_close
                end
                i32.const 0
                local.get 5
                i32.store offset=1608
                local.get 2
                i32.eqz
                br_if 1 (;@5;)
              end
              i32.const 1612
              i32.load offset=16
              local.set 4
              local.get 0
              i32.const 1098351621
              i32.eq
              br_if 1 (;@4;)
              local.get 4
              i32.const 2
              i32.ne
              br_if 1 (;@4;)
              block ;; label = @6
                i32.const 0
                i32.load offset=1608
                br_if 0 (;@6;)
                call $blep_parser_callback
              end
              call $blep_token_next
              drop
              i32.const 0
              i32.load offset=1608
              local.set 4
              block ;; label = @6
                i32.const 1612
                i32.load offset=16
                i32.const 2
                i32.eq
                br_if 0 (;@6;)
                i32.const 1
                local.set 2
                block ;; label = @7
                  local.get 4
                  br_if 0 (;@7;)
                  i32.const 1
                  call $blep_parser_open
                  i32.const 0
                  i32.ne
                  local.set 2
                end
                i32.const 0
                local.get 2
                i32.store offset=1608
                i32.const 0
                call $consume_expr_internal
                local.tee 2
                br_if 5 (;@1;)
                block ;; label = @7
                  loop ;; label = @8
                    i32.const 0
                    i32.load offset=1608
                    local.set 2
                    i32.const 1612
                    i32.load offset=20
                    i32.const 1077948416
                    i32.ne
                    br_if 1 (;@7;)
                    block ;; label = @9
                      local.get 2
                      br_if 0 (;@9;)
                      call $blep_parser_callback
                    end
                    call $blep_token_next
                    drop
                    i32.const 0
                    call $consume_expr_internal
                    local.tee 2
                    i32.eqz
                    br_if 0 (;@8;)
                    br 7 (;@1;)
                  end
                end
                block ;; label = @7
                  local.get 2
                  br_if 0 (;@7;)
                  i32.const 1
                  call $blep_parser_close
                end
                i32.const 0
                local.get 4
                i32.store offset=1608
                i32.const -1
                local.set 2
                i32.const 1612
                i32.load offset=16
                i32.const 2
                i32.ne
                br_if 5 (;@1;)
              end
              block ;; label = @6
                local.get 4
                br_if 0 (;@6;)
                call $blep_parser_callback
              end
              call $blep_token_next
              drop
              i32.const 0
              i32.load offset=1608
              local.set 4
              i32.const 1612
              i32.load offset=16
              i32.const 9
              i32.eq
              br_if 2 (;@3;)
              i32.const 1
              local.set 2
              block ;; label = @6
                local.get 4
                br_if 0 (;@6;)
                i32.const 1
                call $blep_parser_open
                i32.const 0
                i32.ne
                local.set 2
              end
              i32.const 0
              local.get 2
              i32.store offset=1608
              i32.const 0
              call $consume_expr_zero_many
              local.tee 2
              br_if 4 (;@1;)
              block ;; label = @6
                i32.const 0
                i32.load offset=1608
                br_if 0 (;@6;)
                i32.const 1
                call $blep_parser_close
              end
              i32.const 0
              local.get 4
              i32.store offset=1608
            end
            i32.const 1612
            i32.load offset=16
            local.set 4
          end
          i32.const -1
          local.set 2
          local.get 4
          i32.const 9
          i32.ne
          br_if 2 (;@1;)
          i32.const 0
          i32.load offset=1608
          local.set 4
        end
        block ;; label = @3
          local.get 4
          br_if 0 (;@3;)
          call $blep_parser_callback
        end
        call $blep_token_next
        drop
      end
      i32.const 0
      call $consume_statement
      local.set 2
      block ;; label = @2
        block ;; label = @3
          local.get 0
          i32.const 1085247553
          i32.ne
          br_if 0 (;@3;)
          local.get 2
          br_if 2 (;@1;)
          i32.const -1
          local.set 2
          block ;; label = @4
            i32.const 0
            i32.load offset=1612
            i32.const -1
            i32.add
            i32.load8_u
            i32.const 59
            i32.eq
            br_if 0 (;@4;)
            i32.const 1612
            i32.load offset=16
            i32.const 2
            i32.ne
            br_if 0 (;@4;)
            block ;; label = @5
              i32.const 0
              i32.load offset=1608
              br_if 0 (;@5;)
              call $blep_parser_callback
            end
            call $blep_token_next
            drop
          end
          i32.const 1612
          i32.load offset=20
          i32.const 1097391297
          i32.ne
          br_if 2 (;@1;)
          i32.const 1612
          i32.const 14
          i32.store offset=16
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
          i32.const 1612
          i32.load offset=16
          i32.const 7
          i32.ne
          br_if 2 (;@1;)
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
          i32.const 0
          call $consume_expr_internal
          local.tee 2
          br_if 2 (;@1;)
          block ;; label = @4
            loop ;; label = @5
              i32.const 1612
              i32.load offset=20
              i32.const 1077948416
              i32.ne
              br_if 1 (;@4;)
              block ;; label = @6
                i32.const 0
                i32.load offset=1608
                br_if 0 (;@6;)
                call $blep_parser_callback
              end
              call $blep_token_next
              drop
              i32.const 0
              call $consume_expr_internal
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              br 4 (;@1;)
            end
          end
          i32.const -1
          local.set 2
          i32.const 1612
          i32.load offset=16
          i32.const 9
          i32.ne
          br_if 2 (;@1;)
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
          i32.const 1612
          i32.load offset=16
          i32.const 2
          i32.ne
          br_if 1 (;@2;)
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
          br 1 (;@2;)
        end
        local.get 2
        br_if 1 (;@1;)
      end
      i32.const 0
      local.set 2
      block ;; label = @2
        i32.const 0
        i32.load offset=1608
        br_if 0 (;@2;)
        i32.const 3
        call $blep_parser_close
      end
      i32.const 0
      local.get 1
      i32.store offset=1608
    end
    local.get 2
  )
  (func $consume_decl_stack (;16;) (type 1) (param i32) (result i32)
    (local i32 i32 i32 i32)
    i32.const 1
    local.set 1
    block ;; label = @1
      i32.const 0
      i32.load offset=1608
      local.tee 2
      br_if 0 (;@1;)
      i32.const 2
      call $blep_parser_open
      i32.const 0
      i32.ne
      local.set 1
    end
    i32.const 0
    local.get 1
    i32.store offset=1608
    i32.const 1612
    i32.const 14
    i32.store offset=16
    i32.const 1612
    i32.load offset=20
    i32.const 1088542753
    i32.eq
    i32.const 2
    i32.shl
    local.get 0
    i32.or
    local.set 0
    block ;; label = @1
      local.get 1
      br_if 0 (;@1;)
      call $blep_parser_callback
    end
    call $blep_token_next
    drop
    block ;; label = @1
      local.get 0
      call $consume_optional_definition
      local.tee 1
      br_if 0 (;@1;)
      loop ;; label = @2
        block ;; label = @3
          i32.const 1612
          i32.load offset=20
          local.tee 1
          i32.const 1077965824
          i32.ne
          br_if 0 (;@3;)
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
          i32.const 1
          local.set 1
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            local.tee 3
            br_if 0 (;@4;)
            i32.const 1
            call $blep_parser_open
            i32.const 0
            i32.ne
            local.set 1
          end
          i32.const 0
          local.get 1
          i32.store offset=1608
          i32.const 1612
          i32.load offset=4
          local.set 1
          i32.const 1
          call $consume_expr_internal
          local.tee 4
          i32.const -1
          i32.const 0
          local.get 1
          i32.const 1612
          i32.load offset=4
          i32.eq
          select
          local.get 4
          select
          local.tee 1
          br_if 2 (;@1;)
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            i32.const 1
            call $blep_parser_close
          end
          i32.const 0
          local.get 3
          i32.store offset=1608
          i32.const 1612
          i32.load offset=20
          local.set 1
        end
        block ;; label = @3
          local.get 1
          i32.const 1077948416
          i32.ne
          br_if 0 (;@3;)
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
          local.get 0
          call $consume_optional_definition
          local.tee 1
          i32.eqz
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
      end
      i32.const 0
      i32.load offset=1608
      local.set 0
      block ;; label = @2
        i32.const 1612
        i32.load offset=16
        i32.const 2
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        br_if 0 (;@2;)
        block ;; label = @3
          local.get 0
          br_if 0 (;@3;)
          call $blep_parser_callback
        end
        call $blep_token_next
        drop
        i32.const 0
        i32.load offset=1608
        local.set 0
      end
      block ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        i32.const 2
        call $blep_parser_close
      end
      i32.const 0
      local.set 1
      i32.const 0
      local.get 2
      i32.store offset=1608
    end
    local.get 1
  )
  (func $consume_function (;17;) (type 1) (param i32) (result i32)
    (local i32 i32 i32 i32)
    i32.const 1612
    i32.const 14
    i32.store offset=16
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          i32.const 0
          i32.load offset=1608
          local.tee 1
          br_if 0 (;@3;)
          i32.const 0
          i32.const 5
          call $blep_parser_open
          local.tee 2
          i32.const 0
          i32.ne
          i32.store offset=1608
          i32.const 1612
          i32.load offset=20
          local.tee 3
          i32.const 1098089472
          i32.ne
          br_if 2 (;@1;)
          local.get 2
          br_if 1 (;@2;)
          call $blep_parser_callback
          br 1 (;@2;)
        end
        i32.const 0
        i32.const 1
        i32.store offset=1608
        i32.const 1612
        i32.load offset=20
        local.tee 3
        i32.const 1098089472
        i32.ne
        br_if 1 (;@1;)
      end
      call $blep_token_next
      drop
      i32.const 1612
      i32.const 14
      i32.store offset=16
      i32.const 1612
      i32.load offset=20
      local.set 3
    end
    i32.const -1
    local.set 2
    block ;; label = @1
      local.get 3
      i32.const 1110808577
      i32.ne
      br_if 0 (;@1;)
      block ;; label = @2
        i32.const 0
        i32.load offset=1608
        br_if 0 (;@2;)
        call $blep_parser_callback
      end
      call $blep_token_next
      drop
      block ;; label = @2
        i32.const 1612
        i32.load offset=20
        local.tee 3
        i32.const 1077946368
        i32.ne
        br_if 0 (;@2;)
        block ;; label = @3
          i32.const 0
          i32.load offset=1608
          br_if 0 (;@3;)
          call $blep_parser_callback
        end
        call $blep_token_next
        drop
        i32.const 1612
        i32.load offset=20
        local.set 3
      end
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 3
                i32.const 1106809857
                i32.eq
                br_if 0 (;@6;)
                i32.const 1612
                i32.load offset=16
                i32.const 1
                i32.eq
                br_if 1 (;@5;)
              end
              i32.const 0
              i32.load offset=1608
              local.set 3
              local.get 0
              i32.eqz
              br_if 3 (;@2;)
              local.get 3
              br_if 3 (;@2;)
              i32.const 1612
              i32.const 0
              i64.load offset=1612 align=4
              i64.store offset=24 align=4
              i32.const 1612
              i32.const 40
              i32.add
              i32.const 1612
              i32.const 16
              i32.add
              local.tee 3
              i64.load align=4
              i64.store align=4
              i32.const 1612
              i32.const 32
              i32.add
              i32.const 1612
              i32.const 8
              i32.add
              local.tee 4
              i64.load align=4
              i64.store align=4
              i32.const 1612
              local.get 0
              i32.store offset=20
              local.get 4
              i32.const 0
              i32.store
              local.get 3
              i32.const 13
              i32.store
              i32.const 1612
              i32.const 1612
              i32.const 28
              i32.add
              i32.load
              i32.store offset=24
              br 1 (;@4;)
            end
            block ;; label = @5
              local.get 0
              i32.eqz
              br_if 0 (;@5;)
              i32.const 1612
              local.get 0
              i32.store offset=20
              i32.const 1612
              i32.const 13
              i32.store offset=16
              i32.const 0
              i32.load offset=1608
              i32.eqz
              br_if 1 (;@4;)
              br 2 (;@3;)
            end
            i32.const 1612
            i64.const 1
            i64.store offset=16 align=4
            i32.const 0
            i32.load offset=1608
            br_if 1 (;@3;)
          end
          call $blep_parser_callback
        end
        call $blep_token_next
        drop
        i32.const 0
        i32.load offset=1608
        local.set 3
      end
      block ;; label = @2
        block ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          i32.const 11
          call $blep_parser_open
          local.tee 0
          i32.const 0
          i32.ne
          i32.store offset=1608
          i32.const 1612
          i32.load offset=16
          i32.const 7
          i32.ne
          br_if 2 (;@1;)
          local.get 0
          br_if 1 (;@2;)
          call $blep_parser_callback
          br 1 (;@2;)
        end
        i32.const 0
        i32.const 1
        i32.store offset=1608
        i32.const 1612
        i32.load offset=16
        i32.const 7
        i32.ne
        br_if 1 (;@1;)
      end
      call $blep_token_next
      drop
      block ;; label = @2
        i32.const 1612
        i32.load offset=16
        i32.const 9
        i32.eq
        br_if 0 (;@2;)
        i32.const 4
        i32.const 0
        call $consume_definition_list
        local.tee 2
        br_if 1 (;@1;)
        i32.const -1
        local.set 2
        i32.const 1612
        i32.load offset=16
        i32.const 9
        i32.ne
        br_if 1 (;@1;)
      end
      block ;; label = @2
        i32.const 0
        i32.load offset=1608
        br_if 0 (;@2;)
        call $blep_parser_callback
      end
      call $blep_token_next
      drop
      i32.const 0
      call $consume_statement
      local.tee 2
      br_if 0 (;@1;)
      block ;; label = @2
        i32.const 0
        i32.load offset=1608
        br_if 0 (;@2;)
        i32.const 11
        call $blep_parser_close
      end
      i32.const 0
      local.get 3
      i32.store offset=1608
      block ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        i32.const 5
        call $blep_parser_close
      end
      i32.const 0
      local.set 2
      i32.const 0
      local.get 1
      i32.store offset=1608
    end
    local.get 2
  )
  (func $consume_expr_zero_many (;18;) (type 1) (param i32) (result i32)
    (local i32)
    block ;; label = @1
      local.get 0
      call $consume_expr_internal
      local.tee 1
      br_if 0 (;@1;)
      loop ;; label = @2
        block ;; label = @3
          i32.const 1612
          i32.load offset=20
          i32.const 1077948416
          i32.eq
          br_if 0 (;@3;)
          i32.const 0
          return
        end
        block ;; label = @3
          i32.const 0
          i32.load offset=1608
          br_if 0 (;@3;)
          call $blep_parser_callback
        end
        call $blep_token_next
        drop
        local.get 0
        call $consume_expr_internal
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
      end
    end
    local.get 1
  )
  (func $consume_definition_list (;19;) (type 4) (param i32 i32) (result i32)
    (local i32 i32 i32)
    block ;; label = @1
      local.get 0
      call $consume_optional_definition
      local.tee 2
      br_if 0 (;@1;)
      loop ;; label = @2
        block ;; label = @3
          i32.const 1612
          i32.load offset=20
          local.tee 2
          i32.const 1077965824
          i32.ne
          br_if 0 (;@3;)
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
          i32.const 1
          local.set 2
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            local.tee 3
            br_if 0 (;@4;)
            i32.const 1
            call $blep_parser_open
            i32.const 0
            i32.ne
            local.set 2
          end
          i32.const 0
          local.get 2
          i32.store offset=1608
          i32.const 1612
          i32.load offset=4
          local.set 2
          local.get 1
          call $consume_expr_internal
          local.tee 4
          i32.const -1
          i32.const 0
          local.get 2
          i32.const 1612
          i32.load offset=4
          i32.eq
          select
          local.get 4
          select
          local.tee 2
          br_if 2 (;@1;)
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            i32.const 1
            call $blep_parser_close
          end
          i32.const 0
          local.get 3
          i32.store offset=1608
          i32.const 1612
          i32.load offset=20
          local.set 2
        end
        block ;; label = @3
          local.get 2
          i32.const 1077948416
          i32.eq
          br_if 0 (;@3;)
          i32.const 0
          return
        end
        block ;; label = @3
          i32.const 0
          i32.load offset=1608
          br_if 0 (;@3;)
          call $blep_parser_callback
        end
        call $blep_token_next
        drop
        local.get 0
        call $consume_optional_definition
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
      end
    end
    local.get 2
  )
  (func $consume_dict (;20;) (type 1) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block ;; label = @1
      i32.const 0
      i32.load offset=1608
      br_if 0 (;@1;)
      call $blep_parser_callback
    end
    call $blep_token_next
    drop
    i32.const 1612
    i32.const 44
    i32.add
    local.set 1
    block ;; label = @1
      loop ;; label = @2
        block ;; label = @3
          block ;; label = @4
            i32.const 1612
            i32.load offset=20
            local.tee 2
            i32.const 1102367745
            i32.eq
            br_if 0 (;@4;)
            i32.const 0
            local.set 3
            local.get 2
            i32.const 1087256576
            i32.ne
            br_if 1 (;@3;)
            block ;; label = @5
              i32.const 0
              i32.load offset=1608
              br_if 0 (;@5;)
              call $blep_parser_callback
            end
            call $blep_token_next
            drop
            i32.const 1612
            i32.load offset=4
            local.set 3
            i32.const 0
            call $consume_expr_internal
            local.set 2
            i32.const 1612
            i32.load offset=4
            local.set 4
            block ;; label = @5
              local.get 2
              br_if 0 (;@5;)
              local.get 3
              local.get 4
              i32.ne
              br_if 3 (;@2;)
            end
            local.get 2
            i32.const -1
            i32.const 0
            local.get 3
            local.get 4
            i32.eq
            select
            local.get 2
            select
            local.set 2
            br 3 (;@1;)
          end
          block ;; label = @4
            call $blep_token_peek
            local.tee 2
            i32.const 7
            i32.eq
            br_if 0 (;@4;)
            i32.const 1612
            i32.const 14
            i32.store offset=16
            block ;; label = @5
              i32.const 0
              i32.load offset=1608
              br_if 0 (;@5;)
              call $blep_parser_callback
            end
            call $blep_token_next
            drop
          end
          local.get 2
          i32.const 7
          i32.ne
          local.set 3
          i32.const 1612
          i32.load offset=20
          local.set 2
        end
        block ;; label = @3
          local.get 2
          i32.const 1098089472
          i32.ne
          br_if 0 (;@3;)
          block ;; label = @4
            block ;; label = @5
              call $blep_token_peek
              i32.const -1
              i32.add
              br_table 1 (;@4;) 2 (;@3;) 0 (;@5;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 2 (;@3;) 1 (;@4;) 2 (;@3;)
            end
            local.get 1
            i32.load
            i32.const 1077946368
            i32.ne
            br_if 1 (;@3;)
          end
          i32.const 1612
          i32.const 14
          i32.store offset=16
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
        end
        block ;; label = @3
          i32.const 1612
          i32.load offset=20
          local.tee 2
          i32.const 1077946368
          i32.ne
          br_if 0 (;@3;)
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
          i32.const 1612
          i32.load offset=20
          local.set 2
        end
        block ;; label = @3
          block ;; label = @4
            local.get 2
            i32.const 1088801792
            i32.eq
            br_if 0 (;@4;)
            local.get 2
            i32.const 1088789504
            i32.ne
            br_if 1 (;@3;)
          end
          call $blep_token_peek
          i32.const 7
          i32.eq
          br_if 0 (;@3;)
          i32.const 1612
          i32.const 14
          i32.store offset=16
          block ;; label = @4
            i32.const 0
            i32.load offset=1608
            br_if 0 (;@4;)
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
        end
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      i32.const 1612
                      i32.load offset=16
                      local.tee 2
                      i32.const -1
                      i32.add
                      br_table 0 (;@9;) 6 (;@3;) 6 (;@3;) 6 (;@3;) 6 (;@3;) 3 (;@6;) 6 (;@3;) 6 (;@3;) 6 (;@3;) 2 (;@7;) 6 (;@3;) 1 (;@8;) 0 (;@9;) 6 (;@3;)
                    end
                    i32.const 1612
                    i64.const 34359738369
                    i64.store offset=16 align=4
                    block ;; label = @9
                      local.get 0
                      br_if 0 (;@9;)
                      block ;; label = @10
                        block ;; label = @11
                          call $blep_token_peek
                          i32.const -3
                          i32.add
                          br_table 0 (;@11;) 2 (;@9;) 1 (;@10;) 1 (;@10;) 2 (;@9;) 1 (;@10;)
                        end
                        local.get 1
                        i32.load
                        i32.const 1077965824
                        i32.eq
                        br_if 1 (;@9;)
                      end
                      i32.const 1612
                      i32.const 13
                      i32.store offset=16
                    end
                    i32.const 0
                    i32.load offset=1608
                    i32.eqz
                    br_if 3 (;@5;)
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load offset=1608
                  i32.eqz
                  br_if 2 (;@5;)
                  br 3 (;@4;)
                end
                block ;; label = @7
                  i32.const 1612
                  i32.load offset=4
                  local.tee 4
                  i32.load8_u
                  i32.const 96
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 1612
                  i32.load offset=8
                  local.tee 5
                  i32.const 2
                  i32.lt_s
                  br_if 0 (;@7;)
                  i32.const -1
                  local.set 2
                  local.get 4
                  local.get 5
                  i32.add
                  i32.const -1
                  i32.add
                  i32.load8_u
                  i32.const 96
                  i32.ne
                  br_if 6 (;@1;)
                end
                i32.const 1612
                i32.const 0
                i32.store offset=20
                i32.const 0
                i32.load offset=1608
                i32.eqz
                br_if 1 (;@5;)
                br 2 (;@4;)
              end
              block ;; label = @6
                i32.const 0
                i32.load offset=1608
                br_if 0 (;@6;)
                call $blep_parser_callback
              end
              call $blep_token_next
              drop
              loop ;; label = @6
                i32.const 0
                call $consume_expr_internal
                local.tee 2
                br_if 5 (;@1;)
                block ;; label = @7
                  i32.const 1612
                  i32.load offset=20
                  i32.const 1077948416
                  i32.ne
                  br_if 0 (;@7;)
                  block ;; label = @8
                    i32.const 0
                    i32.load offset=1608
                    br_if 0 (;@8;)
                    call $blep_parser_callback
                  end
                  call $blep_token_next
                  drop
                  br 1 (;@6;)
                end
              end
              block ;; label = @6
                i32.const 1612
                i32.load offset=16
                i32.const 9
                i32.eq
                br_if 0 (;@6;)
                i32.const -1
                return
              end
              i32.const 0
              i32.load offset=1608
              br_if 1 (;@4;)
            end
            call $blep_parser_callback
          end
          call $blep_token_next
          drop
          i32.const 1612
          i32.load offset=16
          local.set 2
        end
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      local.get 2
                      i32.const -3
                      i32.add
                      br_table 1 (;@8;) 2 (;@7;) 6 (;@3;) 6 (;@3;) 0 (;@9;) 6 (;@3;)
                    end
                    i32.const 0
                    local.set 5
                    i32.const 1
                    local.set 6
                    i32.const 1
                    local.set 3
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=1608
                      local.tee 4
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 5
                      i32.const 0
                      i32.const 5
                      call $blep_parser_open
                      local.tee 2
                      i32.const 0
                      i32.ne
                      i32.store offset=1608
                      i32.const 1
                      local.set 6
                      i32.const 1
                      local.set 3
                      local.get 2
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 6
                      i32.const 11
                      call $blep_parser_open
                      i32.const 0
                      i32.ne
                      local.set 3
                      i32.const 1
                      local.set 5
                    end
                    i32.const 0
                    local.get 3
                    i32.store offset=1608
                    i32.const -1
                    local.set 2
                    i32.const 1612
                    i32.load offset=16
                    i32.const 7
                    i32.ne
                    br_if 7 (;@1;)
                    block ;; label = @9
                      local.get 3
                      br_if 0 (;@9;)
                      call $blep_parser_callback
                    end
                    call $blep_token_next
                    drop
                    block ;; label = @9
                      i32.const 1612
                      i32.load offset=16
                      i32.const 9
                      i32.eq
                      br_if 0 (;@9;)
                      i32.const 4
                      i32.const 0
                      call $consume_definition_list
                      local.tee 2
                      br_if 8 (;@1;)
                      i32.const -1
                      local.set 2
                      i32.const 1612
                      i32.load offset=16
                      i32.const 9
                      i32.ne
                      br_if 8 (;@1;)
                    end
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=1608
                      br_if 0 (;@9;)
                      call $blep_parser_callback
                    end
                    call $blep_token_next
                    drop
                    i32.const 0
                    call $consume_statement
                    local.tee 2
                    br_if 7 (;@1;)
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=1608
                      br_if 0 (;@9;)
                      i32.const 11
                      call $blep_parser_close
                    end
                    i32.const 0
                    local.get 6
                    i32.store offset=1608
                    i32.const 5
                    local.set 2
                    local.get 5
                    br_if 2 (;@6;)
                    br 3 (;@5;)
                  end
                  i32.const 1612
                  i32.load offset=20
                  i32.const 1077965824
                  i32.ne
                  br_if 4 (;@3;)
                end
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1608
                  br_if 0 (;@7;)
                  call $blep_parser_callback
                end
                call $blep_token_next
                drop
                local.get 0
                i32.eqz
                local.get 3
                i32.or
                br_if 2 (;@4;)
                i32.const 1
                local.set 2
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1608
                  local.tee 4
                  br_if 0 (;@7;)
                  i32.const 11
                  call $blep_parser_open
                  i32.const 0
                  i32.ne
                  local.set 2
                end
                i32.const 0
                local.get 2
                i32.store offset=1608
                i32.const 1612
                i32.load offset=4
                local.set 2
                i32.const 1
                call $consume_expr_internal
                local.tee 3
                i32.const -1
                i32.const 0
                local.get 2
                i32.const 1612
                i32.load offset=4
                i32.eq
                select
                local.get 3
                select
                local.tee 2
                br_if 5 (;@1;)
                i32.const 0
                i32.load offset=1608
                br_if 1 (;@5;)
                i32.const 11
                local.set 2
              end
              local.get 2
              call $blep_parser_close
            end
            i32.const 0
            local.get 4
            i32.store offset=1608
            br 1 (;@3;)
          end
          i32.const 1612
          i32.load offset=4
          local.set 2
          i32.const 1
          call $consume_expr_internal
          local.tee 3
          i32.const -1
          i32.const 0
          local.get 2
          i32.const 1612
          i32.load offset=4
          i32.eq
          select
          local.get 3
          select
          local.tee 2
          br_if 2 (;@1;)
        end
        i32.const -1
        local.set 2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  i32.const 1612
                  i32.load offset=16
                  i32.const -1
                  i32.add
                  br_table 5 (;@2;) 2 (;@5;) 1 (;@6;) 6 (;@1;) 6 (;@1;) 5 (;@2;) 6 (;@1;) 6 (;@1;) 0 (;@7;) 5 (;@2;) 6 (;@1;) 5 (;@2;) 5 (;@2;) 6 (;@1;)
                end
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1608
                  br_if 0 (;@7;)
                  call $blep_parser_callback
                end
                call $blep_token_next
                drop
                i32.const 0
                return
              end
              i32.const 1612
              i32.load offset=20
              local.tee 3
              i32.const 1077946368
              i32.eq
              br_if 3 (;@2;)
              local.get 3
              i32.const 1077948416
              i32.ne
              br_if 4 (;@1;)
              i32.const 0
              i32.load offset=1608
              i32.eqz
              br_if 1 (;@4;)
              br 2 (;@3;)
            end
            i32.const 0
            i32.load offset=1608
            br_if 1 (;@3;)
          end
          call $blep_parser_callback
        end
        call $blep_token_next
        drop
        br 0 (;@2;)
      end
    end
    local.get 2
  )
  (func $consume_optional_definition (;21;) (type 1) (param i32) (result i32)
    (local i32)
    block ;; label = @1
      i32.const 1612
      i32.load offset=20
      local.tee 1
      i32.const 1087256576
      i32.ne
      br_if 0 (;@1;)
      block ;; label = @2
        i32.const 0
        i32.load offset=1608
        br_if 0 (;@2;)
        call $blep_parser_callback
      end
      call $blep_token_next
      drop
    end
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              i32.const 1612
              i32.load offset=16
              i32.const -1
              i32.add
              br_table 0 (;@5;) 1 (;@4;) 1 (;@4;) 1 (;@4;) 2 (;@3;) 2 (;@3;) 1 (;@4;) 1 (;@4;) 1 (;@4;) 1 (;@4;) 1 (;@4;) 1 (;@4;) 0 (;@5;) 1 (;@4;)
            end
            i32.const 1612
            i32.const 13
            i32.store offset=16
            i32.const 1612
            local.get 0
            i32.const 2
            i32.or
            i32.store offset=20
            call $blep_token_peek
            drop
            block ;; label = @5
              block ;; label = @6
                i32.const 1612
                i32.const 44
                i32.add
                i32.load
                local.tee 0
                i32.const 1077965824
                i32.eq
                br_if 0 (;@6;)
                local.get 0
                i32.const 1085187075
                i32.eq
                br_if 0 (;@6;)
                local.get 0
                i32.const 1084668928
                i32.ne
                br_if 1 (;@5;)
              end
              i32.const 1612
              i32.const 1612
              i32.load offset=20
              i32.const 16
              i32.or
              i32.store offset=20
            end
            block ;; label = @5
              i32.const 0
              i32.load offset=1608
              br_if 0 (;@5;)
              call $blep_parser_callback
            end
            call $blep_token_next
            drop
            br 2 (;@2;)
          end
          i32.const -1
          i32.const 0
          local.get 1
          i32.const 1087256576
          i32.eq
          select
          return
        end
        local.get 0
        i32.const 2
        i32.or
        call $consume_destructuring
        local.tee 0
        br_if 1 (;@1;)
      end
      i32.const 0
      local.set 0
    end
    local.get 0
  )
  (func $consume_destructuring (;22;) (type 1) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    i32.const 1612
    i32.const 64
    i32.store offset=20
    i32.const 1612
    i32.load offset=16
    local.set 1
    block ;; label = @1
      i32.const 0
      i32.load offset=1608
      br_if 0 (;@1;)
      call $blep_parser_callback
    end
    local.get 0
    i32.const 16
    i32.or
    local.set 2
    local.get 0
    i32.const 24
    i32.or
    local.set 3
    call $blep_token_next
    drop
    local.get 1
    i32.const 5
    i32.ne
    local.set 4
    loop (result i32) ;; label = @1
      i32.const -1
      local.set 1
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
                                    i32.const 1612
                                    i32.load offset=16
                                    i32.const -1
                                    i32.add
                                    br_table 1 (;@15;) 12 (;@4;) 5 (;@11;) 12 (;@4;) 4 (;@12;) 3 (;@13;) 12 (;@4;) 12 (;@4;) 0 (;@16;) 2 (;@14;) 12 (;@4;) 12 (;@4;) 1 (;@15;) 12 (;@4;)
                                  end
                                  block ;; label = @16
                                    i32.const 0
                                    i32.load offset=1608
                                    br_if 0 (;@16;)
                                    call $blep_parser_callback
                                  end
                                  call $blep_token_next
                                  drop
                                  i32.const 0
                                  return
                                end
                                i32.const 8
                                local.set 1
                                block ;; label = @15
                                  call $blep_token_peek
                                  i32.const 4
                                  i32.eq
                                  br_if 0 (;@15;)
                                  i32.const 1612
                                  i32.const 13
                                  i32.store offset=16
                                  local.get 3
                                  local.set 1
                                end
                                i32.const 1612
                                local.get 1
                                i32.store offset=20
                                i32.const 0
                                i32.load offset=1608
                                i32.eqz
                                br_if 5 (;@9;)
                                br 6 (;@8;)
                              end
                              block ;; label = @14
                                i32.const 1612
                                i32.load offset=4
                                local.tee 5
                                i32.load8_u
                                i32.const 96
                                i32.ne
                                br_if 0 (;@14;)
                                i32.const 1612
                                i32.load offset=8
                                local.tee 6
                                i32.const 2
                                i32.lt_s
                                br_if 0 (;@14;)
                                i32.const -1
                                local.set 1
                                local.get 5
                                local.get 6
                                i32.add
                                i32.const -1
                                i32.add
                                i32.load8_u
                                i32.const 96
                                i32.ne
                                br_if 10 (;@4;)
                              end
                              i32.const 1612
                              i32.const 0
                              i32.store offset=20
                              block ;; label = @14
                                i32.const 0
                                i32.load offset=1608
                                br_if 0 (;@14;)
                                call $blep_parser_callback
                              end
                              call $blep_token_next
                              drop
                              i32.const 1612
                              i32.load offset=16
                              i32.const 4
                              i32.eq
                              br_if 7 (;@6;)
                              i32.const -1
                              return
                            end
                            local.get 4
                            br_if 0 (;@12;)
                            block ;; label = @13
                              i32.const 0
                              i32.load offset=1608
                              br_if 0 (;@13;)
                              call $blep_parser_callback
                            end
                            call $blep_token_next
                            drop
                            loop ;; label = @13
                              i32.const 0
                              call $consume_expr_internal
                              local.tee 1
                              br_if 9 (;@4;)
                              block ;; label = @14
                                i32.const 1612
                                i32.load offset=20
                                i32.const 1077948416
                                i32.ne
                                br_if 0 (;@14;)
                                block ;; label = @15
                                  i32.const 0
                                  i32.load offset=1608
                                  br_if 0 (;@15;)
                                  call $blep_parser_callback
                                end
                                call $blep_token_next
                                drop
                                br 1 (;@13;)
                              end
                            end
                            i32.const 1612
                            i32.load offset=16
                            i32.const 9
                            i32.eq
                            br_if 2 (;@10;)
                            i32.const -1
                            return
                          end
                          local.get 0
                          call $consume_destructuring
                          local.tee 1
                          i32.eqz
                          br_if 4 (;@7;)
                          br 7 (;@4;)
                        end
                        block ;; label = @11
                          i32.const 1612
                          i32.load offset=20
                          local.tee 1
                          i32.const 1087256576
                          i32.eq
                          br_if 0 (;@11;)
                          block ;; label = @12
                            local.get 1
                            i32.const 1077948416
                            i32.eq
                            br_if 0 (;@12;)
                            i32.const -1
                            return
                          end
                          i32.const 0
                          i32.load offset=1608
                          br_if 9 (;@2;)
                          br 8 (;@3;)
                        end
                        i32.const 0
                        i32.load offset=1608
                        i32.eqz
                        br_if 7 (;@3;)
                        br 8 (;@2;)
                      end
                      i32.const 0
                      i32.load offset=1608
                      br_if 1 (;@8;)
                    end
                    call $blep_parser_callback
                  end
                  call $blep_token_next
                  drop
                end
                i32.const 1612
                i32.load offset=16
                i32.const 4
                i32.ne
                br_if 1 (;@5;)
              end
              block ;; label = @6
                i32.const 0
                i32.load offset=1608
                br_if 0 (;@6;)
                call $blep_parser_callback
              end
              call $blep_token_next
              drop
              block ;; label = @6
                block ;; label = @7
                  i32.const 1612
                  i32.load offset=16
                  i32.const -1
                  i32.add
                  br_table 1 (;@6;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 0 (;@7;) 0 (;@7;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 2 (;@5;) 1 (;@6;) 2 (;@5;)
                end
                local.get 0
                call $consume_destructuring
                local.tee 1
                i32.eqz
                br_if 1 (;@5;)
                br 2 (;@4;)
              end
              i32.const 1612
              local.get 2
              i32.store offset=20
              i32.const 1612
              i32.const 13
              i32.store offset=16
              block ;; label = @6
                i32.const 0
                i32.load offset=1608
                br_if 0 (;@6;)
                call $blep_parser_callback
              end
              call $blep_token_next
              drop
            end
            i32.const 1612
            i32.load offset=20
            i32.const 1077965824
            i32.ne
            br_if 3 (;@1;)
            block ;; label = @5
              i32.const 0
              i32.load offset=1608
              br_if 0 (;@5;)
              call $blep_parser_callback
            end
            call $blep_token_next
            drop
            i32.const 1612
            i32.load offset=4
            local.set 1
            i32.const 0
            call $consume_expr_internal
            local.tee 5
            i32.const -1
            i32.const 0
            local.get 1
            i32.const 1612
            i32.load offset=4
            i32.eq
            select
            local.get 5
            select
            local.tee 1
            i32.eqz
            br_if 3 (;@1;)
          end
          local.get 1
          return
        end
        call $blep_parser_callback
      end
      call $blep_token_next
      drop
      br 0 (;@1;)
    end
  )
  (func $consume_optional_assign_suffix (;23;) (type 1) (param i32) (result i32)
    (local i32 i32)
    i32.const 0
    local.set 1
    block ;; label = @1
      i32.const 1612
      i32.load offset=20
      i32.const 1077965824
      i32.ne
      br_if 0 (;@1;)
      block ;; label = @2
        i32.const 0
        i32.load offset=1608
        br_if 0 (;@2;)
        call $blep_parser_callback
      end
      call $blep_token_next
      drop
      i32.const 1
      local.set 1
      block ;; label = @2
        i32.const 0
        i32.load offset=1608
        local.tee 2
        br_if 0 (;@2;)
        i32.const 1
        call $blep_parser_open
        i32.const 0
        i32.ne
        local.set 1
      end
      i32.const 0
      local.get 1
      i32.store offset=1608
      i32.const 1612
      i32.load offset=4
      local.set 1
      local.get 0
      call $consume_expr_internal
      local.tee 0
      i32.const -1
      i32.const 0
      local.get 1
      i32.const 1612
      i32.load offset=4
      i32.eq
      select
      local.get 0
      select
      local.tee 1
      br_if 0 (;@1;)
      block ;; label = @2
        i32.const 0
        i32.load offset=1608
        br_if 0 (;@2;)
        i32.const 1
        call $blep_parser_close
      end
      i32.const 0
      local.set 1
      i32.const 0
      local.get 2
      i32.store offset=1608
    end
    local.get 1
  )
  (func $consume_module_list_deep (;24;) (type 1) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block ;; label = @1
      i32.const 0
      i32.load offset=1608
      br_if 0 (;@1;)
      call $blep_parser_callback
    end
    i32.const 32
    i32.const 6
    local.get 0
    select
    local.set 1
    i32.const 1
    i32.const 13
    local.get 0
    select
    local.set 2
    i32.const 13
    i32.const 1
    local.get 0
    i32.const 1
    i32.eq
    select
    local.set 3
    local.get 0
    i32.const 1
    i32.ne
    i32.const 5
    i32.shl
    local.set 4
    call $blep_token_next
    drop
    i32.const 1612
    i32.const 44
    i32.add
    local.set 5
    local.get 0
    i32.const -1
    i32.add
    local.set 6
    block ;; label = @1
      loop ;; label = @2
        i32.const -1
        local.set 0
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  i32.const 1612
                  i32.load offset=16
                  i32.const -1
                  i32.add
                  i32.const 31
                  i32.rotl
                  br_table 2 (;@5;) 1 (;@6;) 6 (;@1;) 6 (;@1;) 0 (;@7;) 6 (;@1;) 2 (;@5;) 6 (;@1;)
                end
                i32.const 0
                local.set 0
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1608
                  br_if 0 (;@7;)
                  call $blep_parser_callback
                end
                call $blep_token_next
                drop
                br 5 (;@1;)
              end
              block ;; label = @6
                i32.const 1612
                i32.load offset=20
                i32.const 1077948416
                i32.eq
                br_if 0 (;@6;)
                i32.const -1
                return
              end
              i32.const 0
              i32.load offset=1608
              br_if 2 (;@3;)
              br 1 (;@4;)
            end
            call $blep_token_peek
            drop
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  local.get 5
                  i32.load
                  i32.const 1085506560
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 1612
                  local.get 3
                  i32.store offset=16
                  i32.const 1612
                  local.get 4
                  i32.store offset=20
                  block ;; label = @8
                    i32.const 0
                    i32.load offset=1608
                    br_if 0 (;@8;)
                    call $blep_parser_callback
                  end
                  call $blep_token_next
                  drop
                  i32.const 1612
                  i32.const 14
                  i32.store offset=16
                  block ;; label = @8
                    i32.const 0
                    i32.load offset=1608
                    br_if 0 (;@8;)
                    call $blep_parser_callback
                  end
                  call $blep_token_next
                  drop
                  i32.const -1
                  local.set 0
                  block ;; label = @8
                    i32.const 1612
                    i32.load offset=16
                    i32.const -1
                    i32.add
                    br_table 0 (;@8;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 7 (;@1;) 0 (;@8;) 7 (;@1;)
                  end
                  i32.const 1612
                  local.get 1
                  i32.store offset=20
                  i32.const 1612
                  local.get 2
                  i32.store offset=16
                  i32.const 0
                  i32.load offset=1608
                  i32.eqz
                  br_if 1 (;@6;)
                  br 2 (;@5;)
                end
                i32.const 32
                local.set 7
                i32.const 13
                local.set 0
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      local.get 6
                      br_table 2 (;@7;) 0 (;@9;) 1 (;@8;)
                    end
                    i32.const 1
                    local.set 0
                    br 1 (;@7;)
                  end
                  i32.const 38
                  local.set 7
                end
                i32.const 1612
                local.get 7
                i32.store offset=20
                i32.const 1612
                local.get 0
                i32.store offset=16
                i32.const 0
                i32.load offset=1608
                br_if 1 (;@5;)
              end
              call $blep_parser_callback
            end
            call $blep_token_next
            drop
            i32.const 1612
            i32.load offset=20
            i32.const 1077948416
            i32.ne
            br_if 2 (;@2;)
            i32.const 0
            i32.load offset=1608
            br_if 1 (;@3;)
          end
          call $blep_parser_callback
        end
        call $blep_token_next
        drop
        br 0 (;@2;)
      end
    end
    local.get 0
  )
  (func $blep_token_init (;25;) (type 4) (param i32 i32) (result i32)
    (local i32 i32)
    i32.const 1063
    i32.const 4
    call $consoleLog
    i32.const 0
    local.set 2
    i32.const 1612
    i32.const 0
    i32.const 1124
    call $memset
    drop
    i32.const 0
    local.get 0
    local.get 1
    i32.add
    local.tee 3
    i32.store offset=1668
    i32.const 0
    local.get 0
    i32.store offset=1664
    i32.const 0
    i32.const 1
    i32.store offset=1672
    i32.const 0
    i32.const 1
    i32.store offset=1660
    block ;; label = @1
      block ;; label = @2
        local.get 1
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        local.get 3
        i32.load8_u
        i32.eqz
        br_if 1 (;@1;)
      end
      i32.const 1046
      i32.const 16
      call $consoleLog
      i32.const -1
      local.set 2
    end
    local.get 2
  )
  (func $blep_token_update (;26;) (type 1) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    i32.const 0
    local.set 1
    block ;; label = @1
      i32.const 0
      i32.load offset=1628
      local.get 0
      i32.eq
      br_if 0 (;@1;)
      i32.const -3
      local.set 1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 0
            i32.const -3
            i32.add
            br_table 1 (;@3;) 3 (;@1;) 3 (;@1;) 3 (;@1;) 3 (;@1;) 3 (;@1;) 3 (;@1;) 3 (;@1;) 0 (;@4;) 3 (;@1;)
          end
          block ;; label = @4
            block ;; label = @5
              i32.const 0
              i32.load offset=1616
              local.tee 2
              i32.const 1
              i32.add
              local.tee 3
              i32.const 0
              i32.load offset=1668
              local.tee 4
              i32.lt_u
              br_if 0 (;@5;)
              local.get 3
              local.set 1
              br 1 (;@4;)
            end
            i32.const 0
            local.set 5
            local.get 2
            local.set 6
            loop ;; label = @5
              local.get 5
              local.set 7
              local.get 3
              local.set 1
              loop ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            local.get 1
                            i32.load8_u
                            local.tee 3
                            i32.const -91
                            i32.add
                            br_table 1 (;@11;) 4 (;@8;) 2 (;@10;) 0 (;@12;)
                          end
                          local.get 3
                          i32.const 10
                          i32.eq
                          br_if 7 (;@4;)
                          block ;; label = @12
                            local.get 3
                            i32.const 47
                            i32.eq
                            br_if 0 (;@12;)
                            local.get 1
                            local.set 1
                            br 5 (;@7;)
                          end
                          i32.const 1
                          local.set 5
                          local.get 7
                          br_if 2 (;@9;)
                          local.get 1
                          local.set 6
                          loop ;; label = @12
                            local.get 6
                            i32.load8_s offset=1
                            local.set 3
                            local.get 6
                            i32.const 1
                            i32.add
                            local.tee 1
                            local.set 6
                            local.get 3
                            call $isalnum
                            br_if 0 (;@12;)
                            br 8 (;@4;)
                          end
                        end
                        i32.const 1
                        local.set 5
                        br 1 (;@9;)
                      end
                      i32.const 0
                      local.set 5
                    end
                    local.get 1
                    local.set 6
                    local.get 1
                    i32.const 1
                    i32.add
                    local.tee 3
                    local.set 1
                    local.get 3
                    local.get 4
                    i32.lt_u
                    br_if 3 (;@5;)
                    br 4 (;@4;)
                  end
                  block ;; label = @8
                    local.get 6
                    i32.load8_u offset=2
                    local.tee 3
                    i32.const -91
                    i32.add
                    i32.const 2
                    i32.lt_u
                    br_if 0 (;@8;)
                    local.get 1
                    local.set 1
                    local.get 3
                    i32.const 47
                    i32.ne
                    br_if 1 (;@7;)
                  end
                  local.get 6
                  i32.const 2
                  i32.add
                  local.set 1
                end
                local.get 1
                local.set 6
                local.get 1
                i32.const 1
                i32.add
                local.tee 1
                local.get 4
                i32.lt_u
                br_if 0 (;@6;)
              end
            end
          end
          i32.const 0
          i32.load offset=1664
          local.get 1
          local.get 2
          i32.sub
          local.tee 6
          i32.add
          i32.const -1
          i32.add
          local.set 3
          br 1 (;@2;)
        end
        i32.const 1
        local.set 6
        i32.const 0
        i32.load offset=1664
        i32.const 0
        i32.load offset=1620
        i32.sub
        i32.const 1
        i32.add
        local.set 3
      end
      i32.const 0
      local.set 1
      i32.const 0
      local.get 0
      i32.store offset=1628
      i32.const 0
      local.get 6
      i32.store offset=1620
      i32.const 0
      local.get 3
      i32.store offset=1664
    end
    local.get 1
  )
  (func $blepi_consume_slash_regexp (;27;) (type 1) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    i32.const 0
    local.set 1
    block ;; label = @1
      local.get 0
      i32.const 1
      i32.add
      local.tee 2
      i32.const 0
      i32.load offset=1668
      local.tee 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      i32.sub
      return
    end
    local.get 0
    local.set 4
    loop ;; label = @1
      local.get 1
      local.set 5
      local.get 2
      local.set 6
      block ;; label = @2
        loop ;; label = @3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      local.get 6
                      i32.load8_u
                      local.tee 2
                      i32.const -91
                      i32.add
                      br_table 2 (;@7;) 4 (;@5;) 1 (;@8;) 0 (;@9;)
                    end
                    local.get 2
                    i32.const 10
                    i32.eq
                    br_if 6 (;@2;)
                    block ;; label = @9
                      local.get 2
                      i32.const 47
                      i32.eq
                      br_if 0 (;@9;)
                      local.get 6
                      local.set 6
                      br 5 (;@4;)
                    end
                    i32.const 1
                    local.set 1
                    local.get 5
                    br_if 2 (;@6;)
                    local.get 6
                    local.set 4
                    loop ;; label = @9
                      local.get 4
                      i32.load8_s offset=1
                      local.set 2
                      local.get 4
                      i32.const 1
                      i32.add
                      local.tee 6
                      local.set 4
                      local.get 2
                      call $isalnum
                      br_if 0 (;@9;)
                      br 7 (;@2;)
                    end
                  end
                  i32.const 0
                  local.set 1
                  br 1 (;@6;)
                end
                i32.const 1
                local.set 1
              end
              local.get 6
              local.set 4
              local.get 6
              i32.const 1
              i32.add
              local.tee 2
              local.set 6
              local.get 2
              local.get 3
              i32.lt_u
              br_if 4 (;@1;)
              br 3 (;@2;)
            end
            block ;; label = @5
              local.get 4
              i32.load8_u offset=2
              local.tee 2
              i32.const -91
              i32.add
              i32.const 2
              i32.lt_u
              br_if 0 (;@5;)
              local.get 6
              local.set 6
              local.get 2
              i32.const 47
              i32.ne
              br_if 1 (;@4;)
            end
            local.get 4
            i32.const 2
            i32.add
            local.set 6
          end
          local.get 6
          local.set 4
          local.get 6
          i32.const 1
          i32.add
          local.tee 6
          local.get 3
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
    end
    local.get 6
    local.get 0
    i32.sub
  )
  (func $blep_token_next (;28;) (type 5) (result i32)
    (local i64 i32 i32)
    block ;; label = @1
      block ;; label = @2
        i32.const 0
        i32.load offset=1640
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i64.load offset=1652 align=4
        i64.store offset=1628 align=4
        i32.const 0
        i32.const 0
        i64.load offset=1644 align=4
        local.tee 0
        i64.store offset=1620 align=4
        i32.const 0
        i32.const 0
        i64.load offset=1636 align=4
        i64.store offset=1612 align=4
        i32.const 0
        i32.const 0
        i32.store offset=1640
        local.get 0
        i32.wrap_i64
        local.set 1
        br 1 (;@1;)
      end
      i32.const 0
      i32.load offset=1664
      call $blepi_consume_void
      local.set 1
      i32.const 0
      i32.const 0
      i32.load offset=1664
      local.tee 2
      i32.store offset=1612
      i32.const 0
      local.get 2
      local.get 1
      i32.add
      local.tee 1
      i32.store offset=1664
      i32.const 0
      i32.load offset=1660
      local.set 2
      i32.const 1612
      local.get 1
      call $blepi_consume_token
      i32.const 0
      local.get 2
      i32.store offset=1624
      i32.const 0
      local.get 1
      i32.store offset=1616
      i32.const 0
      i32.const 0
      i32.load offset=1664
      i32.const 0
      i32.load offset=1620
      local.tee 1
      i32.add
      i32.store offset=1664
    end
    block ;; label = @1
      block ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        i32.const 0
        local.set 1
        i32.const 0
        i32.load offset=1664
        i32.const 0
        i32.load offset=1668
        i32.ge_u
        br_if 1 (;@1;)
        i32.const -1
        i32.const -2
        i32.const 0
        i32.load offset=1672
        i32.const -257
        i32.and
        select
        return
      end
      i32.const 0
      i32.load offset=1628
      local.set 1
    end
    local.get 1
  )
  (func $blepi_consume_void (;29;) (type 1) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    i32.const 0
    local.set 1
    i32.const 0
    i32.load offset=1668
    local.set 2
    local.get 0
    local.set 3
    loop (result i32) ;; label = @1
      i32.const 0
      local.set 4
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            block ;; label = @5
              loop ;; label = @6
                block ;; label = @7
                  local.get 3
                  local.get 4
                  i32.add
                  local.tee 5
                  i32.load8_u
                  i32.const -9
                  i32.add
                  br_table 0 (;@7;) 2 (;@5;) 0 (;@7;) 0 (;@7;) 0 (;@7;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 0 (;@7;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 3 (;@4;) 4 (;@3;)
                end
                local.get 4
                i32.const 1
                i32.add
                local.set 4
                br 0 (;@6;)
              end
            end
            local.get 1
            i32.const 1
            i32.add
            local.set 1
            local.get 5
            i32.const 1
            i32.add
            local.set 3
            br 3 (;@1;)
          end
          local.get 5
          i32.const 1
          i32.add
          i32.load8_u
          local.tee 6
          i32.const 47
          i32.eq
          br_if 1 (;@2;)
          local.get 6
          i32.const 42
          i32.ne
          br_if 0 (;@3;)
          local.get 5
          i32.const 2
          i32.add
          local.set 3
          loop ;; label = @4
            block ;; label = @5
              block ;; label = @6
                local.get 3
                i32.load8_u
                local.tee 4
                i32.const 10
                i32.eq
                br_if 0 (;@6;)
                local.get 4
                i32.const 42
                i32.ne
                br_if 1 (;@5;)
                local.get 3
                i32.load8_u offset=1
                i32.const 47
                i32.ne
                br_if 1 (;@5;)
                local.get 3
                i32.const 2
                i32.add
                local.set 3
                br 5 (;@1;)
              end
              local.get 1
              i32.const 1
              i32.add
              local.set 1
            end
            local.get 3
            i32.const 1
            i32.add
            local.tee 3
            local.get 2
            i32.ge_u
            br_if 3 (;@1;)
            br 0 (;@4;)
          end
        end
        i32.const 0
        i32.const 0
        i32.load offset=1660
        local.get 1
        i32.add
        i32.store offset=1660
        local.get 3
        local.get 0
        i32.sub
        local.get 4
        i32.add
        return
      end
      local.get 5
      i32.const 10
      local.get 2
      local.get 3
      i32.sub
      local.get 4
      i32.sub
      call $memchr
      local.tee 4
      local.get 2
      local.get 4
      select
      local.set 3
      br 0 (;@1;)
    end
  )
  (func $blepi_consume_token (;30;) (type 0) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    local.get 1
    i32.load8_u
    local.tee 2
    i32.const 1072
    i32.add
    i32.load8_u
    local.tee 3
    i32.extend8_s
    local.set 4
    i32.const 0
    local.set 5
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
                                      block ;; label = @18
                                        local.get 3
                                        br_table 14 (;@4;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 10 (;@8;) 9 (;@9;) 9 (;@9;) 9 (;@9;) 15 (;@3;) 11 (;@7;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 15 (;@3;) 0 (;@18;) 0 (;@18;) 0 (;@18;) 6 (;@12;) 1 (;@17;) 2 (;@16;) 3 (;@15;) 14 (;@4;) 14 (;@4;) 5 (;@13;) 12 (;@6;) 7 (;@11;) 8 (;@10;) 4 (;@14;) 13 (;@5;) 15 (;@3;)
                                      end
                                      local.get 1
                                      i32.load8_s offset=1
                                      local.set 5
                                      block ;; label = @18
                                        local.get 4
                                        i32.const 3
                                        i32.and
                                        local.tee 3
                                        i32.const 2
                                        i32.lt_u
                                        br_if 0 (;@18;)
                                        local.get 5
                                        local.get 2
                                        i32.ne
                                        br_if 0 (;@18;)
                                        local.get 1
                                        i32.load8_s offset=2
                                        local.set 5
                                        i32.const 2
                                        local.set 4
                                        block ;; label = @19
                                          local.get 3
                                          i32.const 3
                                          i32.ne
                                          br_if 0 (;@19;)
                                          local.get 5
                                          local.get 2
                                          i32.ne
                                          br_if 0 (;@19;)
                                          local.get 1
                                          i32.load8_u offset=3
                                          local.set 5
                                          i32.const 3
                                          local.set 4
                                        end
                                        local.get 4
                                        local.get 5
                                        i32.const 255
                                        i32.and
                                        i32.const 61
                                        i32.eq
                                        i32.add
                                        local.set 3
                                        br 16 (;@2;)
                                      end
                                      block ;; label = @18
                                        block ;; label = @19
                                          block ;; label = @20
                                            block ;; label = @21
                                              block ;; label = @22
                                                block ;; label = @23
                                                  block ;; label = @24
                                                    local.get 2
                                                    i32.const -33
                                                    i32.add
                                                    br_table 1 (;@23;) 3 (;@21;) 3 (;@21;) 3 (;@21;) 3 (;@21;) 3 (;@21;) 3 (;@21;) 3 (;@21;) 3 (;@21;) 0 (;@24;) 2 (;@22;)
                                                  end
                                                  i32.const 0
                                                  local.set 4
                                                  local.get 5
                                                  i32.const 61
                                                  i32.eq
                                                  br_if 3 (;@20;)
                                                  local.get 0
                                                  i64.const 4629744397401980931
                                                  i64.store offset=16 align=4
                                                  local.get 0
                                                  i32.const 1
                                                  i32.store offset=8
                                                  return
                                                end
                                                i32.const 0
                                                local.set 4
                                                local.get 5
                                                i32.const 61
                                                i32.eq
                                                br_if 2 (;@20;)
                                                local.get 0
                                                i64.const 4629704832163250179
                                                i64.store offset=16 align=4
                                                local.get 0
                                                i32.const 1
                                                i32.store offset=8
                                                return
                                              end
                                              local.get 2
                                              i32.const 126
                                              i32.eq
                                              br_if 20 (;@1;)
                                            end
                                            block ;; label = @21
                                              local.get 2
                                              i32.const 61
                                              i32.ne
                                              br_if 0 (;@21;)
                                              local.get 5
                                              i32.const 62
                                              i32.ne
                                              br_if 0 (;@21;)
                                              local.get 0
                                              i64.const 4656286608096493571
                                              i64.store offset=16 align=4
                                              local.get 0
                                              i32.const 2
                                              i32.store offset=8
                                              return
                                            end
                                            local.get 2
                                            i32.const 61
                                            i32.eq
                                            local.set 4
                                            block ;; label = @21
                                              local.get 5
                                              local.get 2
                                              i32.ne
                                              br_if 0 (;@21;)
                                              i32.const 2
                                              local.set 3
                                              block ;; label = @22
                                                local.get 5
                                                i32.const 255
                                                i32.and
                                                local.tee 5
                                                i32.const -38
                                                i32.add
                                                br_table 20 (;@2;) 4 (;@18;) 4 (;@18;) 4 (;@18;) 4 (;@18;) 0 (;@22;) 4 (;@18;) 0 (;@22;) 4 (;@18;) 4 (;@18;) 4 (;@18;) 4 (;@18;) 4 (;@18;) 4 (;@18;) 4 (;@18;) 4 (;@18;) 4 (;@18;) 4 (;@18;) 4 (;@18;) 4 (;@18;) 4 (;@18;) 4 (;@18;) 4 (;@18;) 2 (;@20;) 3 (;@19;)
                                              end
                                              local.get 0
                                              i64.const 4651422368655212547
                                              i64.store offset=16 align=4
                                              local.get 0
                                              i32.const 2
                                              i32.store offset=8
                                              return
                                            end
                                            local.get 5
                                            i32.const 61
                                            i32.ne
                                            br_if 2 (;@18;)
                                          end
                                          i32.const 2
                                          local.set 3
                                          local.get 1
                                          i32.load8_u offset=2
                                          i32.const 61
                                          i32.ne
                                          br_if 17 (;@2;)
                                          i32.const 3
                                          i32.const 3
                                          i32.const 2
                                          local.get 4
                                          select
                                          local.get 2
                                          i32.const 33
                                          i32.eq
                                          select
                                          local.set 3
                                          br 17 (;@2;)
                                        end
                                        local.get 5
                                        i32.const 124
                                        i32.eq
                                        br_if 16 (;@2;)
                                      end
                                      i32.const 1
                                      local.set 3
                                      local.get 2
                                      i32.const 61
                                      i32.ne
                                      br_if 15 (;@2;)
                                      local.get 0
                                      i64.const 4629827960285691907
                                      i64.store offset=16 align=4
                                      local.get 0
                                      i32.const 1
                                      i32.store offset=8
                                      return
                                    end
                                    block ;; label = @17
                                      local.get 1
                                      i32.load8_s offset=1
                                      local.tee 2
                                      i32.const -48
                                      i32.add
                                      i32.const 9
                                      i32.gt_u
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i64.const 12
                                      i64.store offset=16 align=4
                                      i32.const 1
                                      local.set 2
                                      block ;; label = @18
                                        loop ;; label = @19
                                          local.get 1
                                          local.get 2
                                          i32.add
                                          i32.load8_s
                                          local.tee 5
                                          i32.const 255
                                          i32.and
                                          local.set 3
                                          block ;; label = @20
                                            local.get 5
                                            call $isalnum
                                            br_if 0 (;@20;)
                                            local.get 3
                                            i32.const 95
                                            i32.eq
                                            br_if 0 (;@20;)
                                            local.get 3
                                            i32.const 46
                                            i32.ne
                                            br_if 2 (;@18;)
                                          end
                                          local.get 2
                                          i32.const 1
                                          i32.add
                                          local.set 2
                                          br 0 (;@19;)
                                        end
                                      end
                                      local.get 0
                                      local.get 2
                                      i32.store offset=8
                                      return
                                    end
                                    block ;; label = @17
                                      local.get 2
                                      i32.const 46
                                      i32.ne
                                      br_if 0 (;@17;)
                                      local.get 1
                                      i32.load8_u offset=2
                                      i32.const 46
                                      i32.ne
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i64.const 4669731436280938499
                                      i64.store offset=16 align=4
                                      local.get 0
                                      i32.const 3
                                      i32.store offset=8
                                      return
                                    end
                                    local.get 0
                                    i64.const 4629761989588025347
                                    i64.store offset=16 align=4
                                    local.get 0
                                    i32.const 1
                                    i32.store offset=8
                                    return
                                  end
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        local.get 1
                                        i32.load8_u offset=1
                                        i32.const -46
                                        i32.add
                                        br_table 0 (;@18;) 2 (;@16;) 2 (;@16;) 2 (;@16;) 2 (;@16;) 2 (;@16;) 2 (;@16;) 2 (;@16;) 2 (;@16;) 2 (;@16;) 2 (;@16;) 2 (;@16;) 2 (;@16;) 2 (;@16;) 2 (;@16;) 2 (;@16;) 2 (;@16;) 1 (;@17;) 2 (;@16;)
                                      end
                                      local.get 0
                                      i64.const 4651791804562145283
                                      i64.store offset=16 align=4
                                      local.get 0
                                      i32.const 2
                                      i32.store offset=8
                                      return
                                    end
                                    local.get 1
                                    i32.load8_u offset=2
                                    local.set 2
                                    local.get 0
                                    i64.const 3
                                    i64.store offset=16 align=4
                                    block ;; label = @17
                                      local.get 2
                                      i32.const 61
                                      i32.ne
                                      br_if 0 (;@17;)
                                      local.get 0
                                      i32.const 3
                                      i32.store offset=8
                                      return
                                    end
                                    local.get 0
                                    i32.const 2
                                    i32.store offset=8
                                    return
                                  end
                                  i32.const 0
                                  i32.load offset=1672
                                  i32.const 2
                                  i32.shl
                                  i32.const 1676
                                  i32.add
                                  i32.const 8
                                  i32.store
                                  block ;; label = @16
                                    i32.const 0
                                    i32.load offset=1672
                                    local.tee 2
                                    i32.const 0
                                    i32.load offset=2732
                                    i32.ge_s
                                    br_if 0 (;@16;)
                                    local.get 0
                                    i64.const 0
                                    i64.store offset=16 align=4
                                    local.get 0
                                    i32.const 0
                                    i32.store offset=8
                                    return
                                  end
                                  local.get 0
                                  i32.const 0
                                  i32.store offset=20
                                  i32.const 0
                                  local.get 2
                                  i32.const 1
                                  i32.add
                                  local.tee 2
                                  i32.store offset=1672
                                  block ;; label = @16
                                    local.get 2
                                    i32.const 256
                                    i32.ne
                                    br_if 0 (;@16;)
                                    local.get 0
                                    i32.const 0
                                    i32.store offset=8
                                    local.get 0
                                    i32.const 0
                                    i32.store offset=16
                                    return
                                  end
                                  local.get 0
                                  i32.const 1
                                  i32.store offset=8
                                  local.get 0
                                  i32.const 8
                                  i32.store offset=16
                                  return
                                end
                                local.get 0
                                i64.const 4629753193495003139
                                i64.store offset=16 align=4
                                local.get 0
                                i32.const 1
                                i32.store offset=8
                                return
                              end
                              local.get 0
                              i64.const 12
                              i64.store offset=16 align=4
                              i32.const 1
                              local.set 2
                              block ;; label = @14
                                loop ;; label = @15
                                  local.get 1
                                  local.get 2
                                  i32.add
                                  i32.load8_s
                                  local.tee 5
                                  i32.const 255
                                  i32.and
                                  local.set 3
                                  block ;; label = @16
                                    local.get 5
                                    call $isalnum
                                    br_if 0 (;@16;)
                                    local.get 3
                                    i32.const 95
                                    i32.eq
                                    br_if 0 (;@16;)
                                    local.get 3
                                    i32.const 46
                                    i32.ne
                                    br_if 2 (;@14;)
                                  end
                                  local.get 2
                                  i32.const 1
                                  i32.add
                                  local.set 2
                                  br 0 (;@15;)
                                end
                              end
                              local.get 0
                              local.get 2
                              i32.store offset=8
                              return
                            end
                            local.get 0
                            i64.const 10
                            i64.store offset=16 align=4
                            i32.const 0
                            i32.load offset=1668
                            local.set 4
                            local.get 1
                            local.set 2
                            block ;; label = @13
                              loop ;; label = @14
                                local.get 2
                                local.tee 5
                                i32.const 1
                                i32.add
                                local.set 2
                                block ;; label = @15
                                  block ;; label = @16
                                    block ;; label = @17
                                      block ;; label = @18
                                        local.get 5
                                        i32.load8_u offset=1
                                        local.tee 3
                                        br_table 0 (;@18;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 1 (;@17;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 3 (;@15;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 4 (;@14;) 3 (;@15;) 2 (;@16;)
                                      end
                                      local.get 4
                                      local.get 2
                                      i32.ne
                                      br_if 3 (;@14;)
                                      br 4 (;@13;)
                                    end
                                    i32.const 0
                                    i32.const 0
                                    i32.load offset=1660
                                    i32.const 1
                                    i32.add
                                    i32.store offset=1660
                                    br 2 (;@14;)
                                  end
                                  local.get 3
                                  i32.const 92
                                  i32.ne
                                  br_if 1 (;@14;)
                                  local.get 5
                                  i32.const 2
                                  i32.add
                                  local.tee 3
                                  local.get 3
                                  local.get 2
                                  local.get 5
                                  i32.load8_u offset=2
                                  local.tee 5
                                  local.get 1
                                  i32.load8_u
                                  i32.eq
                                  select
                                  local.get 5
                                  i32.const 92
                                  i32.eq
                                  select
                                  local.set 2
                                  br 1 (;@14;)
                                end
                                local.get 3
                                local.get 1
                                i32.load8_u
                                i32.ne
                                br_if 0 (;@14;)
                              end
                              local.get 5
                              i32.const 2
                              i32.add
                              local.set 4
                            end
                            local.get 0
                            local.get 4
                            local.get 1
                            i32.sub
                            i32.store offset=8
                            return
                          end
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    i32.const 0
                                    i32.load offset=1628
                                    i32.const -1
                                    i32.add
                                    br_table 0 (;@16;) 4 (;@12;) 4 (;@12;) 4 (;@12;) 4 (;@12;) 4 (;@12;) 4 (;@12;) 4 (;@12;) 2 (;@14;) 1 (;@15;) 3 (;@13;) 3 (;@13;) 3 (;@13;) 0 (;@16;) 4 (;@12;)
                                  end
                                  i32.const 0
                                  i32.load8_u offset=1632
                                  i32.const 7
                                  i32.and
                                  br_if 3 (;@12;)
                                  local.get 0
                                  i64.const 3
                                  i64.store offset=16 align=4
                                  local.get 0
                                  i32.const 1
                                  i32.store offset=8
                                  return
                                end
                                i32.const 0
                                i32.load offset=1616
                                i32.const 0
                                i32.load offset=1620
                                i32.add
                                i32.const -1
                                i32.add
                                i32.load8_u
                                i32.const 123
                                i32.eq
                                br_if 2 (;@12;)
                                local.get 0
                                i64.const 3
                                i64.store offset=16 align=4
                                local.get 0
                                i32.const 1
                                i32.store offset=8
                                return
                              end
                              i32.const 0
                              i32.load offset=1616
                              i32.load8_u
                              i32.const 58
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 0
                              i64.const 3
                              i64.store offset=16 align=4
                              local.get 0
                              i32.const 1
                              i32.store offset=8
                              return
                            end
                            local.get 0
                            i64.const 3
                            i64.store offset=16 align=4
                            local.get 0
                            i32.const 1
                            i32.store offset=8
                            return
                          end
                          local.get 0
                          i64.const 11
                          i64.store offset=16 align=4
                          local.get 0
                          local.get 1
                          call $blepi_consume_slash_regexp
                          i32.store offset=8
                          return
                        end
                        i32.const 0
                        local.set 5
                        i32.const 0
                        i32.load offset=1632
                        local.tee 3
                        i32.const 1077950464
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 3
                        i32.const 1083079680
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 0
                        i32.store offset=20
                        local.get 1
                        local.get 1
                        local.get 0
                        i32.const 20
                        i32.add
                        call $consume_known_lit
                        local.tee 5
                        i32.add
                        i32.load8_s
                        local.tee 2
                        i32.const 1328
                        i32.add
                        i32.load8_u
                        br_if 0 (;@10;)
                        local.get 0
                        local.get 5
                        i32.store offset=8
                        local.get 0
                        i32.const 1
                        i32.store offset=16
                        return
                      end
                      local.get 1
                      i32.const 1
                      i32.add
                      local.set 6
                      block ;; label = @10
                        loop ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              local.get 2
                              i32.const 255
                              i32.and
                              i32.const 92
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 1
                              i32.add
                              local.set 5
                              br 1 (;@12;)
                            end
                            local.get 6
                            local.get 5
                            i32.add
                            i32.load8_u
                            i32.const 117
                            i32.ne
                            br_if 2 (;@10;)
                            i32.const 0
                            local.set 2
                            block ;; label = @13
                              local.get 1
                              local.get 5
                              i32.const 2
                              i32.add
                              local.tee 4
                              i32.add
                              i32.load8_u
                              i32.const 123
                              i32.ne
                              br_if 0 (;@13;)
                              local.get 1
                              local.get 5
                              i32.add
                              local.set 3
                              i32.const 2
                              local.set 2
                              loop ;; label = @14
                                local.get 3
                                local.get 2
                                i32.add
                                i32.const 1
                                i32.add
                                i32.load8_s
                                local.tee 5
                                i32.const 125
                                i32.eq
                                br_if 1 (;@13;)
                                local.get 2
                                i32.const 1
                                i32.add
                                local.set 2
                                local.get 5
                                call $isalnum
                                br_if 0 (;@14;)
                              end
                              local.get 0
                              i64.const 0
                              i64.store offset=16 align=4
                              local.get 0
                              i32.const 0
                              i32.store offset=8
                              return
                            end
                            local.get 2
                            local.get 4
                            i32.add
                            local.set 5
                          end
                          local.get 1
                          local.get 5
                          i32.add
                          i32.load8_s
                          local.tee 2
                          i32.const 1328
                          i32.add
                          i32.load8_u
                          br_if 0 (;@11;)
                        end
                      end
                      local.get 0
                      i64.const 1
                      i64.store offset=16 align=4
                      local.get 0
                      local.get 5
                      i32.store offset=8
                      return
                    end
                    i32.const 0
                    i32.load offset=1672
                    i32.const 2
                    i32.shl
                    i32.const 1676
                    i32.add
                    local.get 4
                    i32.store
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=1672
                      local.tee 2
                      i32.const 0
                      i32.load offset=2732
                      i32.ge_s
                      br_if 0 (;@9;)
                      local.get 0
                      i64.const 0
                      i64.store offset=16 align=4
                      local.get 0
                      i32.const 0
                      i32.store offset=8
                      return
                    end
                    local.get 0
                    i32.const 0
                    i32.store offset=20
                    i32.const 0
                    local.get 2
                    i32.const 1
                    i32.add
                    local.tee 2
                    i32.store offset=1672
                    block ;; label = @9
                      local.get 2
                      i32.const 256
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 0
                      i32.store offset=8
                      local.get 0
                      i32.const 0
                      i32.store offset=16
                      return
                    end
                    local.get 0
                    i32.const 1
                    i32.store offset=8
                    local.get 0
                    local.get 4
                    i32.store offset=16
                    return
                  end
                  block ;; label = @8
                    i32.const 0
                    i32.load offset=1672
                    i32.const -1
                    i32.add
                    local.tee 2
                    i32.const 2
                    i32.shl
                    i32.const 1676
                    i32.add
                    i32.load
                    i32.const 8
                    i32.eq
                    br_if 0 (;@8;)
                    local.get 0
                    i64.const 4
                    i64.store offset=16 align=4
                    local.get 0
                    i32.const 1
                    i32.store offset=8
                    return
                  end
                  i32.const 0
                  local.get 2
                  i32.store offset=1672
                  local.get 0
                  i64.const 34359738377
                  i64.store offset=16 align=4
                  local.get 0
                  i32.const 1
                  i32.store offset=8
                  return
                end
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1672
                  i32.const -1
                  i32.add
                  local.tee 2
                  br_if 0 (;@7;)
                  local.get 0
                  i64.const 0
                  i64.store offset=16 align=4
                  local.get 0
                  i32.const 0
                  i32.store offset=8
                  return
                end
                block ;; label = @7
                  local.get 2
                  i32.const 2
                  i32.shl
                  i32.const 1676
                  i32.add
                  i32.load
                  local.tee 5
                  i32.const 10
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 0
                  local.get 5
                  i32.store offset=20
                  i32.const 0
                  local.get 2
                  i32.store offset=1672
                  local.get 0
                  i32.const 9
                  i32.store offset=16
                  local.get 0
                  i32.const 1
                  i32.store offset=8
                  return
                end
                block ;; label = @7
                  local.get 1
                  local.get 1
                  call $blepi_consume_template
                  local.tee 5
                  i32.add
                  i32.const -1
                  i32.add
                  i32.load8_u
                  i32.const 123
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 0
                  i64.const 10
                  i64.store offset=16 align=4
                  local.get 0
                  local.get 5
                  i32.store offset=8
                  return
                end
                i32.const 0
                local.get 2
                i32.store offset=1672
                local.get 0
                i64.const 10
                i64.store offset=16 align=4
                local.get 0
                local.get 5
                i32.store offset=8
                return
              end
              i32.const 0
              i32.load offset=1668
              local.set 4
              i32.const 0
              i32.load offset=1660
              local.set 6
              local.get 1
              local.set 2
              block ;; label = @6
                block ;; label = @7
                  loop ;; label = @8
                    local.get 2
                    local.tee 5
                    i32.const 1
                    i32.add
                    local.set 2
                    block ;; label = @9
                      block ;; label = @10
                        block ;; label = @11
                          block ;; label = @12
                            block ;; label = @13
                              local.get 5
                              i32.load8_u offset=1
                              local.tee 3
                              br_table 1 (;@12;) 5 (;@8;) 5 (;@8;) 5 (;@8;) 5 (;@8;) 5 (;@8;) 5 (;@8;) 5 (;@8;) 5 (;@8;) 5 (;@8;) 2 (;@11;) 0 (;@13;)
                            end
                            local.get 3
                            i32.const -92
                            i32.add
                            br_table 2 (;@10;) 4 (;@8;) 4 (;@8;) 4 (;@8;) 5 (;@7;) 3 (;@9;)
                          end
                          local.get 4
                          local.get 2
                          i32.ne
                          br_if 3 (;@8;)
                          br 5 (;@6;)
                        end
                        i32.const 0
                        local.get 6
                        i32.const 1
                        i32.add
                        local.tee 6
                        i32.store offset=1660
                        br 2 (;@8;)
                      end
                      block ;; label = @10
                        block ;; label = @11
                          local.get 5
                          i32.load8_u offset=2
                          local.tee 3
                          i32.const -92
                          i32.add
                          br_table 1 (;@10;) 3 (;@8;) 3 (;@8;) 3 (;@8;) 1 (;@10;) 0 (;@11;)
                        end
                        local.get 3
                        i32.const 36
                        i32.ne
                        br_if 2 (;@8;)
                      end
                      local.get 5
                      i32.const 2
                      i32.add
                      local.set 2
                      br 1 (;@8;)
                    end
                    local.get 3
                    i32.const 36
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 5
                    i32.load8_u offset=2
                    i32.const 123
                    i32.ne
                    br_if 0 (;@8;)
                  end
                  local.get 5
                  i32.const 3
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 5
                i32.const 2
                i32.add
                local.set 4
              end
              block ;; label = @6
                local.get 4
                i32.const -1
                i32.add
                i32.load8_u
                i32.const 123
                i32.ne
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1672
                i32.const 2
                i32.shl
                i32.const 1676
                i32.add
                i32.const 10
                i32.store
                block ;; label = @7
                  i32.const 0
                  i32.load offset=1672
                  local.tee 2
                  i32.const 0
                  i32.load offset=2732
                  i32.ge_s
                  br_if 0 (;@7;)
                  local.get 0
                  i64.const 0
                  i64.store offset=16 align=4
                  local.get 0
                  i32.const 0
                  i32.store offset=8
                  return
                end
                i32.const 0
                local.get 2
                i32.const 1
                i32.add
                local.tee 2
                i32.store offset=1672
                local.get 2
                i32.const 256
                i32.ne
                br_if 0 (;@6;)
                local.get 0
                i64.const 0
                i64.store offset=16 align=4
                local.get 0
                i32.const 0
                i32.store offset=8
                return
              end
              local.get 0
              i64.const 10
              i64.store offset=16 align=4
              local.get 0
              local.get 4
              local.get 1
              i32.sub
              i32.store offset=8
              return
            end
            block ;; label = @5
              block ;; label = @6
                i32.const 0
                i32.load offset=1624
                i32.const 0
                i32.load offset=1660
                i32.eq
                br_if 0 (;@6;)
                i32.const 0
                i32.load offset=1672
                i32.const 2
                i32.shl
                i32.const 1676
                i32.add
                i32.load
                i32.const 1085247553
                i32.ne
                br_if 1 (;@5;)
              end
              local.get 0
              i64.const 2
              i64.store offset=16 align=4
              local.get 0
              i32.const 1
              i32.store offset=8
              return
            end
            local.get 0
            i64.const 4294967298
            i64.store offset=16 align=4
            local.get 0
            i32.const 1
            i32.store offset=8
            return
          end
          local.get 0
          i64.const 0
          i64.store offset=16 align=4
          local.get 0
          i32.const 0
          i32.store offset=8
          return
        end
        local.get 0
        local.get 4
        i32.store offset=16
        local.get 0
        i32.const 0
        i32.store offset=20
        local.get 0
        i32.const 1
        i32.store offset=8
        return
      end
      local.get 0
      i64.const 3
      i64.store offset=16 align=4
      local.get 0
      local.get 3
      i32.store offset=8
      return
    end
    local.get 0
    i64.const 4629973113000427523
    i64.store offset=16 align=4
    local.get 0
    i32.const 1
    i32.store offset=8
  )
  (func $blepi_consume_template (;31;) (type 1) (param i32) (result i32)
    (local i32 i32 i32 i32 i32)
    i32.const 0
    i32.load offset=1668
    local.set 1
    i32.const 0
    i32.load offset=1660
    local.set 2
    local.get 0
    local.set 3
    block ;; label = @1
      block ;; label = @2
        loop ;; label = @3
          local.get 3
          local.tee 4
          i32.const 1
          i32.add
          local.set 3
          block ;; label = @4
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    local.get 4
                    i32.load8_u offset=1
                    local.tee 5
                    br_table 1 (;@7;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 5 (;@3;) 2 (;@6;) 0 (;@8;)
                  end
                  local.get 5
                  i32.const -92
                  i32.add
                  br_table 2 (;@5;) 4 (;@3;) 4 (;@3;) 4 (;@3;) 5 (;@2;) 3 (;@4;)
                end
                local.get 1
                local.get 3
                i32.ne
                br_if 3 (;@3;)
                br 5 (;@1;)
              end
              i32.const 0
              local.get 2
              i32.const 1
              i32.add
              local.tee 2
              i32.store offset=1660
              br 2 (;@3;)
            end
            block ;; label = @5
              block ;; label = @6
                local.get 4
                i32.load8_u offset=2
                local.tee 5
                i32.const -92
                i32.add
                br_table 1 (;@5;) 3 (;@3;) 3 (;@3;) 3 (;@3;) 1 (;@5;) 0 (;@6;)
              end
              local.get 5
              i32.const 36
              i32.ne
              br_if 2 (;@3;)
            end
            local.get 4
            i32.const 2
            i32.add
            local.set 3
            br 1 (;@3;)
          end
          local.get 5
          i32.const 36
          i32.ne
          br_if 0 (;@3;)
          local.get 4
          i32.load8_u offset=2
          i32.const 123
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 4
        i32.const 3
        i32.add
        local.get 0
        i32.sub
        return
      end
      local.get 4
      i32.const 2
      i32.add
      local.set 1
    end
    local.get 1
    local.get 0
    i32.sub
  )
  (func $blep_token_peek (;32;) (type 5) (result i32)
    (local i32 i32)
    block ;; label = @1
      i32.const 0
      i32.load offset=1640
      br_if 0 (;@1;)
      i32.const 0
      i32.load offset=1664
      call $blepi_consume_void
      local.set 0
      i32.const 0
      i32.const 0
      i32.load offset=1664
      local.tee 1
      i32.store offset=1636
      i32.const 0
      i32.const 0
      i32.load offset=1660
      i32.store offset=1648
      i32.const 0
      local.get 1
      local.get 0
      i32.add
      local.tee 0
      i32.store offset=1664
      i32.const 0
      local.get 0
      i32.store offset=1640
      i32.const 1636
      local.get 0
      call $blepi_consume_token
      i32.const 0
      i32.const 0
      i32.load offset=1664
      i32.const 0
      i32.load offset=1644
      i32.add
      i32.store offset=1664
    end
    i32.const 0
    i32.load offset=1652
  )
  (func $blep_token_set_restore (;33;) (type 5) (result i32)
    (local i32)
    i32.const 0
    local.set 0
    block ;; label = @1
      i32.const 0
      i32.load offset=2728
      br_if 0 (;@1;)
      block ;; label = @2
        block ;; label = @3
          i32.const 0
          i32.load offset=1640
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1664
          local.set 0
          br 1 (;@2;)
        end
        block ;; label = @3
          i32.const 0
          i32.load offset=1652
          i32.const -5
          i32.add
          local.tee 0
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          i32.const 0
          i32.const 0
          i32.load offset=1672
          local.get 0
          i32.const 2
          i32.shl
          i32.const 1584
          i32.add
          i32.load
          i32.add
          i32.store offset=1672
        end
        i32.const 0
        i32.const 0
        i32.load offset=1636
        local.tee 0
        i32.store offset=1664
        i32.const 0
        i32.const 0
        i32.store offset=1640
      end
      i32.const 0
      local.get 0
      i32.store offset=2728
      i32.const 0
      i32.const 0
      i64.load offset=1628 align=4
      i64.store offset=2716 align=4
      i32.const 0
      i32.const 0
      i64.load offset=1620 align=4
      i64.store offset=2708 align=4
      i32.const 0
      i32.const 0
      i64.load offset=1612 align=4
      i64.store offset=2700 align=4
      i32.const 0
      i32.const 0
      i32.load offset=1660
      i32.store offset=2724
      i32.const 0
      i32.const 0
      i32.load offset=1672
      local.tee 0
      i32.store offset=2732
    end
    local.get 0
  )
  (func $blep_token_restore (;34;) (type 5) (result i32)
    (local i32 i32)
    i32.const 0
    local.set 0
    block ;; label = @1
      i32.const 0
      i32.load offset=2728
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      local.get 1
      i32.store offset=1664
      i32.const 0
      i32.const 0
      i64.load offset=2716 align=4
      i64.store offset=1628 align=4
      i32.const 0
      i32.const 0
      i64.load offset=2708 align=4
      i64.store offset=1620 align=4
      i32.const 0
      i32.const 0
      i64.load offset=2700 align=4
      i64.store offset=1612 align=4
      i32.const 0
      i32.const 0
      i32.load offset=2724
      i32.store offset=1660
      i32.const 0
      i32.const 0
      i32.load offset=2732
      local.tee 0
      i32.store offset=1672
      i32.const 0
      i64.const 0
      i64.store offset=2728 align=4
      i32.const 0
      i32.const 0
      i32.store offset=1640
    end
    local.get 0
  )
  (func $isalnum (;35;) (type 1) (param i32) (result i32)
    local.get 0
    i32.const -48
    i32.add
    i32.const 10
    i32.lt_u
    local.get 0
    i32.const 32
    i32.or
    i32.const -97
    i32.add
    i32.const 26
    i32.lt_u
    i32.or
  )
  (func $memchr (;36;) (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 2
    i32.const 0
    i32.ne
    local.set 3
    block ;; label = @1
      block ;; label = @2
        block ;; label = @3
          block ;; label = @4
            local.get 0
            i32.const 3
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            i32.eqz
            br_if 0 (;@4;)
            block ;; label = @5
              local.get 0
              i32.load8_u
              local.get 1
              i32.const 255
              i32.and
              i32.ne
              br_if 0 (;@5;)
              local.get 0
              local.set 4
              local.get 2
              local.set 5
              br 3 (;@2;)
            end
            local.get 2
            i32.const -1
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            local.get 0
            i32.const 1
            i32.add
            local.tee 4
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i32.const -2
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            local.get 0
            i32.const 2
            i32.add
            local.tee 4
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 2
            i32.const -3
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            local.get 0
            i32.const 3
            i32.add
            local.tee 4
            i32.const 3
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 5
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            i32.load8_u
            local.get 1
            i32.const 255
            i32.and
            i32.eq
            br_if 2 (;@2;)
            local.get 0
            i32.const 4
            i32.add
            local.set 4
            local.get 2
            i32.const -4
            i32.add
            local.tee 5
            i32.const 0
            i32.ne
            local.set 3
            br 1 (;@3;)
          end
          local.get 2
          local.set 5
          local.get 0
          local.set 4
        end
        local.get 3
        i32.eqz
        br_if 1 (;@1;)
        block ;; label = @3
          local.get 4
          i32.load8_u
          local.get 1
          i32.const 255
          i32.and
          i32.eq
          br_if 0 (;@3;)
          local.get 5
          i32.const 4
          i32.lt_u
          br_if 0 (;@3;)
          local.get 1
          i32.const 255
          i32.and
          i32.const 16843009
          i32.mul
          local.set 0
          loop ;; label = @4
            local.get 4
            i32.load
            local.get 0
            i32.xor
            local.tee 2
            i32.const -1
            i32.xor
            local.get 2
            i32.const -16843009
            i32.add
            i32.and
            i32.const -2139062144
            i32.and
            br_if 2 (;@2;)
            local.get 4
            i32.const 4
            i32.add
            local.set 4
            local.get 5
            i32.const -4
            i32.add
            local.tee 5
            i32.const 3
            i32.gt_u
            br_if 0 (;@4;)
          end
        end
        local.get 5
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 1
      i32.const 255
      i32.and
      local.set 2
      loop ;; label = @2
        block ;; label = @3
          local.get 4
          i32.load8_u
          local.get 2
          i32.ne
          br_if 0 (;@3;)
          local.get 4
          return
        end
        local.get 4
        i32.const 1
        i32.add
        local.set 4
        local.get 5
        i32.const -1
        i32.add
        local.tee 5
        br_if 0 (;@2;)
      end
    end
    i32.const 0
  )
  (func $memset (;37;) (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i64)
    block ;; label = @1
      local.get 2
      i32.const 33
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 2
      memory.fill
      local.get 0
      return
    end
    block ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 0
      local.get 2
      i32.add
      local.tee 3
      i32.const -1
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const -3
      i32.add
      local.get 1
      i32.store8
      local.get 3
      i32.const -2
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 3
      i32.const -4
      i32.add
      local.get 1
      i32.store8
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.tee 5
      local.get 1
      i32.const 255
      i32.and
      i32.const 16843009
      i32.mul
      local.tee 3
      i32.store
      local.get 5
      local.get 2
      local.get 4
      i32.sub
      i32.const -4
      i32.and
      local.tee 1
      i32.add
      local.tee 2
      i32.const -4
      i32.add
      local.get 3
      i32.store
      local.get 1
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 5
      local.get 3
      i32.store offset=8
      local.get 5
      local.get 3
      i32.store offset=4
      local.get 2
      i32.const -8
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -12
      i32.add
      local.get 3
      i32.store
      local.get 1
      i32.const 25
      i32.lt_u
      br_if 0 (;@1;)
      local.get 5
      local.get 3
      i32.store offset=24
      local.get 5
      local.get 3
      i32.store offset=20
      local.get 5
      local.get 3
      i32.store offset=16
      local.get 5
      local.get 3
      i32.store offset=12
      local.get 2
      i32.const -16
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -20
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -24
      i32.add
      local.get 3
      i32.store
      local.get 2
      i32.const -28
      i32.add
      local.get 3
      i32.store
      local.get 1
      local.get 5
      i32.const 4
      i32.and
      i32.const 24
      i32.or
      local.tee 2
      i32.sub
      local.tee 1
      i32.const 32
      i32.lt_u
      br_if 0 (;@1;)
      local.get 3
      i64.extend_i32_u
      i64.const 4294967297
      i64.mul
      local.set 6
      local.get 5
      local.get 2
      i32.add
      local.set 2
      loop ;; label = @2
        local.get 2
        local.get 6
        i64.store offset=24
        local.get 2
        local.get 6
        i64.store offset=16
        local.get 2
        local.get 6
        i64.store offset=8
        local.get 2
        local.get 6
        i64.store
        local.get 2
        i32.const 32
        i32.add
        local.set 2
        local.get 1
        i32.const -32
        i32.add
        local.tee 1
        i32.const 31
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0
  )
  (func $abort (;38;) (type 2)
    unreachable
    unreachable
  )
  (func $sbrk (;39;) (type 1) (param i32) (result i32)
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
        i32.store offset=2736
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
  (func $malloc (;40;) (type 1) (param i32) (result i32)
    local.get 0
    call $dlmalloc
  )
  (func $dlmalloc (;41;) (type 1) (param i32) (result i32)
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
                            i32.const 0
                            i32.load offset=2764
                            local.tee 2
                            br_if 0 (;@12;)
                            block ;; label = @13
                              i32.const 0
                              i32.load offset=3212
                              local.tee 3
                              br_if 0 (;@13;)
                              i32.const 0
                              i64.const -1
                              i64.store offset=3224 align=4
                              i32.const 0
                              i64.const 281474976776192
                              i64.store offset=3216 align=4
                              i32.const 0
                              local.get 1
                              i32.const 8
                              i32.add
                              i32.const -16
                              i32.and
                              i32.const 1431655768
                              i32.xor
                              local.tee 3
                              i32.store offset=3212
                              i32.const 0
                              i32.const 0
                              i32.store offset=3232
                              i32.const 0
                              i32.const 0
                              i32.store offset=3184
                            end
                            i32.const 131072
                            i32.const 68784
                            i32.lt_u
                            br_if 1 (;@11;)
                            i32.const 0
                            local.set 2
                            i32.const 131072
                            i32.const 68784
                            i32.sub
                            i32.const 89
                            i32.lt_u
                            br_if 0 (;@12;)
                            i32.const 0
                            local.set 4
                            i32.const 0
                            i32.const 68784
                            i32.store offset=3188
                            i32.const 0
                            i32.const 68784
                            i32.store offset=2756
                            i32.const 0
                            local.get 3
                            i32.store offset=2776
                            i32.const 0
                            i32.const -1
                            i32.store offset=2772
                            i32.const 0
                            i32.const 131072
                            i32.const 68784
                            i32.sub
                            local.tee 3
                            i32.store offset=3192
                            i32.const 0
                            local.get 3
                            i32.store offset=3176
                            i32.const 0
                            local.get 3
                            i32.store offset=3172
                            loop ;; label = @13
                              local.get 4
                              i32.const 2800
                              i32.add
                              local.get 4
                              i32.const 2788
                              i32.add
                              local.tee 3
                              i32.store
                              local.get 3
                              local.get 4
                              i32.const 2780
                              i32.add
                              local.tee 5
                              i32.store
                              local.get 4
                              i32.const 2792
                              i32.add
                              local.get 5
                              i32.store
                              local.get 4
                              i32.const 2808
                              i32.add
                              local.get 4
                              i32.const 2796
                              i32.add
                              local.tee 5
                              i32.store
                              local.get 5
                              local.get 3
                              i32.store
                              local.get 4
                              i32.const 2816
                              i32.add
                              local.get 4
                              i32.const 2804
                              i32.add
                              local.tee 3
                              i32.store
                              local.get 3
                              local.get 5
                              i32.store
                              local.get 4
                              i32.const 2812
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
                            i32.const 68784
                            i32.const -8
                            i32.const 68784
                            i32.sub
                            i32.const 15
                            i32.and
                            local.tee 4
                            i32.add
                            local.tee 2
                            i32.const 131072
                            i32.const 68784
                            i32.sub
                            i32.const -56
                            i32.add
                            local.tee 3
                            local.get 4
                            i32.sub
                            local.tee 4
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            i32.const 0
                            i32.const 0
                            i32.load offset=3228
                            i32.store offset=2768
                            i32.const 0
                            local.get 4
                            i32.store offset=2752
                            i32.const 0
                            local.get 2
                            i32.store offset=2764
                            local.get 3
                            i32.const 68784
                            i32.add
                            i32.const 4
                            i32.add
                            i32.const 56
                            i32.store
                          end
                          block ;; label = @12
                            block ;; label = @13
                              local.get 0
                              i32.const 236
                              i32.gt_u
                              br_if 0 (;@13;)
                              block ;; label = @14
                                i32.const 0
                                i32.load offset=2740
                                local.tee 6
                                i32.const 16
                                local.get 0
                                i32.const 19
                                i32.add
                                i32.const 496
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
                                br_if 0 (;@14;)
                                block ;; label = @15
                                  block ;; label = @16
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
                                    i32.const 2780
                                    i32.add
                                    local.tee 4
                                    local.get 3
                                    i32.const 2788
                                    i32.add
                                    i32.load
                                    local.tee 3
                                    i32.load offset=8
                                    local.tee 7
                                    i32.ne
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.get 6
                                    i32.const -2
                                    local.get 5
                                    i32.rotl
                                    i32.and
                                    i32.store offset=2740
                                    br 1 (;@15;)
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
                                br 13 (;@1;)
                              end
                              local.get 7
                              i32.const 0
                              i32.load offset=2748
                              local.tee 8
                              i32.le_u
                              br_if 1 (;@12;)
                              block ;; label = @14
                                local.get 4
                                i32.eqz
                                br_if 0 (;@14;)
                                block ;; label = @15
                                  block ;; label = @16
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
                                    i32.const 2780
                                    i32.add
                                    local.tee 5
                                    local.get 4
                                    i32.const 2788
                                    i32.add
                                    i32.load
                                    local.tee 4
                                    i32.load offset=8
                                    local.tee 0
                                    i32.ne
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.get 6
                                    i32.const -2
                                    local.get 3
                                    i32.rotl
                                    i32.and
                                    local.tee 6
                                    i32.store offset=2740
                                    br 1 (;@15;)
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
                                block ;; label = @15
                                  local.get 8
                                  i32.eqz
                                  br_if 0 (;@15;)
                                  local.get 8
                                  i32.const -8
                                  i32.and
                                  i32.const 2780
                                  i32.add
                                  local.set 7
                                  i32.const 0
                                  i32.load offset=2760
                                  local.set 3
                                  block ;; label = @16
                                    block ;; label = @17
                                      local.get 6
                                      i32.const 1
                                      local.get 8
                                      i32.const 3
                                      i32.shr_u
                                      i32.shl
                                      local.tee 9
                                      i32.and
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.get 6
                                      local.get 9
                                      i32.or
                                      i32.store offset=2740
                                      local.get 7
                                      local.set 9
                                      br 1 (;@16;)
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
                                i32.store offset=2760
                                i32.const 0
                                local.get 5
                                i32.store offset=2748
                                br 13 (;@1;)
                              end
                              i32.const 0
                              i32.load offset=2744
                              local.tee 10
                              i32.eqz
                              br_if 1 (;@12;)
                              local.get 10
                              i32.ctz
                              i32.const 2
                              i32.shl
                              i32.const 3044
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
                              block ;; label = @14
                                loop ;; label = @15
                                  block ;; label = @16
                                    local.get 5
                                    i32.load offset=16
                                    local.tee 4
                                    br_if 0 (;@16;)
                                    local.get 5
                                    i32.const 20
                                    i32.add
                                    i32.load
                                    local.tee 4
                                    i32.eqz
                                    br_if 2 (;@14;)
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
                                  br 0 (;@15;)
                                end
                              end
                              local.get 0
                              i32.load offset=24
                              local.set 11
                              block ;; label = @14
                                local.get 0
                                i32.load offset=12
                                local.tee 9
                                local.get 0
                                i32.eq
                                br_if 0 (;@14;)
                                local.get 0
                                i32.load offset=8
                                local.tee 4
                                i32.const 0
                                i32.load offset=2756
                                i32.lt_u
                                drop
                                local.get 9
                                local.get 4
                                i32.store offset=8
                                local.get 4
                                local.get 9
                                i32.store offset=12
                                br 12 (;@2;)
                              end
                              block ;; label = @14
                                local.get 0
                                i32.const 20
                                i32.add
                                local.tee 5
                                i32.load
                                local.tee 4
                                br_if 0 (;@14;)
                                local.get 0
                                i32.load offset=16
                                local.tee 4
                                i32.eqz
                                br_if 4 (;@10;)
                                local.get 0
                                i32.const 16
                                i32.add
                                local.set 5
                              end
                              loop ;; label = @14
                                local.get 5
                                local.set 2
                                local.get 4
                                local.tee 9
                                i32.const 20
                                i32.add
                                local.tee 5
                                i32.load
                                local.tee 4
                                br_if 0 (;@14;)
                                local.get 9
                                i32.const 16
                                i32.add
                                local.set 5
                                local.get 9
                                i32.load offset=16
                                local.tee 4
                                br_if 0 (;@14;)
                              end
                              local.get 2
                              i32.const 0
                              i32.store
                              br 11 (;@2;)
                            end
                            i32.const -1
                            local.set 7
                            local.get 0
                            i32.const -65
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 0
                            i32.const 19
                            i32.add
                            local.tee 4
                            i32.const -16
                            i32.and
                            local.set 7
                            i32.const 0
                            i32.load offset=2744
                            local.tee 11
                            i32.eqz
                            br_if 0 (;@12;)
                            i32.const 0
                            local.set 8
                            block ;; label = @13
                              local.get 7
                              i32.const 256
                              i32.lt_u
                              br_if 0 (;@13;)
                              i32.const 31
                              local.set 8
                              local.get 7
                              i32.const 16777215
                              i32.gt_u
                              br_if 0 (;@13;)
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
                            block ;; label = @13
                              block ;; label = @14
                                block ;; label = @15
                                  block ;; label = @16
                                    local.get 8
                                    i32.const 2
                                    i32.shl
                                    i32.const 3044
                                    i32.add
                                    i32.load
                                    local.tee 5
                                    br_if 0 (;@16;)
                                    i32.const 0
                                    local.set 4
                                    i32.const 0
                                    local.set 9
                                    br 1 (;@15;)
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
                                  loop ;; label = @16
                                    block ;; label = @17
                                      local.get 5
                                      i32.load offset=4
                                      i32.const -8
                                      i32.and
                                      local.get 7
                                      i32.sub
                                      local.tee 6
                                      local.get 3
                                      i32.ge_u
                                      br_if 0 (;@17;)
                                      local.get 6
                                      local.set 3
                                      local.get 5
                                      local.set 9
                                      local.get 6
                                      br_if 0 (;@17;)
                                      i32.const 0
                                      local.set 3
                                      local.get 5
                                      local.set 9
                                      local.get 5
                                      local.set 4
                                      br 3 (;@14;)
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
                                    br_if 0 (;@16;)
                                  end
                                end
                                block ;; label = @15
                                  local.get 4
                                  local.get 9
                                  i32.or
                                  br_if 0 (;@15;)
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
                                  br_if 3 (;@12;)
                                  local.get 4
                                  i32.ctz
                                  i32.const 2
                                  i32.shl
                                  i32.const 3044
                                  i32.add
                                  i32.load
                                  local.set 4
                                end
                                local.get 4
                                i32.eqz
                                br_if 1 (;@13;)
                              end
                              loop ;; label = @14
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
                                block ;; label = @15
                                  local.get 4
                                  i32.load offset=16
                                  local.tee 5
                                  br_if 0 (;@15;)
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
                                br_if 0 (;@14;)
                              end
                            end
                            local.get 9
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 3
                            i32.const 0
                            i32.load offset=2748
                            local.get 7
                            i32.sub
                            i32.ge_u
                            br_if 0 (;@12;)
                            local.get 9
                            i32.load offset=24
                            local.set 2
                            block ;; label = @13
                              local.get 9
                              i32.load offset=12
                              local.tee 0
                              local.get 9
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 9
                              i32.load offset=8
                              local.tee 4
                              i32.const 0
                              i32.load offset=2756
                              i32.lt_u
                              drop
                              local.get 0
                              local.get 4
                              i32.store offset=8
                              local.get 4
                              local.get 0
                              i32.store offset=12
                              br 10 (;@3;)
                            end
                            block ;; label = @13
                              local.get 9
                              i32.const 20
                              i32.add
                              local.tee 5
                              i32.load
                              local.tee 4
                              br_if 0 (;@13;)
                              local.get 9
                              i32.load offset=16
                              local.tee 4
                              i32.eqz
                              br_if 4 (;@9;)
                              local.get 9
                              i32.const 16
                              i32.add
                              local.set 5
                            end
                            loop ;; label = @13
                              local.get 5
                              local.set 6
                              local.get 4
                              local.tee 0
                              i32.const 20
                              i32.add
                              local.tee 5
                              i32.load
                              local.tee 4
                              br_if 0 (;@13;)
                              local.get 0
                              i32.const 16
                              i32.add
                              local.set 5
                              local.get 0
                              i32.load offset=16
                              local.tee 4
                              br_if 0 (;@13;)
                            end
                            local.get 6
                            i32.const 0
                            i32.store
                            br 9 (;@3;)
                          end
                          block ;; label = @12
                            i32.const 0
                            i32.load offset=2748
                            local.tee 4
                            local.get 7
                            i32.lt_u
                            br_if 0 (;@12;)
                            i32.const 0
                            i32.load offset=2760
                            local.set 3
                            block ;; label = @13
                              block ;; label = @14
                                local.get 4
                                local.get 7
                                i32.sub
                                local.tee 5
                                i32.const 16
                                i32.lt_u
                                br_if 0 (;@14;)
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
                                br 1 (;@13;)
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
                            i32.store offset=2748
                            i32.const 0
                            local.get 0
                            i32.store offset=2760
                            local.get 3
                            i32.const 8
                            i32.add
                            local.set 4
                            br 11 (;@1;)
                          end
                          block ;; label = @12
                            i32.const 0
                            i32.load offset=2752
                            local.tee 5
                            local.get 7
                            i32.le_u
                            br_if 0 (;@12;)
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
                            i32.store offset=2764
                            i32.const 0
                            local.get 3
                            i32.store offset=2752
                            local.get 2
                            local.get 7
                            i32.const 3
                            i32.or
                            i32.store offset=4
                            local.get 2
                            i32.const 8
                            i32.add
                            local.set 4
                            br 11 (;@1;)
                          end
                          block ;; label = @12
                            block ;; label = @13
                              i32.const 0
                              i32.load offset=3212
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 0
                              i32.load offset=3220
                              local.set 3
                              br 1 (;@12;)
                            end
                            i32.const 0
                            i64.const -1
                            i64.store offset=3224 align=4
                            i32.const 0
                            i64.const 281474976776192
                            i64.store offset=3216 align=4
                            i32.const 0
                            local.get 1
                            i32.const 12
                            i32.add
                            i32.const -16
                            i32.and
                            i32.const 1431655768
                            i32.xor
                            i32.store offset=3212
                            i32.const 0
                            i32.const 0
                            i32.store offset=3232
                            i32.const 0
                            i32.const 0
                            i32.store offset=3184
                            i32.const 65536
                            local.set 3
                          end
                          i32.const 0
                          local.set 4
                          block ;; label = @12
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
                            br_if 0 (;@12;)
                            i32.const 0
                            i32.const 48
                            i32.store offset=2736
                            br 11 (;@1;)
                          end
                          block ;; label = @12
                            i32.const 0
                            i32.load offset=3180
                            local.tee 4
                            i32.eqz
                            br_if 0 (;@12;)
                            block ;; label = @13
                              i32.const 0
                              i32.load offset=3172
                              local.tee 3
                              local.get 9
                              i32.add
                              local.tee 11
                              local.get 3
                              i32.le_u
                              br_if 0 (;@13;)
                              local.get 11
                              local.get 4
                              i32.le_u
                              br_if 1 (;@12;)
                            end
                            i32.const 0
                            local.set 4
                            i32.const 0
                            i32.const 48
                            i32.store offset=2736
                            br 11 (;@1;)
                          end
                          i32.const 0
                          i32.load8_u offset=3184
                          i32.const 4
                          i32.and
                          br_if 5 (;@6;)
                          block ;; label = @12
                            block ;; label = @13
                              block ;; label = @14
                                local.get 2
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 3188
                                local.set 4
                                loop ;; label = @15
                                  block ;; label = @16
                                    local.get 4
                                    i32.load
                                    local.tee 3
                                    local.get 2
                                    i32.gt_u
                                    br_if 0 (;@16;)
                                    local.get 3
                                    local.get 4
                                    i32.load offset=4
                                    i32.add
                                    local.get 2
                                    i32.gt_u
                                    br_if 3 (;@13;)
                                  end
                                  local.get 4
                                  i32.load offset=8
                                  local.tee 4
                                  br_if 0 (;@15;)
                                end
                              end
                              i32.const 0
                              call $sbrk
                              local.tee 0
                              i32.const -1
                              i32.eq
                              br_if 6 (;@7;)
                              local.get 9
                              local.set 6
                              block ;; label = @14
                                i32.const 0
                                i32.load offset=3216
                                local.tee 4
                                i32.const -1
                                i32.add
                                local.tee 3
                                local.get 0
                                i32.and
                                i32.eqz
                                br_if 0 (;@14;)
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
                              br_if 6 (;@7;)
                              local.get 6
                              i32.const 2147483646
                              i32.gt_u
                              br_if 6 (;@7;)
                              block ;; label = @14
                                i32.const 0
                                i32.load offset=3180
                                local.tee 4
                                i32.eqz
                                br_if 0 (;@14;)
                                i32.const 0
                                i32.load offset=3172
                                local.tee 3
                                local.get 6
                                i32.add
                                local.tee 5
                                local.get 3
                                i32.le_u
                                br_if 7 (;@7;)
                                local.get 5
                                local.get 4
                                i32.gt_u
                                br_if 7 (;@7;)
                              end
                              local.get 6
                              call $sbrk
                              local.tee 4
                              local.get 0
                              i32.ne
                              br_if 1 (;@12;)
                              br 8 (;@5;)
                            end
                            local.get 0
                            local.get 5
                            i32.sub
                            local.get 6
                            i32.and
                            local.tee 6
                            i32.const 2147483646
                            i32.gt_u
                            br_if 5 (;@7;)
                            local.get 6
                            call $sbrk
                            local.tee 0
                            local.get 4
                            i32.load
                            local.get 4
                            i32.load offset=4
                            i32.add
                            i32.eq
                            br_if 4 (;@8;)
                            local.get 0
                            local.set 4
                          end
                          block ;; label = @12
                            local.get 6
                            local.get 7
                            i32.const 72
                            i32.add
                            i32.ge_u
                            br_if 0 (;@12;)
                            local.get 4
                            i32.const -1
                            i32.eq
                            br_if 0 (;@12;)
                            block ;; label = @13
                              local.get 8
                              local.get 6
                              i32.sub
                              i32.const 0
                              i32.load offset=3220
                              local.tee 3
                              i32.add
                              i32.const 0
                              local.get 3
                              i32.sub
                              i32.and
                              local.tee 3
                              i32.const 2147483646
                              i32.le_u
                              br_if 0 (;@13;)
                              local.get 4
                              local.set 0
                              br 8 (;@5;)
                            end
                            block ;; label = @13
                              local.get 3
                              call $sbrk
                              i32.const -1
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 3
                              local.get 6
                              i32.add
                              local.set 6
                              local.get 4
                              local.set 0
                              br 8 (;@5;)
                            end
                            i32.const 0
                            local.get 6
                            i32.sub
                            call $sbrk
                            drop
                            br 5 (;@7;)
                          end
                          local.get 4
                          local.set 0
                          local.get 4
                          i32.const -1
                          i32.ne
                          br_if 6 (;@5;)
                          br 4 (;@7;)
                        end
                        unreachable
                        unreachable
                      end
                      i32.const 0
                      local.set 9
                      br 7 (;@2;)
                    end
                    i32.const 0
                    local.set 0
                    br 5 (;@3;)
                  end
                  local.get 0
                  i32.const -1
                  i32.ne
                  br_if 2 (;@5;)
                end
                i32.const 0
                i32.const 0
                i32.load offset=3184
                i32.const 4
                i32.or
                i32.store offset=3184
              end
              local.get 9
              i32.const 2147483646
              i32.gt_u
              br_if 1 (;@4;)
              local.get 9
              call $sbrk
              local.set 0
              i32.const 0
              call $sbrk
              local.set 4
              local.get 0
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 4
              i32.const -1
              i32.eq
              br_if 1 (;@4;)
              local.get 0
              local.get 4
              i32.ge_u
              br_if 1 (;@4;)
              local.get 4
              local.get 0
              i32.sub
              local.tee 6
              local.get 7
              i32.const 56
              i32.add
              i32.le_u
              br_if 1 (;@4;)
            end
            i32.const 0
            i32.const 0
            i32.load offset=3172
            local.get 6
            i32.add
            local.tee 4
            i32.store offset=3172
            block ;; label = @5
              local.get 4
              i32.const 0
              i32.load offset=3176
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.get 4
              i32.store offset=3176
            end
            block ;; label = @5
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    i32.const 0
                    i32.load offset=2764
                    local.tee 3
                    i32.eqz
                    br_if 0 (;@8;)
                    i32.const 3188
                    local.set 4
                    loop ;; label = @9
                      local.get 0
                      local.get 4
                      i32.load
                      local.tee 5
                      local.get 4
                      i32.load offset=4
                      local.tee 9
                      i32.add
                      i32.eq
                      br_if 2 (;@7;)
                      local.get 4
                      i32.load offset=8
                      local.tee 4
                      br_if 0 (;@9;)
                      br 3 (;@6;)
                    end
                  end
                  block ;; label = @8
                    block ;; label = @9
                      i32.const 0
                      i32.load offset=2756
                      local.tee 4
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 0
                      local.get 4
                      i32.ge_u
                      br_if 1 (;@8;)
                    end
                    i32.const 0
                    local.get 0
                    i32.store offset=2756
                  end
                  i32.const 0
                  local.set 4
                  i32.const 0
                  local.get 6
                  i32.store offset=3192
                  i32.const 0
                  local.get 0
                  i32.store offset=3188
                  i32.const 0
                  i32.const -1
                  i32.store offset=2772
                  i32.const 0
                  i32.const 0
                  i32.load offset=3212
                  i32.store offset=2776
                  i32.const 0
                  i32.const 0
                  i32.store offset=3200
                  loop ;; label = @8
                    local.get 4
                    i32.const 2800
                    i32.add
                    local.get 4
                    i32.const 2788
                    i32.add
                    local.tee 3
                    i32.store
                    local.get 3
                    local.get 4
                    i32.const 2780
                    i32.add
                    local.tee 5
                    i32.store
                    local.get 4
                    i32.const 2792
                    i32.add
                    local.get 5
                    i32.store
                    local.get 4
                    i32.const 2808
                    i32.add
                    local.get 4
                    i32.const 2796
                    i32.add
                    local.tee 5
                    i32.store
                    local.get 5
                    local.get 3
                    i32.store
                    local.get 4
                    i32.const 2816
                    i32.add
                    local.get 4
                    i32.const 2804
                    i32.add
                    local.tee 3
                    i32.store
                    local.get 3
                    local.get 5
                    i32.store
                    local.get 4
                    i32.const 2812
                    i32.add
                    local.get 3
                    i32.store
                    local.get 4
                    i32.const 32
                    i32.add
                    local.tee 4
                    i32.const 256
                    i32.ne
                    br_if 0 (;@8;)
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
                  i32.load offset=3228
                  i32.store offset=2768
                  i32.const 0
                  local.get 4
                  i32.store offset=2752
                  i32.const 0
                  local.get 3
                  i32.store offset=2764
                  local.get 0
                  local.get 5
                  i32.add
                  i32.const 56
                  i32.store offset=4
                  br 2 (;@5;)
                end
                local.get 3
                local.get 0
                i32.ge_u
                br_if 0 (;@6;)
                local.get 3
                local.get 5
                i32.lt_u
                br_if 0 (;@6;)
                local.get 4
                i32.load offset=12
                i32.const 8
                i32.and
                br_if 0 (;@6;)
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
                i32.load offset=2752
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
                i32.load offset=3228
                i32.store offset=2768
                i32.const 0
                local.get 5
                i32.store offset=2752
                i32.const 0
                local.get 0
                i32.store offset=2764
                local.get 3
                local.get 2
                i32.add
                i32.const 56
                i32.store offset=4
                br 1 (;@5;)
              end
              block ;; label = @6
                local.get 0
                i32.const 0
                i32.load offset=2756
                i32.ge_u
                br_if 0 (;@6;)
                i32.const 0
                local.get 0
                i32.store offset=2756
              end
              local.get 0
              local.get 6
              i32.add
              local.set 5
              i32.const 3188
              local.set 4
              block ;; label = @6
                block ;; label = @7
                  block ;; label = @8
                    block ;; label = @9
                      loop ;; label = @10
                        local.get 4
                        i32.load
                        local.get 5
                        i32.eq
                        br_if 1 (;@9;)
                        local.get 4
                        i32.load offset=8
                        local.tee 4
                        br_if 0 (;@10;)
                        br 2 (;@8;)
                      end
                    end
                    local.get 4
                    i32.load8_u offset=12
                    i32.const 8
                    i32.and
                    i32.eqz
                    br_if 1 (;@7;)
                  end
                  i32.const 3188
                  local.set 4
                  block ;; label = @8
                    loop ;; label = @9
                      block ;; label = @10
                        local.get 4
                        i32.load
                        local.tee 5
                        local.get 3
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 5
                        local.get 4
                        i32.load offset=4
                        i32.add
                        local.tee 5
                        local.get 3
                        i32.gt_u
                        br_if 2 (;@8;)
                      end
                      local.get 4
                      i32.load offset=8
                      local.set 4
                      br 0 (;@9;)
                    end
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
                  i32.load offset=3228
                  i32.store offset=2768
                  i32.const 0
                  local.get 4
                  i32.store offset=2752
                  i32.const 0
                  local.get 2
                  i32.store offset=2764
                  local.get 9
                  i32.const 16
                  i32.add
                  i32.const 0
                  i64.load offset=3196 align=4
                  i64.store align=4
                  local.get 9
                  i32.const 0
                  i64.load offset=3188 align=4
                  i64.store offset=8 align=4
                  i32.const 0
                  local.get 9
                  i32.const 8
                  i32.add
                  i32.store offset=3196
                  i32.const 0
                  local.get 6
                  i32.store offset=3192
                  i32.const 0
                  local.get 0
                  i32.store offset=3188
                  i32.const 0
                  i32.const 0
                  i32.store offset=3200
                  local.get 9
                  i32.const 36
                  i32.add
                  local.set 4
                  loop ;; label = @8
                    local.get 4
                    i32.const 7
                    i32.store
                    local.get 4
                    i32.const 4
                    i32.add
                    local.tee 4
                    local.get 5
                    i32.lt_u
                    br_if 0 (;@8;)
                  end
                  local.get 9
                  local.get 3
                  i32.eq
                  br_if 2 (;@5;)
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
                  block ;; label = @8
                    local.get 0
                    i32.const 255
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const -8
                    i32.and
                    i32.const 2780
                    i32.add
                    local.set 4
                    block ;; label = @9
                      block ;; label = @10
                        i32.const 0
                        i32.load offset=2740
                        local.tee 5
                        i32.const 1
                        local.get 0
                        i32.const 3
                        i32.shr_u
                        i32.shl
                        local.tee 0
                        i32.and
                        br_if 0 (;@10;)
                        i32.const 0
                        local.get 5
                        local.get 0
                        i32.or
                        i32.store offset=2740
                        local.get 4
                        local.set 5
                        br 1 (;@9;)
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
                    br 3 (;@5;)
                  end
                  i32.const 31
                  local.set 4
                  block ;; label = @8
                    local.get 0
                    i32.const 16777215
                    i32.gt_u
                    br_if 0 (;@8;)
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
                  i32.const 3044
                  i32.add
                  local.set 5
                  block ;; label = @8
                    i32.const 0
                    i32.load offset=2744
                    local.tee 9
                    i32.const 1
                    local.get 4
                    i32.shl
                    local.tee 6
                    i32.and
                    br_if 0 (;@8;)
                    local.get 5
                    local.get 3
                    i32.store
                    i32.const 0
                    local.get 9
                    local.get 6
                    i32.or
                    i32.store offset=2744
                    local.get 3
                    local.get 5
                    i32.store offset=24
                    local.get 3
                    local.get 3
                    i32.store offset=8
                    local.get 3
                    local.get 3
                    i32.store offset=12
                    br 3 (;@5;)
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
                  loop ;; label = @8
                    local.get 9
                    local.tee 5
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get 0
                    i32.eq
                    br_if 2 (;@6;)
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
                    br_if 0 (;@8;)
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
                  br 2 (;@5;)
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
                local.get 5
                local.get 7
                call $prepend_alloc
                local.set 4
                br 5 (;@1;)
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
            i32.load offset=2752
            local.tee 4
            local.get 7
            i32.le_u
            br_if 0 (;@4;)
            i32.const 0
            i32.load offset=2764
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
            i32.store offset=2752
            i32.const 0
            local.get 5
            i32.store offset=2764
            local.get 3
            local.get 7
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 3
            i32.const 8
            i32.add
            local.set 4
            br 3 (;@1;)
          end
          i32.const 0
          local.set 4
          i32.const 0
          i32.const 48
          i32.store offset=2736
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
              i32.const 3044
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
              i32.store offset=2744
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
            i32.or
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
            i32.const 2780
            i32.add
            local.set 4
            block ;; label = @5
              block ;; label = @6
                i32.const 0
                i32.load offset=2740
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
                i32.store offset=2740
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
          i32.const 3044
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
            i32.store offset=2744
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
            i32.const 3044
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
            i32.store offset=2744
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
          i32.or
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
          i32.const 2780
          i32.add
          local.set 7
          i32.const 0
          i32.load offset=2760
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
              i32.store offset=2740
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
        i32.store offset=2760
        i32.const 0
        local.get 3
        i32.store offset=2748
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
  (func $prepend_alloc (;42;) (type 6) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.const -8
    local.get 0
    i32.sub
    i32.const 15
    i32.and
    i32.add
    local.tee 3
    local.get 2
    i32.const 3
    i32.or
    i32.store offset=4
    local.get 1
    i32.const -8
    local.get 1
    i32.sub
    i32.const 15
    i32.and
    i32.add
    local.tee 4
    local.get 3
    local.get 2
    i32.add
    local.tee 5
    i32.sub
    local.set 2
    block ;; label = @1
      block ;; label = @2
        local.get 4
        i32.const 0
        i32.load offset=2764
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.get 5
        i32.store offset=2764
        i32.const 0
        i32.const 0
        i32.load offset=2752
        local.get 2
        i32.add
        local.tee 2
        i32.store offset=2752
        local.get 5
        local.get 2
        i32.const 1
        i32.or
        i32.store offset=4
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 4
        i32.const 0
        i32.load offset=2760
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.get 5
        i32.store offset=2760
        i32.const 0
        i32.const 0
        i32.load offset=2748
        local.get 2
        i32.add
        local.tee 2
        i32.store offset=2748
        local.get 5
        local.get 2
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 5
        local.get 2
        i32.add
        local.get 2
        i32.store
        br 1 (;@1;)
      end
      block ;; label = @2
        local.get 4
        i32.load offset=4
        local.tee 0
        i32.const 3
        i32.and
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 0
        i32.const -8
        i32.and
        local.set 6
        block ;; label = @3
          block ;; label = @4
            local.get 0
            i32.const 255
            i32.gt_u
            br_if 0 (;@4;)
            local.get 4
            i32.load offset=8
            local.tee 1
            local.get 0
            i32.const 3
            i32.shr_u
            local.tee 7
            i32.const 3
            i32.shl
            i32.const 2780
            i32.add
            local.tee 8
            i32.eq
            drop
            block ;; label = @5
              local.get 4
              i32.load offset=12
              local.tee 0
              local.get 1
              i32.ne
              br_if 0 (;@5;)
              i32.const 0
              i32.const 0
              i32.load offset=2740
              i32.const -2
              local.get 7
              i32.rotl
              i32.and
              i32.store offset=2740
              br 2 (;@3;)
            end
            local.get 0
            local.get 8
            i32.eq
            drop
            local.get 0
            local.get 1
            i32.store offset=8
            local.get 1
            local.get 0
            i32.store offset=12
            br 1 (;@3;)
          end
          local.get 4
          i32.load offset=24
          local.set 9
          block ;; label = @4
            block ;; label = @5
              local.get 4
              i32.load offset=12
              local.tee 8
              local.get 4
              i32.eq
              br_if 0 (;@5;)
              local.get 4
              i32.load offset=8
              local.tee 0
              i32.const 0
              i32.load offset=2756
              i32.lt_u
              drop
              local.get 8
              local.get 0
              i32.store offset=8
              local.get 0
              local.get 8
              i32.store offset=12
              br 1 (;@4;)
            end
            block ;; label = @5
              block ;; label = @6
                local.get 4
                i32.const 20
                i32.add
                local.tee 1
                i32.load
                local.tee 0
                br_if 0 (;@6;)
                local.get 4
                i32.load offset=16
                local.tee 0
                i32.eqz
                br_if 1 (;@5;)
                local.get 4
                i32.const 16
                i32.add
                local.set 1
              end
              loop ;; label = @6
                local.get 1
                local.set 7
                local.get 0
                local.tee 8
                i32.const 20
                i32.add
                local.tee 1
                i32.load
                local.tee 0
                br_if 0 (;@6;)
                local.get 8
                i32.const 16
                i32.add
                local.set 1
                local.get 8
                i32.load offset=16
                local.tee 0
                br_if 0 (;@6;)
              end
              local.get 7
              i32.const 0
              i32.store
              br 1 (;@4;)
            end
            i32.const 0
            local.set 8
          end
          local.get 9
          i32.eqz
          br_if 0 (;@3;)
          block ;; label = @4
            block ;; label = @5
              local.get 4
              local.get 4
              i32.load offset=28
              local.tee 1
              i32.const 2
              i32.shl
              i32.const 3044
              i32.add
              local.tee 0
              i32.load
              i32.ne
              br_if 0 (;@5;)
              local.get 0
              local.get 8
              i32.store
              local.get 8
              br_if 1 (;@4;)
              i32.const 0
              i32.const 0
              i32.load offset=2744
              i32.const -2
              local.get 1
              i32.rotl
              i32.and
              i32.store offset=2744
              br 2 (;@3;)
            end
            local.get 9
            i32.const 16
            i32.const 20
            local.get 9
            i32.load offset=16
            local.get 4
            i32.eq
            select
            i32.add
            local.get 8
            i32.store
            local.get 8
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 8
          local.get 9
          i32.store offset=24
          block ;; label = @4
            local.get 4
            i32.load offset=16
            local.tee 0
            i32.eqz
            br_if 0 (;@4;)
            local.get 8
            local.get 0
            i32.store offset=16
            local.get 0
            local.get 8
            i32.store offset=24
          end
          local.get 4
          i32.const 20
          i32.add
          i32.load
          local.tee 0
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          i32.const 20
          i32.add
          local.get 0
          i32.store
          local.get 0
          local.get 8
          i32.store offset=24
        end
        local.get 6
        local.get 2
        i32.add
        local.set 2
        local.get 4
        local.get 6
        i32.add
        local.tee 4
        i32.load offset=4
        local.set 0
      end
      local.get 4
      local.get 0
      i32.const -2
      i32.and
      i32.store offset=4
      local.get 5
      local.get 2
      i32.add
      local.get 2
      i32.store
      local.get 5
      local.get 2
      i32.const 1
      i32.or
      i32.store offset=4
      block ;; label = @2
        local.get 2
        i32.const 255
        i32.gt_u
        br_if 0 (;@2;)
        local.get 2
        i32.const -8
        i32.and
        i32.const 2780
        i32.add
        local.set 0
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=2740
            local.tee 1
            i32.const 1
            local.get 2
            i32.const 3
            i32.shr_u
            i32.shl
            local.tee 2
            i32.and
            br_if 0 (;@4;)
            i32.const 0
            local.get 1
            local.get 2
            i32.or
            i32.store offset=2740
            local.get 0
            local.set 2
            br 1 (;@3;)
          end
          local.get 0
          i32.load offset=8
          local.set 2
        end
        local.get 2
        local.get 5
        i32.store offset=12
        local.get 0
        local.get 5
        i32.store offset=8
        local.get 5
        local.get 0
        i32.store offset=12
        local.get 5
        local.get 2
        i32.store offset=8
        br 1 (;@1;)
      end
      i32.const 31
      local.set 0
      block ;; label = @2
        local.get 2
        i32.const 16777215
        i32.gt_u
        br_if 0 (;@2;)
        local.get 2
        i32.const 38
        local.get 2
        i32.const 8
        i32.shr_u
        i32.clz
        local.tee 0
        i32.sub
        i32.shr_u
        i32.const 1
        i32.and
        local.get 0
        i32.const 1
        i32.shl
        i32.sub
        i32.const 62
        i32.add
        local.set 0
      end
      local.get 5
      local.get 0
      i32.store offset=28
      local.get 5
      i64.const 0
      i64.store offset=16 align=4
      local.get 0
      i32.const 2
      i32.shl
      i32.const 3044
      i32.add
      local.set 1
      block ;; label = @2
        i32.const 0
        i32.load offset=2744
        local.tee 8
        i32.const 1
        local.get 0
        i32.shl
        local.tee 4
        i32.and
        br_if 0 (;@2;)
        local.get 1
        local.get 5
        i32.store
        i32.const 0
        local.get 8
        local.get 4
        i32.or
        i32.store offset=2744
        local.get 5
        local.get 1
        i32.store offset=24
        local.get 5
        local.get 5
        i32.store offset=8
        local.get 5
        local.get 5
        i32.store offset=12
        br 1 (;@1;)
      end
      local.get 2
      i32.const 0
      i32.const 25
      local.get 0
      i32.const 1
      i32.shr_u
      i32.sub
      local.get 0
      i32.const 31
      i32.eq
      select
      i32.shl
      local.set 0
      local.get 1
      i32.load
      local.set 8
      block ;; label = @2
        loop ;; label = @3
          local.get 8
          local.tee 1
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 2
          i32.eq
          br_if 1 (;@2;)
          local.get 0
          i32.const 29
          i32.shr_u
          local.set 8
          local.get 0
          i32.const 1
          i32.shl
          local.set 0
          local.get 1
          local.get 8
          i32.const 4
          i32.and
          i32.add
          i32.const 16
          i32.add
          local.tee 4
          i32.load
          local.tee 8
          br_if 0 (;@3;)
        end
        local.get 4
        local.get 5
        i32.store
        local.get 5
        local.get 1
        i32.store offset=24
        local.get 5
        local.get 5
        i32.store offset=12
        local.get 5
        local.get 5
        i32.store offset=8
        br 1 (;@1;)
      end
      local.get 1
      i32.load offset=8
      local.tee 2
      local.get 5
      i32.store offset=12
      local.get 1
      local.get 5
      i32.store offset=8
      local.get 5
      i32.const 0
      i32.store offset=24
      local.get 5
      local.get 1
      i32.store offset=12
      local.get 5
      local.get 2
      i32.store offset=8
    end
    local.get 3
    i32.const 8
    i32.add
  )
  (func $free (;43;) (type 3) (param i32)
    local.get 0
    call $dlfree
  )
  (func $dlfree (;44;) (type 3) (param i32)
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
        i32.const 2
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
        i32.load offset=2756
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
              i32.load offset=2760
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
                i32.const 2780
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
                  i32.load offset=2740
                  i32.const -2
                  local.get 5
                  i32.rotl
                  i32.and
                  i32.store offset=2740
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
            i32.store offset=2748
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
            i32.const 3044
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
            i32.load offset=2744
            i32.const -2
            local.get 4
            i32.rotl
            i32.and
            i32.store offset=2744
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
                  i32.load offset=2764
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 1
                  i32.store offset=2764
                  i32.const 0
                  i32.const 0
                  i32.load offset=2752
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store offset=2752
                  local.get 1
                  local.get 0
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 1
                  i32.const 0
                  i32.load offset=2760
                  i32.ne
                  br_if 6 (;@1;)
                  i32.const 0
                  i32.const 0
                  i32.store offset=2748
                  i32.const 0
                  i32.const 0
                  i32.store offset=2760
                  return
                end
                block ;; label = @7
                  local.get 3
                  i32.const 0
                  i32.load offset=2760
                  i32.ne
                  br_if 0 (;@7;)
                  i32.const 0
                  local.get 1
                  i32.store offset=2760
                  i32.const 0
                  i32.const 0
                  i32.load offset=2748
                  local.get 0
                  i32.add
                  local.tee 0
                  i32.store offset=2748
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
                  i32.const 2780
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
                    i32.load offset=2740
                    i32.const -2
                    local.get 5
                    i32.rotl
                    i32.and
                    i32.store offset=2740
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
                  i32.load offset=2756
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
              i32.const 3044
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
              i32.load offset=2744
              i32.const -2
              local.get 4
              i32.rotl
              i32.and
              i32.store offset=2744
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
        i32.load offset=2760
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.get 0
        i32.store offset=2748
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
        i32.const 2780
        i32.add
        local.set 2
        block ;; label = @3
          block ;; label = @4
            i32.const 0
            i32.load offset=2740
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
            i32.store offset=2740
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
      i32.const 3044
      i32.add
      local.set 4
      block ;; label = @2
        block ;; label = @3
          i32.const 0
          i32.load offset=2744
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
          i32.store offset=2744
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
      i32.load offset=2772
      i32.const -1
      i32.add
      local.tee 1
      i32.const -1
      local.get 1
      select
      i32.store offset=2772
    end
  )
  (table (;0;) 1 1 funcref)
  (memory (;0;) 2)
  (global $__stack_pointer (;0;) (mut i32) i32.const 68784)
  (global $GOT.data.internal.__memory_base (;1;) i32 i32.const 0)
  (export "memory" (memory 0))
  (export "_initialize" (func $_initialize))
  (export "parserInit" (func $blep_parser_init))
  (export "parserRun" (func $blep_parser_run))
  (export "malloc" (func $malloc))
  (export "free" (func $free))
  (data $.rodata (;0;) (i32.const 1024) "token init\00token peek\00got bad td->end\0a\006666\0a\00\00\00\00\00\00\00\00\00\00\00\00\00)()))\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00)!*--!\22*\07\09\22!'!%$..........\04/\22!#&\00--------------------------\06-\09!-+,,,,,,,-,--,-,,,-,,,,,,-,-\05\22\09!\00--------------------------------------------------------------------------------------------------------------------------------\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\01\01\01\01\01\01\00\00\00\00\00\00\00\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\02\00\00\01\00\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\00\00\00\00\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\01\00\00\00")
  (@producers
    (language "C11" "")
    (processed-by "clang" "18.1.2-wasi-sdk (https://github.com/llvm/llvm-project 26a1d6601d727a96f4301d0d8647b5a42760ae0c)")
  )
)