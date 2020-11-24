; PROGRAM :: COMPUTE nCr USING RECURSIVE PROCEDURE. ASSUME THAT 'n' AND
; 'r' ARE NON-NEGATIVE INTEGERS.

.MODEL SMALL

.DATA
N DB 05H
R DB 00H
NCRVAL DW 01H DUP(?)

.CODE
START : MOV AX, @DATA
        MOV DS, AX

        MOV CL, R           ;CL=02H -->VALUE OF R
        MOV CH, N           ;CH=05H --> VALUE OF N
        XOR AX, AX          ;Clear the contents of AX REGISTER --> MOV AX, 00H
        CALL NCR
        MOV [NCRVAL], AX
        MOV AH, 4CH
        INT 21H

NCR PROC NEAR
        CMP CH, CL
        JE EQUAL                ; N==R? SET 1
        JC FINISH               ; N<R ? SET ZERO 
        CMP CL, 01H             ; R==1 ? SET N
        JE NEXT
        CMP CL,00H              ; R==0 ? SET 1
        JE EQUAL
        DEC CH  ;CH=04 =N-1
        PUSH CX  ; CH=04 CL=02
        CALL NCR
        POP CX
        DEC CL
        CALL NCR
        RET
NEXT :  XOR BX, BX       ;CLEAR CONTENTS OF BX REGISTER
        MOV BL, CH       ;BL=05 -->VALUE OF N
        ADD AX, BX       ;00 +05 =05 STORED AS RESULT WHICH IS THE VALUE OF N
RET
EQUAL : ADD AX, 01H   ;AX=01H
FINISH :RET
NCR ENDP

END START
