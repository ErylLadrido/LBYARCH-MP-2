# LBYARCH-MP-2
Program that converts the grayscale image representation from int based to float based using C and x86 assembly language.

To compile and run the code, run the following commands:
nasm -f win64 ConvertImageAsm.asm
gcc -c ConvertImageC.c -o ConvertImageC.obj -m64
gcc ConvertImageC.obj ConvertImageAsm.obj -o ConvertImageC.exe -m64
ConvertImageC.exe
