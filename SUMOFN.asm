Data Segment
msg1 db 10,13,"Enter number of elemenets$"
msg2 db 10,13,"Enter the numbers:$"
msg3 db 10,13,"$"
msg4 db 10,13,"The sum of the given numbers is:$"

n db ?
sum db ?
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
mov n,al

mov dx,offset msg2
mov ah,09h
int 21h

mov si,1000h
mov cl,n
mov ch,00h
mov sum,00h

A:
call takenumber ;will take 8 bit number and store in al
mov [si],al
add sum,al

mov dx,offset msg3
mov ah,09h
int 21h

inc si
loop A

mov dx,offset msg4
mov ah,09h
int 21h

mov bl,sum
and bl,0f0h
ror bl,04h
call output

mov bl,sum
and bl,0fh
call output

mov ax,4c00h
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