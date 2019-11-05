Data Segment
msg1 db 10,13,"1.Accept String$"
msg2 db 10,13,"2.Print String"
msg3 db 10,13,"3.Print Length$"
msg4 db 10,13,"4.Reverse String$"
exitmessage db 10,13,"5.Exit$"
msg5 db 10,13,"Enter choice:$"
enterstring db 10,13,"Enter String:$"
msg6 db 10,13,"The entered string is:$"
msg7 db 10,13,"Length of string=$"
msg8 db 10,13,"The reversed string is:$"
choice db ?
len db ?
Data Ends
Code Segment
Assume CS:Code,DS:Data
Start:

mov si,1000h
mov di,1000h


back:
mov ax,data
mov ds,ax

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

mov dx,offset exitmessage
mov ah,09h
int 21h

mov dx,offset msg5
mov ah,09h
int 21h

call input
mov choice,al

cmp choice,01h
jnz prints
;Accept String Input

mov dx,offset enterstring
mov ah,09h
int 21h

mov si,1000h
mov cl,00h

A:
mov ah,01h
int 21h

cmp al,0dh
jz back
mov [si],al
inc si
inc cl
mov len,cl
jmp A

prints:
cmp choice,02h
jnz printl

mov dx,offset msg6
mov ah,09h
int 21h

mov cl,len
mov ch,00h
mov si,1000h

printloop:
mov dl,[si]
mov ah,02h
int 21h
inc si
loop printloop

jmp back


printl:
cmp choice,03h
jnz srev

mov dx,offset msg7
mov ah,09h
int 21h

mov bl,len
and bl,0f0h
rol bl,04h
call output

mov bl,len
and bl,0fh
call output

jmp back

srev:
cmp choice,04h
jnz exit

mov dx,offset msg8
mov ah,09h
int 21h
mov si,1000h
mov ax,si
mov cl,len
mov ch,00h
add ax,cx
mov si,ax
dec si
revloop:
mov dl,[si]
mov ah,02h
int 21h
dec si
loop revloop
jmp back

exit:
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

Code Ends
 End Start