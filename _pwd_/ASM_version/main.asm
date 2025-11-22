section .data

	error_msg db "hey there is probleme with pwd hhhh !!!!" , 0
	error_msg_len equ $ - error_msg
	short_v db "-v" , 0
	short_h db "-h" , 0
	long_v db "--version" , 0
	long_h db "--help" , 0
	
	short_h_msg db "usage: my_c_pwd and enter hhhh " , 0
	short_h_msg_len equ $ - short_h_msg
	
	long_h_msg db "usage: my_c_pwd and enter hhhh " , 0
	long_h_msg_len equ $ - long_h_msg

	short_v_msg db "version 1.0.0.0" , 0
	short_v_msg_len equ $ - short_v_msg
	
	long_v_msg db "version 1.0.0.0" , 0
	long_v_msg_len equ $ - long_v_msg


section .bss
	buffer resb 4096	

section .text
global _start:
_start:

	mov r9 , [rsp] ; here ze get teh argc from the stack 
	mov r12 ,  [rsp + 16] ; taking th second argument argv[1]
	cmp r9 , 2
	je check_flags
	

	;call the getcwd syscall
	mov rax , 79 ; the number of gtecwd syscall
	mov rdi , buffer
	mov rsi , 4096
	syscall
	cmp rax , 0
	je print_error
	;calling the strlen for to know the buffer size 
	mov rdi , buffer
	call strlen
	mov rdx , rax ; save the return value from rax into rdx
	; printing the path
	mov rax , 1
	mov rdi , 1
	mov rsi , buffer
	; the rdx has already the length
	syscall
	jmp program_end_good


check_flags:
	mov rdi , r12
	mov rsi , short_v	
	call strcmp
	cmp rax , 0
	je print_short_v
	mov rdi , r12
	mov rsi , long_v
	call strcmp
	cmp rax , 0
	je print_long_v
	mov rdi , r12
	mov rsi , short_h
	call strcmp
	cmp rax , 0
	je print_short_h
	mov rdi , r12
	mov rsi ,long_h
	call strcmp 
	cmp rax , 0
	je print_long_h
	jmp program_end_fail

print_short_v:
	mov rax , 1
	mov rdi , 1
	mov rsi , short_v_msg
	mov rdx ,long_v_msg_len
	syscall
	jmp program_end_good


print_long_v:
	mov rax , 1
	mov rdi , 1
	mov rsi ,short_v_msg
	mov rdx , short_v_msg_len
	syscall
	jmp program_end_good

print_short_h:
	mov rax ,1
	mov rdi , 1
	mov rsi , short_h_msg
	mov rdx ,short_h_msg_len
	syscall
	jmp program_end_good

print_long_h:
	mov rax , 1
	mov rdi , 1
	mov rsi , long_h_msg
	mov rdx , long_h_msg_len
	syscall
	


program_end_good:
	mov rax  , 60
	mov rdi , 0
	syscall


print_error:
	mov rax , 1
	mov rdi , 1
	mov rsi , error_msg
	mov rdx , error_msg_len	
	syscall


program_end_fail:
	mov rax , 60
	mov rdi , 1
	syscall




; ########### strlen fucntion ###########
strlen:
    xor     rax, rax        ; length = 0

.loop:
    cmp     byte [rdi + rax], 0
    je      .done
    inc     rax
    jmp     .loop

.done:
    ret



;####### strcmp fucntion #######

strcmp:
.loop:
    mov     dl, [rdi]        ; char from s1
    mov     cl, [rsi]        ; char from s2
    cmp     dl, cl
    jne     .not_equal
    test    dl, dl           ; check for null terminator
    je      .equal
    inc     rdi
    inc     rsi
    jmp     .loop

.not_equal:
    mov     eax, -1
    ret

.equal:
    xor     eax, eax         ; return 0
    ret
