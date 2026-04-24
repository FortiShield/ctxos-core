#!/usr/bin/env bats

load 'helper.bash'

setup() {
  setup_dirs
}

@test "ctx-dev-setup runs without syntax errors" {
  run bash -n ./bin/ctx-dev-setup
  [ "$status" -eq 0 ]
}
