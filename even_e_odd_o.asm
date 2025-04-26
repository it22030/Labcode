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
      
      ;enter number
    lea dx, m1
    mov ah, 9
    int 21h
             
    mov ah,01h
    int 21h
    mov bl,al
    
    
    lea dx, m2
    mov ah, 9
    int 21h 
    
    
    cmp bl,'1'
    je odd    
    
      cmp bl,'3'
    je odd 
    
      cmp bl,'5'
    je odd 
    
      cmp bl,'7'
    je odd 
      cmp bl,'9'
    je odd 
    
    
   ; cmp bl,'2'
    ;je  
    
    mov ah,02h
    mov dl,'e'
    int 21h
    jmp return
   
    
 
    
    
    odd:
    mov ah,02h
    mov dl,'o'
    int 21h
    jmp return
         

return:
    mov ah, 4ch
    int 21h
main endp
end main