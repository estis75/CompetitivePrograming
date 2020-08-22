#!/bin/bash

if [ $# -ne 1 ]; then
  echo "designate a file name"
  exit 1;
fi

if [ "$1" == "init" ]; then
  rm testCase/*
  for i in {1..10}; do
    touch testCase/`printf %02d $i`.txt
  done
  exit 0;
fi
  
if [ "$1" == "clear" ]; then
  if [ ! `find -name "*_out.cpp"` ]; then
    exit 0
  fi
  rm *_out.cpp
  exit 0;
fi
  

if [ ! -e $1 ]; then
  echo "designate a file name"
  exit 1;
fi
output=${1/.cpp/}_out.cpp
if [ -e $output ]; then
  rm $output
fi

g++ -O3 $1
if [ $? -ne 0 ]; then
  exit 1;
fi
for i in `ls testCase/*.txt`; do
  if [ "`cat $i`" == "" ];then
    continue;
  fi
  echo "input:"
  cat $i
  echo ""
  echo -e "output:\n"
  ./a.out < $i
  echo -e "\n"
done

cp $1 temp.cpp

touch $output
cat Templates/libraries.h | head -2 >> $output
for i in `cat Templates/libraries.h | grep "include\".*\""`; do
  i=`echo ${i/\#include/} | sed -e 's/\"//g' `
  cat Templates/$i | sed -e '/using/d' | sed -e '/include/d' >> $output
done
sed -e '/\#include\".*\"/d' Templates/libraries.h | tail -n +3 >> $output
sed '1,3d' temp.cpp >> $output

rm temp.cpp a.out
