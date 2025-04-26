.model small
.stack 100h
.data
    m db 'I am Ashik. My student id is: IT22030', 0ah, 0dh, '$'
.code
main proc
    ; Initialize data segment
    mov ax, @data  ; Fixed: comma instead of underscore
    mov ds, ax     ; Fixed: comma instead of hyphen

    ; Display student info
    mov ah, 9      ; Fixed: comma instead of underscore
    lea dx, m      ; Fixed: comma instead of underscore
    int 21h

    ; Initialize registers
    mov cx, 80h    ; Loop 128 times (80h to FFh)
    mov bh, 80h    ; Start from ASCII 80h
    mov bl, 0      ; Counter for 10 characters per line

    mov ah, 2      ; DOS character output function

print_loop:
    ; Print current ASCII character
    mov dl, bh
    int 21h

    ; Print space separator
    mov dl, ' '    ; Fixed: proper space character
    int 21h

    ; Move to next ASCII character
    inc bh
    inc bl         ; Increment character count

    ; Check if we need new line
    cmp bl, 10     ; 10 characters per line
    jne continue

    ; Print new line (CR+LF)
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h

    mov bl, 0      ; Reset character counter

continue:
    loop print_loop

    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main