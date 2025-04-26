.model small
.stack 100h
.data
    m db 'I am Ashik. My student id is: IT22030', 0Ah, 0Dh, '$'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Display message
    lea dx, m
    mov ah, 9
    int 21h
    
    ; Display 80 stars
    mov cx, 80
    mov ah, 2
    mov dl, '*'
    
top:
    int 21h
    loop top
    
    ; Exit program
    mov ah, 4ch
    int 21h
main endp
end main