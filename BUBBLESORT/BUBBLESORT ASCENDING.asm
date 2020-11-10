.model small
.data
n db 5
a db 05,07,04,03,06

.code
mov ax, @data
mov ds, ax
lea si, a
mov cl, n
dec cl
outloop : mov ch, cl
mov si, 00h
inloop : mov al, a[si]
inc si
cmp al, a[si]
jc noexchange
xchg al, a[si]
mov a[si-1], al
noexchange : dec ch
jnz inloop
dec cl
jnz outloop
mov ah, 4ch
int 21h
end