#!/bin/sh

FILES=$(git ls-files --others *.jl)

for file in $FILES
do
    git add $file;
    git commit -m "Problem $(basename $file .jl)";
done;