Data Segment
msg1 db 10,13,"1.Addition$"
msg2 db 10,13,"2.Subtraction$"
msg3 db 10,13,"3.Exit$"
msg4 db 10,13,"Enter Choice:$"
msg5 db 10,13,"Enter Number 1:$"
msg6 db 10,13,"Enter Number 2:$"
msg7 db 10,13,"Addition=$"
msg8 db 10,13,"Subtraction=$"

choice db ?
num1 dw ?
num2 dw ?
result dw ?
Data Ends
Code Segment
Assume CS:Code,DS:Data
Start:
		mov ax,data
		mov ds,ax
back:
		mov dx,offset msg1
		mov ah,09h
		int 21h

		mov dx,offset msg2
		mov ah,09h
		int 21h

		mov dx,offset msg3
		mov ah,09h
		int 21h

		mov dx,offset msg4
		mov ah,09h
		int 21h

		call input
		mov choice,al

		cmp choice,03h
		jnz continue
		mov ax,4c00h
		int 21h

		continue:
		;Taking First Number
		mov dx,offset msg5
		mov ah,09h
		int 21h

		call takenumber
		mov ch,al

		call takenumber
		mov ah,ch
		mov num1,ax


		;Taking Second Number
		mov dx,offset msg6
		mov ah,09h
		int 21h

		call takenumber
		mov ch,al

		call takenumber
		mov ah,ch
		mov num2,ax

		cmp choice,01h
		jnz subtraction

		;Performing Addition

		mov dx,offset msg7
		mov ah,09h
		int 21h
		
		mov ax,num1
		mov bx,num2
		add ax,bx
		mov result,ax

		;Displaying first 2 bits
		mov ch,ah
		and ah,0f0h
		ror ah,04h
		mov bl,ah
		call output

		mov ah,ch
		and ah,0fh
		mov bl,ah
		call output

		;Displaying the other two bits
		mov ax,result
		mov cl,al
		and al,0f0h
		ror al,04h
		mov bl,al
		call output

		mov al,cl
		and al,0fh
		mov bl,al
		call output
		jmp back

		
		subtraction:

		mov dx,offset msg8
		mov ah,09h
		int 21h

		mov ax,num1
		mov bx,num2
		sub ax,bx
		mov result,ax

		;Displaying first 2 bits
		mov ch,ah
		and ah,0f0h
		ror ah,04h
		mov bl,ah
		call output

		mov ah,ch
		and ah,0fh
		mov bl,ah
		call output

		;Displaying the other two bits
		mov ax,result
		mov cl,al
		and al,0f0h
		ror al,04h
		mov bl,al
		call output

		mov al,cl
		and al,0fh
		mov bl,al
		call output
		jmp back



input proc
mov ah,01h
int 21h
cmp al,41h
jc laba
sub al,07h
laba:
sub al,30h
ret
endp

output proc
cmp bl,0Ah
jc labd
add bl,07h
labd:
add bl,30h
mov ah,02h
mov dl,bl
int 21h
ret
endp

takenumber proc
call input
rol al,04h
mov bl,al
call input
add al,bl
ret
endp
Code Ends
 End Start