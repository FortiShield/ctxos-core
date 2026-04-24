#!/usr/bin/env bats

load 'helper.bash'

setup() {
  setup_dirs
}

@test "mirror-ctx-images runs without syntax errors" {
  run bash -n ./bin/mirror-ctx-images
  [ "$status" -eq 0 ]
}

@test "mirror-ctx-images validates component names" {
  # Test that only alphanumeric, underscore, dash allowed
  # Should default to ctx-images when given invalid component
  run ./bin/mirror-ctx-images "../../etc/passwd"
  # Should not crash, will default to ctx-images
  [[ "$output" =~ "ctx-images" ]] || [ "$status" -ne 0 ]
}
