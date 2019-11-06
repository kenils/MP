Data Segment
msg1 db 10,13,"Enter the number:$"
msg2 db 10,13,"Factorial=:$"
fact db ?
facth db ?
num db ?
Data Ends
Code Segment
Assume CS:Code,DS:Data
Start:
	mov ax,data
	mov ds,ax

	mov ah,09h
	mov dx,offset msg1
	int 21h

	call input
	mov num,al

	cmp num,00h
	jz B

	mov cl,num
	mov ch,00h 
	mov bl,01h ;serves as counter i
	mov al,01h ;fact=1

	A:

	mul bl
	inc bl ;fact=fact*i

	loop A 

C:
	mov fact,al
	mov facth,ah

	mov ah,09h
	mov dx,offset msg2
	int 21h


	mov bl,facth
	and bl,0f0h
	ror bl,04h
	call output

	mov bl,facth
	and bl,0fh
	call output


	mov bl,fact
	and bl,0f0h
	ror bl,04h
	call output

	mov bl,fact
	and bl,0fh
	call output


	mov ax,4c00h
	int 21h

	B:
	mov ax,0001h
	jmp C



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
