#!/bin/bash

latest_file_out=`ls -t *_out.cpp | head -1`
pushd .
dir=`pwd`/$latest_file_out
cd ../default/ac-library
python3 expander.py $dir
cp combined.cpp $dir
rm combined.cpp
popd 
