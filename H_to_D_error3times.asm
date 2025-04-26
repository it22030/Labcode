.MODEL SMALL
.STACK 200h

.DATA
    X db ?                     ; To store user input
    try_count db 3              ; 3 tries
    identity db "My name is Md. ASHIK. ID: IT22030", 0Ah, 0Dh, "$"
    instruction db 0Ah, 0Dh, "Enter a HEX digit (0-9, A-F, a-f): $"
    success_msg db 0Ah, 0Dh, "Valid hex digit entered!", 0Ah, 0Dh, "$"
    fail_msg db 0Ah, 0Dh, "Failed 3 times. Program terminated.", 0Ah, 0Dh, "$"

.CODE
main PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display identity
    MOV AH, 09h
    LEA DX, identity
    INT 21h

INPUT_LOOP:
    ; Show instruction
    MOV AH, 09h
    LEA DX, instruction
    INT 21h

    ; Read user input
    MOV AH, 01h
    INT 21h
    MOV X, AL

    ; Check if 0-9
    CMP X, '0'
    JB INVALID_INPUT
    CMP X, '9'
    JBE VALID_INPUT

    ; Check if A-F
    CMP X, 'A'
    JB INVALID_INPUT
    CMP X, 'F'
    JBE VALID_INPUT

    ; Check if a-f
    CMP X, 'a'
    JB INVALID_INPUT
    CMP X, 'f'
    JBE VALID_INPUT

INVALID_INPUT:
    ; Decrease try counter
    DEC try_count
    CMP try_count, 0
    JE TERMINATE_PROGRAM

    ; Ask again
    JMP INPUT_LOOP

VALID_INPUT:
    ; Show success message
    MOV AH, 09h
    LEA DX, success_msg
    INT 21h
    JMP EXIT_PROGRAM

TERMINATE_PROGRAM:
    ; Show failure message
    MOV AH, 09h
    LEA DX, fail_msg
    INT 21h

EXIT_PROGRAM:
    ; Program exit
    MOV AH, 4Ch
    INT 21h

main ENDP
END main
