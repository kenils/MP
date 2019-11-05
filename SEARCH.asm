Data Segment
msg1 db 10,13,"Enter the number of elements: $"
msg2 db 10,13,"Enter the array $"
msg3 db 10,13,"Enter the element to be searched: $"
msg4 db 10,13,"$"
msg5 db 10,13,"Element found at position: $"
msg6 db 10,13,"Element not found $"
num db ?
count db ?
i db 00h

Data Ends

Code Segment
Assume CS:Code,DS:Data
Start:
	mov ax,data
	mov ds,ax

	mov si,1000h

	mov ah,09h
	mov dx,offset msg1
	int 21h

	call takenumber   ;Take number of elements
	mov count,al

	mov ah,09h
	mov dx,offset msg2
	int 21h		
	mov cl,count
	mov ch,00h
	A:           ;Loop for taking input array
	mov ah,09h
	mov dx,offset msg4
	int 21h

	call takenumber
	mov [si],al
	inc si
	loop A

	mov ah,09h
	mov dx,offset msg3
	int 21h

	call takenumber
	mov num,al       ;Take Element to be searched

	mov cl,count
	mov ch,00h

	mov si,1000h

	B:
	mov bl,[si]  ;Loop for comparing number
	cmp bl,num
	jz C
	inc i
	inc si
	loop B

	mov ah,09h
	mov dx,offset msg6
	int 21h
	call exit


	C:                
	mov ah,09h
	mov dx,offset msg5
	int 21h

	inc i
	mov bl,i
	call output
	call exit








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

takenumber proc
call input
mov bl,al
rol bl,04h
call input
add al,bl
ret
endp

output proc
cmp bl,0ah
jc labb
add bl,07h

labb:
add bl,30h
mov dl,bl
mov ah,02h
int 21h

ret
endp

exit proc
mov ax,4c00h
int 21h
ret
endp

Code Ends
	End Start	