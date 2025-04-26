.model small
.stack 100h

.data
m db 'I am Ashik. My student id is: IT22030', 0ah, 0dh, '$' 

.code
main proc
    mov ax, @data     
    mov ds, ax        

    lea dx, m         
    mov ah, 9         
    int 21h           

    ; Display '?'
    mov ah, 2         
    mov dl, '?'       
    int 21h           

    ; Take first input
    mov ah, 1        
    int 21h           
    mov bl, al        

    ; Take second input
    mov ah, 1        
    int 21h          
    mov cl, al        

    ; Display a newline
    mov ah, 2
    mov dl, 0ah      
    int 21h
    mov dl, 0dh       
    int 21h

    ; Compare the two inputs
    cmp bl, cl        ; Compare BL and CL
    jg level          ; If BL > CL, jump to label 'level'

    ; If BL <= CL
    mov ah, 2
    mov dl, bl       
    int 21h
    mov dl, cl       
    int 21h
    jmp return        

level:
    ; If BL > CL
    mov ah, 2
    mov dl, cl        
    int 21h
    mov dl, bl       
    int 21h
    jmp return        

return:
    mov ah, 4ch       ; Function 4Ch: Exit program
    int 21h           ; Terminate program

main endp
end main
