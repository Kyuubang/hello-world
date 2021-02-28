; hello-world in assembly by ahmad bayhaqi to learn see asmtutor.com
; you should compile this with 
; nasm -f elf hello-world.asm
; ld -m elf_i386 -o hello-world hello-world.o 
; ./hello-world

SECTION .data 
msg     db  'hello world!', 0Ah     ; we should to count character of this letter
                                    ; we assume 1 bytes/char and he has 7 bytes

SECTION .text
global  _start                      ; there is entry point and must be named as
                                    ; _start if you want to use different entry
                                    ; point we should specify at ld command with -e 
                                    ; ld -e <entry_point> -o out input.o

_start:
    
    mov     edx, 13                 ; number of bytes of strings
    mov     ecx, msg                ; move the memory address to our message 
    mov     ebx, 1                  ; write the STDOUT file
    mov     eax, 4                  ; invoke SYS_WRITE (kernel opcode 4)
    int     80h

    mov     ebx, 0
    mov     eax, 1
    int     80h
