Data Segment
msg1 db 10,13,"1.Multiplication$"
msg2 db 10,13,"2.Division$"
msg3 db 10,13,"3.Exit$"
msg4 db 10,13,"Enter Choice:$"
msg5 db 10,13,"Enter Number 1:$"
msg6 db 10,13,"Enter Number 2:$"
msg7 db 10,13,"Multiplication=$"
msg10 db 10,13,"Quotient=$"
msg11 db 10,13,"Remainder=$"

choice db ?
result db ?
resulth db ?
num1 db ?
num2 db ?
Data Ends
Code Segment
Assume CS:Code,DS:Data
Start:
	  mov ax,data
	  mov ds,ax
	  back:
	  mov dx,offset msg1
	  mov ah,09h
	  int 21H

	  mov dx,offset msg2
	  mov ah,09h
	  int 21H

	  mov dx,offset msg3
	  mov ah,09h
	  int 21H

	  mov dx,offset msg4
	  mov ah,09h
	  int 21H

	  call input  
	  mov choice,al
	  cmp al,03h
	  jnz multiplication
	  call exit
	  multiplication:
	  mov dx,offset msg5
	  mov ah,09h
	  int 21H

	  call input
	  mov cl,al
	  rol cl,04h
	  call input
	  add al,cl
	  mov num1,al
	  
	  mov dx,offset msg6
	  mov ah,09h
	  int 21H

	  call input
	  mov cl,al
	  rol cl,04h
	  call input
	  add al,cl
	  mov num2,al

	  mov bl,choice
	  cmp bl,02h
	  jz division

	  ;Multiplying Two Numbers
	  mov dx,offset msg7
	  mov ah,09h
	  int 21H

	  mov al,num1
	  mov bl,num2
	  mul bl

	  mov result,al
	  mov resulth,ah

	  and ah,0f0h
	  ror ah,04h
	  mov bl,ah
	  call output

	  mov ah,resulth
	  and ah,0fh
	  mov bl,ah
	  call output

	  mov al,result
	  and al,0f0h
	  rol al,04h
	  mov bl,al
	  call output

	  mov al,result
	  and al,0fh
	  mov bl,al
	  call output

	  jmp back
	 
	  division:
	  mov dx,offset msg10
	  mov ah,09h
	  int 21H

	  mov al,num1
	  mov ah,00h
	  mov bl,num2
	  div bl
	  mov result,al
	  mov resulth,ah

	  and al,0f0h
	  rol al,04h
	  mov bl,al
	  call output

	  mov al,result
	  and al,0fh
	  mov bl,al
	  call output

	  mov dx,offset msg11
	  mov ah,09h
	  int 21H

	  mov ah,resulth
	  and ah,0f0h
	  ror ah,04h
	  mov bl,ah
	  call output

	  mov ah,resulth
	  and ah,0fh
	  mov bl,ah
	  call output


	  jmp back

input proc
mov ah,01h
int 21h
call convascii
ret
endp

output proc
call convdeci
mov ah,02h
mov dl,bl
int 21h
ret
endp

convascii proc
cmp al,41h
jc laba
sub al,07h
laba:
sub al,30h
ret
endp

convdeci proc
cmp bl,0Ah
jc labd
add bl,07h
labd:
add bl,30h
ret
endp

exit proc
mov ah,4ch
mov al,00h
int 21h
ret
endp

Code Ends
	End Start
