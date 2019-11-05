DATA SEGMENT
NUM1 DW 0008H
NUM2 DW 0036H
HCF DW ?
LCM DW ?
DATA ENDS
CODE SEGMENT
ASSUME DS:DATA,CS:CODE
START:
MOV AX,DATA
MOV DS,AX
MOV AX,NUM1
MOV BX,NUM2

WHILE:MOV DX,0
MOV CX,BX
DIV BX
MOV BX,DX
MOV AX,CX
CMP BX,0
JNE WHILE

MOV HCF,AX

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
		mov ax,HCF
		mov cl,al
		and al,0f0h
		ror al,04h
		mov bl,al
		call output

		mov al,cl
		and al,0fh
		mov bl,al
		call output

MOV AH,4CH
INT 21H

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


CODE ENDS
END START