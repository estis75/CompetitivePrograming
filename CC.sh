#!/bin/bash

# AtCoderディレクトリ上で動く
if [ $# -ne 1 ]; then
  echo "designate a title"
  exit 1;
fi

mkdir $1
cd $1

for i in {A..F}; do
  mkdir $i
  cd $i
  if [ -e ../../default/$i.cpp ]; then
    cp ../../default/$i.cpp . 
  else
    touch $i.cpp
  fi
  cp -p ../../default/Exec.sh .
  cp -r ../../default/Templates .
  rm Templates/*.cpp
  
  mkdir TestCase
  touch TestCase/Testcase1.txt
  
  cd ..;
done

code .
