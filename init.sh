#!/bin/bash

if [ $# -ne 1 ]; then
  echo "designate a directory or use \"--help\" to get usage"
  exit 1;
elif [ "$1" = "--help" ]; then
  cat "help.txt"
  exit 1;
fi

mkdir $1/AtCoder
if [ $? -eq 0 ]; then
  echo Succeeded
  cp CC.sh $1/AtCoder
  chmod 755 $1/AtCoder/CC.sh
  mkdir $1/AtCoder/default
  mkdir $1/AtCoder/default/Templates
  for i in {A..F}; do
    echo -e "#include<bits/stdc++.h>\n#include\"Templates/libraries.h\"" > $1/AtCoder/default/$i.cpp
  done
#  cp Clear.sh $1/AtCoder/default
#  chmod 755 $1/AtCoder/default/Clear.sh
  cp Exec.sh $1/AtCoder/default
  chmod 755 $1/AtCoder/default/Exec.sh
  exit 1;
else 
  echo Something wrong
  exit 0;
fi
