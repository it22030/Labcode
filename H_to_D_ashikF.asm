.model small
.stack 100h
.data
    m1 db 0ah,0dh,'INTER A HEX DIGIT: $'
    m2 db 0ah,0dh,'IN DECIMAL IT IS: '
    c1 db ?,'$'
    m3 db 0ah,0dh,'ILLEGAL CHARACTER - ENTER 0..9 OR A..F: $'
    m4 db 0ah,0dh,'IN DECIMAL IT IS:1'
    c2 db ?,'$'
    m5 db 0ah,0dh,'DO YOU WANT TO DO IT AGAIN? Y/N: $'
    m6 db 'I am Ashik. My student id is: IT22030', 0ah, 0dh, '$'
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, m6
    int 21h

begin:
    lea dx, m1
    mov ah, 9
    int 21h

input:
    mov ah, 1
    int 21h

    cmp al, '0'
    jl illegil_check
    cmp al, '9'
    jle legal_digit

    cmp al, 'A'
    jl illegil
    cmp al, 'F'
    jg illegil

    sub al, 11h
    mov c2, al

    lea dx, m4
    mov ah, 9
    int 21h
    jmp massage

legal_digit:
    mov c1, al
    lea dx, m2
    mov ah, 9
    int 21h
    jmp massage

illegil_check:
    cmp al, 'A'
    jl illegil
    cmp al, 'F'
    jg illegil

    sub al, 11h
    mov c2, al

    lea dx, m4
    mov ah, 9
    int 21h
    jmp massage

illegil:
    lea dx, m3
    mov ah, 9
    int 21h
    jmp input

massage:
    lea dx, m5
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h

    cmp al, 'Y'
    je begin
    cmp al, 'y'
    je begin

return:
    mov ah, 4ch
    int 21h
main endp
end main