.MODEL SMALL
.STACK 100H
.DATA
MSG DB  0AH,0DH,'THE SUM OF '
C1 DB ?,' AND ',
C2 DB ?,' IS ',
SUM DB ?,' $'
MSG2 DB 'I am Ashik. My student id is: IT22030',0ah,0dh,'$'

.CODE
Main PROC

    MOV AX, @DATA
    MOV DS, AX

    ; Display the string in variable MSG2
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    ; Display a question mark
    MOV AH, 2
    MOV DL, '?'
    INT 21H

    ; Read the first character input
    MOV AH, 1
    INT 21H
    MOV C1, AL

    ; Read the second character input
    INT 21H
    MOV C2, AL

    ; Calculate the sum of the two inputs
    ADD AL, C1
    SUB AL, 48
    MOV SUM, AL    
    
    

    ; Display the result message
    LEA DX, MSG
    MOV AH, 9
    INT 21H

    ; Exit the program
    MOV AH, 4CH
    INT 21H
Main ENDP
END Main