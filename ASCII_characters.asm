.model small
.stack 100h
.data
    m db 'I am Ashik. My student id is: IT22030', 0ah, 0dh, '$'
.code
main proc
  
    mov ax, @data  
    mov ds, ax     

    ; Display student info
    mov ah, 9      
    lea dx, m     
    int 21h

    ; Initialize registers
    mov cx, 80h    
    mov bh, 80h    
    mov bl, 0      

    mov ah, 2     

print_loop:
    ; Print current ASCII character
    mov dl, bh
    int 21h

    ; Print space separator
    mov dl, ' '    
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
