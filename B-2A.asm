.model small
.stack 100h
.data
    m1 db 'I am Ashik. My student id is: IT22030', 0ah, 0dh, '$' 
    m2 db 0ah, 0dh, 'Enter A: $'  
    m3 db 0ah, 0dh, 'Enter B: $'  
    M4 db 0ah, 0dh, 'Result IS:  $'  
  .code

main proc
    mov ax, @data
    mov ds, ax

   lea dx, m1    ; main message print
    mov ah, 9
    int 21h
    
    lea dx, m3  ;B message print 
    mov ah,9
    int 21h  
    
    mov ah, 1   ; B value input 
    int 21h
    sub al,48
    mov bl,al
  
    lea dx,m2   ; A message print
    mov ah,9
    int 21h 
          
          
    mov ah,1   ;A value input
    int 21h
    sub al,48
    ;sub al,bl
    mov bh,al   
  
    
    ;compute: result=B-2A 
      
   ; sub al,bl
   ; mov bh,al
   ; add bh,48  
     shl bh, 1          ; Multiply A by 2 (2A)
    sub bl, bh         ; B - 2A (BL = B - 2A)

    add bl, 48         ; Convert result to ASCII for printing
  
    lea dx,m4  ; result print 
    mov ah, 9
    int 21h 
    
    ; output result value 
    mov dl,bl
    mov ah,2
    ;mov dl,bh
    int 21h
 
    exit:
    mov ah, 4Ch
    int 21h
main endp
end main

