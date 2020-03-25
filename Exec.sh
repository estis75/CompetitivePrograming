#!/bin/bash

if [ -e output.cpp ]; then
  rm output.cpp
fi
g++ -O3 `basename \`pwd\``.cpp
if [ $? -ne 0 ]; then
  exit 1;
fi
for i in `ls TestCase/Testcase*.txt`; do
  cat $i
  ./a.out < $i
  echo -e "\n"
done

cp `basename \`pwd\``.cpp temp.cpp

touch output.cpp
for i in `ls Templates/`; do
  cat Templates/$i | grep -v "include|define">> output.cpp
done
sed '1,3d' temp.cpp >> output.cpp

rm temp.cpp
