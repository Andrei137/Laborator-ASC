.data
    x: .long 32
    y: .long 3
    cat: .space 4
    prod: .space 4
    rez: .space 4
    pass: .asciz "PASS\n"
    fail: .asciz "FAIL\n"
.text
.globl main
main:
v1:
    mov $0, %edx
    mov x, %eax
    mov $16, %ebx
    idiv %ebx
    mov %eax, cat

    mov y, %eax
    mov $16, %ebx
    mul %ebx
    mov %eax, prod

    mov cat, %eax
    add prod, %eax
    mov %eax, rez

v2:
    mov x, %eax
    shr $4, %eax
    mov %eax, cat

    mov y, %eax
    shl $4, %eax
    mov %eax, prod

    mov cat, %eax
    add prod, %eax

compare:
    cmp rez, %eax
    jne failed

    mov $4, %eax
    mov $1, %ebx
    mov $pass, %ecx
    mov $6, %edx
    int $0x80

    jmp exit

failed:
    mov $4, %eax
    mov $1, %ebx
    mov $fail, %ecx
    mov $6, %edx
    int $0x80

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80