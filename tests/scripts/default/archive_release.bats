#!/usr/bin/env bats

load 'helper.bash'

setup() {
  setup_dirs
}

@test "archive_release runs without syntax errors" {
  run bash -n ./bin/archive_release
  [ "$status" -eq 0 ]
}

@test "archive_release shows usage with -h" {
  run ./bin/archive_release -h
  [ "$status" -eq 1 ]
  [[ "$output" =~ "Usage:" ]]
}

@test "archive_release shows usage with --help" {
  run ./bin/archive_release --help
  [ "$status" -eq 1 ]
  [[ "$output" =~ "Usage:" ]]
}
