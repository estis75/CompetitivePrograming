#!/bin/bash

if [ -e output.cpp ]; then
  rm output.cpp
fi
g++ -O3 `basename \`pwd\``.cpp
if [ $? -ne 0 ]; then
  exit 1;
fi
for i in `ls TestCase/Testcase*.txt`; do
  echo "input:"
  cat $i
  echo -e "output:\n"
  ./a.out < $i
  echo -e "\n"
done

cp `basename \`pwd\``.cpp temp.cpp

touch output.cpp
cat Templates/libraries.h | head -2 >> output.cpp
for i in `cat Templates/libraries.h | grep "include\".*\""`; do
  i=`echo ${i/\#include/} | sed -e 's/\"//g' `
  cat Templates/$i | sed -e '/using/d' | sed -e '/include/d' >> output.cpp
done
sed -e '/\#include\".*\"/d' Templates/libraries.h | tail -n +3 >> output.cpp
sed '1,3d' temp.cpp >> output.cpp

rm temp.cpp
