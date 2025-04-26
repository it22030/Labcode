.model small
.stack 100h
.data
m db 'I am Ashik. My student id is:IT22030',0ah,0dh,'$' 
m1 db 'Enter Number:','$'
m2 db 0ah,0dh,'$'

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, m
    mov ah, 9
    int 21h

    lea dx, m1
    mov ah, 9
    int 21h
             
    mov ah,01h
    int 21h
    mov bl,al
    
    
    lea dx, m2
    mov ah, 9
    int 21h 
    
    
    cmp bl,'-'
    je negative
    
    cmp bl,'0'
    je zero 
    
    
    
      mov ah,02h
    mov dl,1
    add dl,48
    int 21h
    jmp return
   ; jg positive 
    
 
    
    
    zero:
    mov ah,02h
    mov dl,'0'
    int 21h
    jmp return 
    
    
  ;  positive:
  
    
    
    negative:
    mov ah, 02h
    mov dl, '-'    ; Display minus sign first 045
    int 21h 
    
    mov ah,02h
    mov dl, '1'    ; Then display '1'
    int 21h
    jmp return      

return:
    mov ah, 4ch
    int 21h
main endp
end main