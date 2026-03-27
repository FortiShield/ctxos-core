#!/usr/bin/env bats

setup() {
  export TEST_DIR
  TEST_DIR=$(mktemp -d)
  mkdir -p "$TEST_DIR/.ssh"
  echo "" > "$TEST_DIR/.ssh/pushmirror"
  export HOME="$TEST_DIR"
}

teardown() {
  if [[ -n "${TEST_DIR:-}" ]]; then
    rm -rf -- "$TEST_DIR"
  fi
}

@test "run runmirrors" {
  run bin/runmirrors
  [[ $status -eq 0 ]]
  [[ -f log/runmirrors.log ]]
}
