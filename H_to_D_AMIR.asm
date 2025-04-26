.model small
.stack 200h

.data       

    X db ?
 
    identity db "My name is Md. ASHIK. ID: IT22030" ,0ah, 0dh, "$"
    instruction db 0ah, 0dh, "Enter a HEX digit: $"
    illegal db 0ah, 0dh, "Illegal Character- enter 0...9 or A...F: $"
    again db 0ah, 0dh, "Do you want to do it again?Y/y or N:  $"
    resA_F db 0ah, 0dh, "In decimal it is: 1$"              
    resNum db 0ah, 0dh, "In decimal it is: $" 
    limit db 0ah, 0dh, "See you again! $"

.code
    main proc  
        mov ax, @data
        mov ds, ax                                      
        
        ;prints identity
        mov ah, 09h
        lea dx, identity
        int 21h
        mov cx, 0
        
        begin:
            mov ah, 09h
            lea dx, instruction
            int 21h
            
            mov ah, 01h
            int 21h
            mov X, al
            jmp check_num
            
        check_num:
            cmp X, '0'
            jl illegal_char
            
            cmp X, '9'
            jg check_A_F
            
            jmp numeric 
            
        check_A_F:
            cmp X, 'A'
            jl illegal_char
            cmp X, 'F'
            jg illegal_char
            
            mov ah, 09h
            lea dx, resA_F
            int 21h
            
            sub X,'A'   ; 65
            add x,'0'    ;48
            mov ah, 02h
            mov dl, X
            int 21h
            jmp repeat        
            
        illegal_char:
            inc cx
            cmp cx, 3
            je oops
            
            mov ah, 09h
            lea dx, illegal
            int 21h
            mov ah, 01h
            int 21h
            mov X, al
            jmp check_num
            
        numeric:
            mov ah, 09h
            lea dx, resNum
            int 21h
            
            mov ah, 02h
            mov dl, X
            int 21h
            jmp repeat
            
        repeat:
            mov ah, 09h
            lea dx, again
            int 21h
            
            mov ah, 01h
            int 21h
            cmp al, 'Y'
            je begin
            cmp al, 'y'
            je begin
            jmp end 
        
        oops:
            mov ah, 09h
            lea dx, limit
            int 21h
            jmp end
                       
        
        end:
            mov ah, 04Ch
            int 21h
    main endp
    end main