.model small
.stack 100h
.data
    m  db 'I am Ashik. My student id is: IT22030', 0ah, 0dh, '$'
    m1 db 0ah, 0dh, '$'  ; Newline characters
.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Display student info
    mov ah, 9
    lea dx, m
    int 21h

    ; Read character input
    mov ah, 1
    int 21h 
    mov bl,al
    
    ; Print newline
    mov ah, 9
    lea dx, m1
    int 21h

    ; Check if uppercase letter (A-Z)
    cmp bl, 'A'
    jb return     ; Jump if below 'A'
    cmp bl, 'Z'
    ja return     ; Jump if above 'Z'

    ; Display the uppercase letter 
    mov ah, 2
    mov dl, bl
    int 21h

    ; Exit program
    return:
    mov ah, 4ch
    int 21h
main endp
end main