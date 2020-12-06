/*
x86_64 assembly, GNU as syntax, for linux with libc
$ gcc -no-pie -g 6_custom_customs_p1.S
*/
    .data
    .balign 8
table: .fill 4, 8, 0 /* only needs to by 26, but we clear it with 64bit 0s */
fmt: .asciz "%d\n"

    .text
    .globl getchar
    .globl printf

    .type clear_table, @function
clear_table:
    movq $0, (table)
    movq $0, (table + 8)
    movq $0, (table + 16)
    movq $0, (table + 24)
    ret

    .globl main
    .type main, @function
main:
    push %r14
    push %r15
    mov $0, %r14 /* count */
    jmp skip_count
loop0:
    mov $26, %rax
count_loop:
    sub $1, %rax
    xor %rcx, %rcx
    movb table(%rax), %cl
    add %rcx, %r14
    cmp $0, %rax
    jnz count_loop

skip_count:
    mov $0, %r15 /* newline_count */
    call clear_table
loop1:
    call getchar
    cmp $-1, %eax
    jz eof
    cmp $'\n', %rax
    jnz real_char
    add $1, %r15
    cmp $2, %r15
    jz loop0
    jmp loop1
real_char:
    mov $0, %r15 /* newline_count */
    sub $'a', %rax
    movb $1, table(%rax)
    jmp loop1
eof:

    mov $26, %rax
count_loop2:
    sub $1, %rax
    xor %rcx, %rcx
    movb table(%rax), %cl
    add %rcx, %r14
    cmp $0, %rax
    jnz count_loop2

    mov $fmt, %rdi
    mov %r14, %rsi
    mov $0, %al /* see systemv variadic calling convention */
    call printf
    pop %r15
    pop %r14
    mov $0, %rax
    ret
