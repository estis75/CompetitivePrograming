#!/bin/bash

# AtCoderディレクトリ上で動く
if [ $# -ne 1 ]; then
  echo "designate a title"
  exit 1;
fi

mkdir $1
cd $1

for i in {A..F}; do
  #mkdir $i
  #cd $i
  if [ -e ../default/$i.cpp ]; then
    cp ../default/$i.cpp . 
  else
    touch $i.cpp
  fi
  
  #cd ..;
done
cp -p ../default/Exec.sh .
cp -p ../default/unite.sh .
cp -p ../default/Makefile .
# cp -r ../default/Templates .
cp -r ../default/.vscode .

mkdir testCase
./Exec.sh init
# for i in {1..10}; do
  # touch testCase/`printf %02d $i`.txt
# done

code .
