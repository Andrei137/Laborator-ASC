.data
    x: .long 13
    y: .long 25
.text
.globl main
main:
    movl x, %eax
    movl y, %ebx
    movl %ebx, x
    movl %eax, y

exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80
