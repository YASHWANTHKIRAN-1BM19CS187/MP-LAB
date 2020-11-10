.model small
.data
msg db 0dh,0ah,"enter alphanumeric character: $"
res db 02h dup(0)

.code
mov ax,@data
mov ds,ax

lea dx,msg
call disp
mov ah,01h
int 21h
mov bl,al
mov cl,4
shr al,cl
cmp al,0ah
jc digit
add bl,07h

digit:
add bl,30h
mov res+1,bl

mov ah,00h
mov al,03h
int 10h
mov ah,02h
mov bh,00h
mov dh,0ch
mov dl,28h

mov res+2,'$'

lea dx,res

call disp

mov ah,4ch
int 21h
disp proc near
mov ah,09h
int 21h
ret
disp endp
end