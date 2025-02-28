#!/bin/bash

pwd
ls
if [[ -f src/cat/s21_cat && -f src/grep/s21_grep ]]; then
  echo "copy s21_cat"
  scp src/cat/s21_cat root@172.18.0.3:/usr/local/bin
  echo "copy s21_grep"
  scp src/grep/s21_grep root@172.18.0.3:/usr/local/bin
  echo "give permissions"
  ssh root@172.18.0.3 "chmod +x /usr/local/bin/s21_cat /usr/local/bin/s21_grep"
else
  echo "copy DO"
  scp ../code-samples/DO root@172.18.0.3:/usr/local/bin
  echo "give permissions"
  ssh root@172.18.0.3 "chmod +x /usr/local/bin/DO"
fi

echo "end copy"
