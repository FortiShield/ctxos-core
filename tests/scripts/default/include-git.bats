#!/usr/bin/env bats

load 'helper.bash'

setup() {
  setup_dirs
}

@test "include-git runs without syntax errors" {
  run bash -n ./bin/include-git
  [ "$status" -eq 0 ]
}

@test "include-git fails with no arguments" {
  run ./bin/include-git
  [ "$status" -ne 0 ]
}
