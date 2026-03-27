#!/usr/bin/env bats

load helper

setup() {
  setup_dirs
  coproc stunnel { exec stunnel etc/default/stunnel.conf > $BATS_TEST_OWN_LOGDIR/stunnel.log 2>&1; }
  
  local timeout=10
  local waited=0
  while [[ $waited -lt $timeout ]]; do
    if grep -qE "(Configuration successful|Service ready|Ready)" "$BATS_TEST_OWN_LOGDIR/stunnel.log" 2>/dev/null; then
      break
    fi
    sleep 0.5
    waited=$((waited + 1))
  done
  if [[ $waited -ge $timeout ]]; then
    echo "ERROR: stunnel failed to start within timeout" >&2
    return 1
  fi
}

teardown() {
  local pid=$stunnel_PID
  if [[ $pid ]]; then
    kill -15 $pid || :
    wait $pid || :
  fi
}

@test "run ftpsync using ssl transport" {
  run_ftpsync sync:archive:ssl
  [[ $status -eq 0 ]]
}
