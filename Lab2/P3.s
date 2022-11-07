.data
    a: .long 12
    b: .long 43
    c: .long -31
    min: .space 4
.text
.globl main
main:
    mov a, %eax
    cmp b, %eax
    jle aIsBelow
    mov b, %eax
    cmp c, %eax
    jle bIsLowest
    mov c, %eax
    mov %eax, min
    jmp etexit

aIsBelow:
    cmp c, %eax
    jle aIsLowest
    mov c, %eax
    mov %eax, min
    jmp etexit

aIsLowest:
    mov a, %eax
    mov %eax, min
    jmp etexit

bIsLowest:
    mov b, %eax
    mov %eax, min
    jmp etexit

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80