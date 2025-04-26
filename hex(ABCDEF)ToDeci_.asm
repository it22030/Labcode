   .model small
.stack 100h
.data
massage db 'ENTER A HEX DIGIT: $'
massage2 db 0ah,0dh,'IN DECIMAL IT IS: 1'
ans db ?,'$'
massage3 db 'I am Alamin. My student id is: IT22020',0ah,0dh,'$'
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Display the string in variable massage3
    lea dx, massage3
    mov ah, 9
    int 21h

    ; Display the string in variable massage
    lea dx, massage
    int 21h

    ; Read a single character input
    mov ah, 1
    int 21h

    ; Convert the hex digit to decimal
    sub al, 11h
    mov ans, al

    ; Display the result message
    lea dx, massage2
    mov ah, 9
    int 21h

    ; Exit the program
    mov ah, 4ch
    int 21h
main endp
end main