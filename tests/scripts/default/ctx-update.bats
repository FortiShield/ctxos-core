#!/usr/bin/env bats

load 'helper.bash'

setup() {
  setup_dirs
}

@test "ctx-update runs without syntax errors" {
  run bash -n ./bin/ctx-update
  [ "$status" -eq 0 ]
}

@test "ctx-update handles no package manager" {
  # Create a temp dir with no package managers
  run env -i PATH=/usr/bin:/bin HOME="$HOME" ./bin/ctx-update
  [ "$status" -eq 1 ]
}
