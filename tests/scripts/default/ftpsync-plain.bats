#!/usr/bin/env bats

load helper

setup() {
  setup_dirs
  coproc rsyncd { exec rsync --daemon --no-detach --config etc/default/rsyncd.conf --log-file $BATS_TEST_OWN_LOGDIR/rsyncd.log; }
  
  local timeout=10
  local waited=0
  while [[ $waited -lt $timeout ]]; do
    if grep -q "listening" "$BATS_TEST_OWN_LOGDIR/rsyncd.log" 2>/dev/null || \
       grep -q "daemon started" "$BATS_TEST_OWN_LOGDIR/rsyncd.log" 2>/dev/null; then
      break
    fi
    sleep 0.5
    waited=$((waited + 1))
  done
  if [[ $waited -ge $timeout ]]; then
    echo "ERROR: rsyncd failed to start within timeout" >&2
    return 1
  fi
}

teardown() {
  local pid=$rsyncd_PID
  if [[ $pid ]]; then
    kill -15 $pid || :
    wait $pid || :
  fi
}

@test "run ftpsync using plain transport" {
  run_ftpsync sync:archive:plain
  [[ $status -eq 0 ]]
}
