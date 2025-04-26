.model small
.stack 100h
.data
m db 'I am Ashik. My student id is:IT22030',0ah,0dh,'$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, m
    int 21h

    mov al, 'A'
    mov bl, 'B'

    cmp al, bl
    jl level

    mov ah, 2
    mov dl, bl
    int 21h

    jmp return

level:
    mov ah, 2
    mov dl, al
    int 21h

    jmp return

return:
    mov ah, 4ch
    int 21h
main endp
end main