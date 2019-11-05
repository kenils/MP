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
result db ?
num1 db ?
num2 db ?
Data Ends
Code Segment
Assume CS:Code,DS:Data
Start:
		MOV AX,Data
		MOV DS,AX

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

		;take input choice from user
		mov ah,01h
		int 21h
		call convascii
		mov choice,al
		cmp al,03h
		jnz addition
		mov ah,4Ch
		mov al,00h
		int 21h



		addition:
		;take input number1 from user
		mov dx,offset msg5
		mov ah,09h
		int 21h		

		mov ah,01h
		int 21h
		call convascii
		rol al,04h
		mov cl,al

		mov ah,01h
		int 21h
		call convascii
		add cl,al
		mov num1,cl		

		;take input number2 from user
		mov dx,offset msg6
		mov ah,09h
		int 21h		

		mov ah,01h
		int 21h
		call convascii
		rol al,04h
		mov cl,al

		mov ah,01h
		int 21h
		call convascii
		add cl,al
		mov num2,cl

		mov al,choice
		cmp al,02h
		jz subtraction

		mov bl,num1
		mov cl,num2
		add bl,cl
		mov result,bl

		mov dx,offset msg7
		mov ah,09h
		int 21h 

		and bl,0f0h
		rol bl,04h
		call convdeci

		mov ah,02h
		mov dl,bl
		int 21h

		mov bl,result
		and bl,0fh
		call convdeci

		
		mov ah,02h
		mov dl,bl
		int 21h		

		jmp back


		subtraction:
		mov bl,num1
		mov cl,num2
		sub bl,cl
		mov result,bl

		and bl,0f0h
		rol bl,04h
		call convdeci

		mov dx,offset msg8
		mov ah,09h
		int 21h

		mov ah,02h
		mov dl,bl
		int 21h

		mov bl,result
		and bl,0fh
		call convdeci

		mov ah,02h
		mov dl,bl
		int 21h			


		jmp back


		convascii proc
		cmp al,41h
		jc labela
		sub al,07h

		labela:
		sub al,30h
		ret
		endp

		convdeci proc
		cmp bl,0Ah
		jc label1
		add bl,07h

		label1:
		add bl,30h
		ret
		endp














Code Ends
 End Start