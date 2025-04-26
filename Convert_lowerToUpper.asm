.model small
.stack 100h
.data
a db "Enter a lower case letter :$"
b db "In uppercase it is :$"
c db "I am Ashik. My student id is:IT22030",0ah,0dh,"$"
.code

main proc
    mov ax, @data
    mov ds, ax

    ; Display the string in variable c
    mov ah, 9
    lea dx, c
    int 21h

    ; Display the string in variable a
    lea dx, a
    mov ah,9
    int 21h

    ; Read a single character input
    mov ah, 1
    int 21h
    mov bl, al
    sub bl, 32  ; Convert to uppercase

    ; Print new line and carriage return
  
     
   mov dl,0dh
   mov ah,2
   int 21h
   mov dl,0ah
   mov ah,2
   int 21h

    ; Display the string in variable b
    mov ah, 9
    lea dx, b
    int 21h

    ; Display the uppercase character
    mov ah, 2
    mov dl, bl
    int 21h

    ; Exit the program
    exit:
    mov ah, 4ch
    int 21h
main endp
end main