#!/usr/bin/env bats
load test_helper
IT="README's install"

DOWNLOAD_COMMAND="wget https://goo.gl/kYnxxZ -O ENV.sh"  # Sync with README.md

setup() {
  enter_into_tmpdir
}

teardown() {
    rm -rf $WORKDIR
}


@test "$IT should download ENV.sh" {
  run $DOWNLOAD_COMMAND

  assert_success
  assert_file_exists ENV.sh
}


@test "$IT should not download 'kYnxxZ'" {
  run $DOWNLOAD_COMMAND

  ! assert_file_exists 'kYnxxZ'
}
