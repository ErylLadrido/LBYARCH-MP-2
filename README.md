# LBYARCH-MP-2
By Eryl Gabriel Ladrido & Erik Andrew Rodriguez S16

Image Conversion Project (C and x86-64 Assembly)

This project demonstrates a program that converts integer pixel values from an image into single-precision floating-point values using a function implemented in x86-64 assembly. The implementation includes performance benchmarking and correctness verification.

Project Structure
- C Program (ConvertImageC.c):
- Collects input, allocates memory, and prints results.
- Calls the assembly function for image conversion.
- Measures execution time for benchmarking.

Assembly Function (ConvertImageAsm.asm):
- Handles conversion of int pixels to float.
- Handles division of input

How to run the Program (in cmd)
- nasm -f win64 ConvertImageAsm.asm
- gcc -c ConvertImageC.c -o ConvertImageC.obj -m64
- gcc ConvertImageC.obj ConvertImageAsm.obj -o ConvertImageC.exe -m64
- ConvertImageC.exe < text.txt

Performance Analysis

Runtimes were measured for different image sizes (height × width):
- 10 × 10
- 100 × 100
- 1000 × 1000

The results for the average Runtimes are as follows:
- Image Size | Avg x86-64 Runtime (ns) | Avg Total C Runtime (ns)
- 10×10 | 400 nanoseconds | 2364600 nanoseconds
- 100×100 | 46060 nanoseconds | 242228120 nanoseconds
- 1000×1000 | 3946720 nanoseconds | 1185548940 nanoseconds

Each size was run 30 times to compute the average execution time. The run time for the assembly code was consistently much smaller as compared to the average run time for the C code, probably because the C program still had to output each number. Additionally, upon running each scenario multiple times, we noticed that there was little to no fluctuation between the runtimes of each program. However, as expected, the runtimes would proportionally increase as we increased the image size. Another interesting observation we encountered was that the Runtime would significantly differ when running the program on another device, highlighting the effects of having slightly different hardware.
