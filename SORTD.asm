Data Segment
msg1 db 10,13,"Enter the 10 numbers:$"
msg2 db 10,13,"$"
msg3 db 10,13,"The sorted numbers are:$"
temp db ?
count db 0Ah

Data Ends

Code Segment
Assume CS:Code,DS:Data
Start:
	mov ax,data
	mov ds,ax

	mov ah,09h
	mov dx,offset msg1
	int 21h

	mov cx,000Ah
	mov si,1000h
	
	A:
	call takenumber
	mov [si],al
	inc si

	mov ah,09h
	mov dx,offset msg2  ;New line while taking input 
	int 21h

	loop A

	mov si,1000h
	mov cx,0009h ;si and si+1 are compared in one iteration so iterate 9 times
	
	sort:
	mov bl,09h  ;initialization for inner loop
	mov si,1000h

	innerloop:
	mov al,[si] ;store first element in al
	inc si
	mov ah,[si] ;store second element in ah

	cmp al,ah   ;if al is bigger than ah then skip exchange part
	jnc X
	mov temp,al
	mov al,ah
	mov ah,temp	;exchange values of ah and al or rotate AX 8 times

	dec si        
	mov [si],al  ;store new al in original array
	inc si
	mov [si],ah  ;store new ah in original array

	X:

	dec bl
	cmp bl,00h
	jz continue
	jmp innerloop
	
	continue:
	loop sort

	mov cx,000Ah
	mov si,1000h

	mov ah,09h
	mov dx,offset msg3
	int 21h

	disp:
	mov bl,[si]
	and bl,0f0h
	ror bl,04h
	call output

	mov bl,[si]
	and bl,0fh
	call output

	mov ah,09h
	mov dx,offset msg2
	int 21h


	inc si
	loop disp


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