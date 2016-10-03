#!/usr/bin/env bats
load test_helper
IT='ENV'

JDK="$BATS_TEST_DIRNAME/mock_jdk"


@test "$IT should set java" {
  ln -s $JDK jdk

  . $ENV
  run java -version

  rm -f jdk


  assert_success
  assert_output "java mock"
}


@test "$IT should fail without jdk" {
  ENV_stderr_only() {
    . $ENV > /dev/null
  }
  run ENV_stderr_only
  assert_fail
  assert_output_contains "ERROR"
}
