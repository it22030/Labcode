.model small
.stack 100h
.data
    a db 'I am Ashik. My student id is: IT22030', 0ah, 0dh, '$'   
.code

main proc
    
    mov ax, @data
    mov ds, ax

    
    lea dx, a
    mov ah, 9
    int 21h

  
    mov ah, 2      ; output ?
    mov dl, '?'  
    int 21h      

   
    mov ah, 1    ; input a single character     
    int 21h 
    ;sub al,48 ;  numeric number ar jonno     
    mov bl, al   

  
  
   
   ;print a new line 
  
   mov dl,0Dh
   mov ah,2
   int 21h
   mov dl,0Ah 
   mov ah,2
   int 21h
   
   
   ; output the input character
  
    mov dl, bl
    mov ah,2    
    int 21h       

    
    mov ah, 4Ch   
    int 21h        
main endp
end main
