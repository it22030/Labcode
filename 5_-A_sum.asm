        .model small
.stack 100h
.data
massage db 'I am Ashik. My student id is: IT22030',0ah,0dh,'$'
.code

main proc
    mov ax,@data
    mov ds,ax

    lea dx,massage
    mov ah,9
    int 21h

    ; Input a single character
    mov ah, 1
    int 21h
    sub al, 48        ; Convert ASCII to numeric (AL = AL - '0')
    mov bl, al

    ; Compute A = 5 - A
    mov al, 5
    sub al, bl
    add al, 48        ; Convert result back to ASCII (AL = AL + '0')

    ; Output the result
    mov dl, al
    mov ah, 2
    int 21h

    exit:
    mov ah, 4Ch
    int 21h

main endp
end main
