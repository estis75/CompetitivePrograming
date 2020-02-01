#!/bin/bash

if [ -e output.cpp ]; then
  rm output.cpp
fi
g++ -O3 *.cpp
if [ $? -ne 0 ]; do
  exit 1;
done
for i in `ls TestCase/Testcase*.txt`; do
  cat $i
  echo -e "\n"
  ./a.out < $i
  echo -e "\n\n"
done

cp *.cpp temp.cpp
touch output.cpp 
sed '1d' temp.cpp > temp.cpp
cat temp.cpp 
cat "\n"
sed '1d' temp.cpp > temp.cpp
cat temp.cpp 
cat "\n"

echo "#include<bits/stdc++.h>" > output.cpp
for i in `ls Templates/`; do
  cat Templates/$i | grep -v "include" | grep -v "define">> output.cpp
done
cat temp.cpp >> output.cpp

rm temp.cpp
 
