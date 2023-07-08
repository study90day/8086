assume cs:daima,ds:shuju,ss:jian
shuju segment
db '1. display      '
db '2. brow         '
db '3. replace      '
db '4. modify       '
db '5. okload       '
shuju ends

jian segment
dw 0
jian ends

daima segment
start:
mov ax,shuju
mov ds,ax
mov sp,2
mov ax,jian
mov ss,ax
mov si,3
mov cx,5
s:
push cx
mov cx,4
mov bx,0
s0:
mov al,[bx+si]
and al,11011111b
mov [si+bx],al
inc bx
loop s0
add si,16
pop cx
loop s

mov ax,4c00H
int 21H
daima ends
end start