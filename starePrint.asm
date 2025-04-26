.MODEL SMALL
.STACK 100h

.DATA
    ; Student information
    n1 db 'I am ASHIK. My student id is: IT22838', 0Ah, 0Dh, '$'

    ; Variables to store initials
    c1 db ?
    c2 db ?
    c3 db ?

    ; Top star lines (7 lines)
    n2 db 0Ah, 0Dh, '*********', 0Ah, 0Dh
    n3 db '*********', 0Ah, 0Dh
    n4 db '*********', 0Ah, 0Dh
    n5 db '*********', 0Ah, 0Dh
    n6 db '*********', 0Ah, 0Dh
    n7 db '*********', 0Ah, 0Dh
    n8 db '*********', 0Ah, 0Dh

    ; Midline where initials will be shown
    midline db '***', ?, ?, ?, '***', 0Ah, 0Dh, '$'

    ; Bottom star lines (6 lines)
    n9  db '*********', 0Ah, 0Dh
    n10 db '*********', 0Ah, 0Dh
    n11 db '*********', 0Ah, 0Dh
    n12 db '*********', 0Ah, 0Dh
    n13 db '*********', 0Ah, 0Dh
    n14 db '*********', 0Ah, 0Dh, '$'

.CODE
main PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Show student info
    MOV AH, 9
    LEA DX, n1
    INT 21h

    ; Show question mark
    MOV AH, 2
    MOV DL, '?'
    INT 21h

    ; Take initials input
    MOV AH, 1
    INT 21h
    MOV c1, AL
    MOV midline + 3, AL   ; 1st initial goes to midline[3]

    INT 21h
    MOV c2, AL
    MOV midline + 4, AL   ; 2nd initial goes to midline[4]

    INT 21h
    MOV c3, AL
    MOV midline + 5, AL   ; 3rd initial goes to midline[5]

    ; Print top 7 star lines
    MOV AH, 9
    LEA DX, n2
    INT 21h
   

   

    ; Print bottom 6 lines
    LEA DX, n9
    INT 21h
   

    ; Exit
    MOV AH, 4Ch
    INT 21h
main ENDP
END main
