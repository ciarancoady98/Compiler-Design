# Compiler-Design

flex "filename.l"
bison -d "filename.y"
gcc lex.yy.c "filename".tab.c -lfl or gcc -o "outputname" lex.yy.c "filename".tab.c -lfl 