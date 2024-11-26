; Ladrido, Eryl & Rodriguez, Erik S16
; Function: imgCvtGrayInttoFloat
; Converts an image from int representation to float representation
; Parameters:
;   intImage   - Pointer to input integer image (32-bit ints)
;   floatImage - Pointer to output float image (32-bit floats)
;   height     - Height of the image
;   width      - Width of the image
section .text
bits 64
default rel
global imgCvtGrayInttoFloat

imgCvtGrayInttoFloat:
    ; Function prologue
    push rbp
    mov rbp, rsp
    push rbx

    ; Load parameters
    mov rdi, rcx    ; intImage pointer
    mov rsi, rdx    ; floatImage pointer
    mov edx, r8d    ; height
    mov ecx, r9d    ; width

    ; Compute total number of pixels
    imul edx, ecx          ; edx = height * width

    ; Load constant 255 into xmm1
    mov eax, 255           ; Load 255 as an integer
    cvtsi2ss xmm1, eax     ; Convert 255 to a single-precision float

    ; Initialize loop index
    xor ebx, ebx           ; Index (i)

convert_loop:
    ; Check if all pixels are processed
    cmp ebx, edx
    jge end_loop           ; Exit loop if i >= total_pixels

    ; Load integer pixel value into xmm0
    mov eax, dword [rdi + rbx * 4] ; Load intImage[i]
    cvtsi2ss xmm0, eax             ; Convert integer to float

    ; Perform division: f = i / 255
    divss xmm0, xmm1               ; Divide xmm0 by 255

    ; Store the result in floatImage
    movss dword [rsi + rbx * 4], xmm0

    ; Increment loop index
    inc ebx
    jmp convert_loop

end_loop:
    ; Function epilogue
    pop rbx
    mov rsp, rbp
    pop rbp
    ret

