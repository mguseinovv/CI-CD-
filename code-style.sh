#!/bin/bash

if [[ -z "$(command -v clang-format)" ]]; then
  echo "clang-format not installed"
  exit 1
fi

find=$(find src -name "*.c" -o -name "*.h")
if [[ -z "$find" ]]; then
  echo "could not find the files"
  exit 1
fi

codeStyle=$(clang-format -n src/cat/*.c src/cat/*.h src/grep/*.c src/grep/*.h 2>&1)

if [[ -n "$codeStyle" ]]; then
  echo "$codeStyle"
  echo "------------------files are not formatted------------------------"
  exit 1
else
  echo "files are formatted"
fi
