#!/usr/bin/env bats

load 'helper.bash'

setup() {
  setup_dirs
}

@test "ctx-about runs without errors" {
  run ./bin/ctx-about
  [ "$status" -eq 0 ]
}

@test "ctx-about outputs OS information" {
  run ./bin/ctx-about
  [[ "$output" =~ "OS:" ]]
}

@test "ctx-about outputs kernel information" {
  run ./bin/ctx-about
  [[ "$output" =~ "Kernel:" ]]
}
