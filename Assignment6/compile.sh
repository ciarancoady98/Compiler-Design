#!/bin/bash

#chmod u+x hello-world
echo "Please enter the name of the project to compile?"
read fileName
echo "Compiling $fileName"
flex $fileName.l
bison -d $fileName.y
gcc -o output lex.yy.c $fileName.tab.c -lfl