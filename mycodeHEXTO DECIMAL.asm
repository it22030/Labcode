.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'ENTER A HEX DEGIT "0-9" OR "A-F": $' 
MSG2 DB 'ENTER NUMBER NOT HEX DECIMAL $' 
MSG3 DB 'HEX TO DECIMAL : $' 
MSG4 DB 'HEX TO DECIMAL :1 $'

.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH , 1
    INT 21H
    MOV BL,AL
    
    
    CMP BL,30H
    JL  TRNH
    
    CMP BL,39H
    JLE DIGIT
    
    CMP BL,46H
    JG TRHC
    
    
    TRNH:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
     
     
    DIGIT:
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H 
    
    MOV DL,AL
    MOV AH,2
    INT 21H
    
    
    TRHC:  
    LEA DX,MSG4
    MOV AH,9
    INT 21H 
    
    MOV DL,AL
    MOV AH,2
    INT 21H