Data Segment
msg1 db 10,13,"Enter Number 1:$"
msg2 db 10,13,"Enter Number 2:$"
msg3 db 10,13,"GCD=$"
num1 db ?
num2 db ?
gcd db ?
Data Ends
Code Segment
Assume CS:Code,DS:Data
Start:
	mov ax,data
	mov ds,ax
	mov dx,offset msg1
	mov ah,09h
	int 21h

	call takenumber
	mov num1,al

	mov dx,offset msg2
	mov ah,09h
	int 21h

	call takenumber
	mov num2,al

	mov al,num1
	mov bl,num2
	
	repeat:
	mov ah,00h
	mov cl,bl ;t=b

	div bl
	mov bl,ah  ;b=a%b

	mov al,cl ;a=t       
	cmp bl,00h
	 	 	
	jnz repeat   ;while(b!=0)

	mov gcd,al  ;gcd=a

	mov dx,offset msg3
	mov ah,09h
	int 21h

 	mov bl,gcd
 	and bl,0f0h
 	ror bl,04h
 	call output

 	mov bl,gcd
 	and bl,0fh
 	call output

 	mov ax,4C00h
 	int 21h


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
