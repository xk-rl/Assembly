section .data
	text db "Hello, World!",10,0
	text2 db "What a beautiful day it is!",10,0

section .text
	global _start

_start:
	mov rax, text
	call _print

	mov rax, text2
	call _print

	call _exit

_exit:

	mov rax, 60
	mov rdi, 0
	syscall
	ret

_print:
	push rax,
	mov rbx, 0
_printLoop:
	inc rax
	inc rbx
	mov cl, [rax]
	cmp cl, 0
	jne _printLoop

	mov rax, 1
	mov rdi, 1
	pop rsi
	mov rdx, rbx
	syscall

	ret
