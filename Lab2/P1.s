.data
    x: .long 32
    y: .long 3
    cat1: .space 4
    prod1: .space 4
    rez1: .space 4
    cat2: .space 4
    prod2: .space 4
    rez2: .space 4
.text
.globl main
main:
v1:
    mov $0, %edx
    mov x, %eax
    mov $16, %ebx
    idiv %ebx
    mov %eax, cat1

    mov y, %eax
    mov $16, %ebx
    mul %ebx
    mov %eax, prod1

    mov cat1, %eax
    add prod1, %eax
    mov %eax, rez1

v2:
    mov x, %eax
    shr $4, %eax
    mov %eax, cat2

    mov y, %eax
    shl $4, %eax
    mov %eax, prod2

    mov cat2, %eax
    add prod2, %eax
    mov %eax, rez2

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80