Data Segment
msg1 db 10,13,"Enter First String:$"
msg2 db 10,13,"Enter Second String:$"
msg3 db 10,13,"The concatenated string is:$"
count1 db 00h
count2 db 00h
Data Ends
Code Segment
Assume CS:Code,DS:Data
Start:
	mov ax,data
	mov ds,ax

	mov dx,offset msg1
	mov ah,09h
	int 21h

	mov si,1000h
	A:
	mov ah,01h		;take the first string
	int 21h
	cmp al,0dh
	jz break
	mov [si],al
	inc si
	inc count1
	jmp A        



break:
	mov dx,offset msg2
	mov ah,09h
	int 21h
B:
	mov ah,01h		;Take the second string
	int 21h
	cmp al,0dh
	jz break1
	mov [si],al
	inc si
	inc count2
	jmp B        
	
	mov dx,offset msg3
	mov ah,09h
	int 21h

break1:
	mov bl,count1
	mov cl,count2
	add cl,bl
	mov si,1000h
disp:
mov dl,[si]
mov ah,02h
int 21h

inc si

loop disp

mov ax,4c00h
int 21h		



	











Code Ends
	End Start