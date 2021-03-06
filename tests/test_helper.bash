#!/usr/bin/env bats

BASEDIR="$BATS_TEST_DIRNAME/.."


enter_into_tmpdir() {
  WORKDIR=`mktemp -d`  # this var is widely used
  cd $WORKDIR
}


inverted_echo() {
  INVERT='\e[7m'
  echo -e "${INVERT}" "$@"
}


assert_success() {
  if [ "$status" -ne 0 ]; then
    inverted_echo "command failed with exit status $status"
    return 1
  fi
}


assert_output() {
  expected=$1
  actual=$output
  if [ "$actual" != "$expected" ]; then
    inverted_echo "'$actual' not equal to '$expected'"
    return 1
  fi
}


assert_file_exists() {
  file_=$1
  if [[ ! -f $file_ ]]; then
    inverted_echo "file: '$file_' does not exist"
    return 1
  fi
}


assert_fail() {
  SUCCESS=0
  if [ "$status" -eq $SUCCESS ]; then
    inverted_echo "command successed, but should fail"
    return 1
  fi
}


assert_output_contains() {
  expected=$1
  actual=$output
  if [[ "$actual" != *"$expected"* ]]; then
    inverted_echo "'$actual' does not contain '$expected'"
    return 1
  fi
}


assert_equals() {
  actual=$1
  expected=$2
  if [[ "$actual" != "$expected" ]]; then
    inverted_echo "'$actual' not equal to '$expected'"
    return 1
  fi
}


assert_contains() {
  actual=$1
  expected=$2
  if [[ "$actual" != *"$expected"* ]]; then
    inverted_echo "'$actual' does not contain '$expected'"
    return 1
  fi
}
