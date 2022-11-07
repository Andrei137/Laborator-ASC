.data
    isPrime: .asciz "The number is prime\n"
    isNotPrime: .asciz "The number is not prime\n"
    n: .long 947
.text
.globl main
main:
    mov n, %eax
    cmp $0, %eax
    je notPrime

    cmp $1, %eax
    je notPrime

    cmp $2, %eax
    je prime

    mov $0, %edx
    mov $2, %ebx
    div %ebx
    cmp $0, %edx
    je notPrime

    mov $3, %ecx

etloop:
    cmp n, %ecx
    jae prime

    mov n, %eax
    mov %ecx, %ebx
    mov $0, %edx
    div %ebx
    cmp $0, %edx
    je notPrime

    add $2, %ecx
    jmp etloop

notPrime:
    mov $4, %eax
    mov $1, %ebx
    mov $isNotPrime, %ecx
    mov $25, %edx
    int $0x80
    jmp etexit

prime:
    mov $4, %eax
    mov $1, %ebx
    mov $isPrime, %ecx
    mov $21, %edx
    int $0x80

etexit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80