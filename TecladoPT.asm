;O TECLADO FUNCIONA ATRAVES DAS TECLAS 1, 2, 3, 4, 5, 6, 7
; 1- DO, 2 - RE, 3 - MI, 4 - FA, 5 - SOL, 6 - LA, 7 - SI

COD SEGMENT
ASSUME CS:COD, DS:COD, ES:COD, SS:COD
ORG 100h

Rotina PROC near
    PUSH DX
    PUSH AX
    PUSH BX
        MOV DL,20h ; coluna
        MOV AH,02h ; move o cursor 
        MOV BH,00h ; pAgina de video 0 
        INT 10h

        MOV AH,02    ; mostra o caractere
        MOV DL, 72h  ;copia um caractere para DL
        INT 21h
    POP BX
    POP AX
    POP DX
    RET         
Rotina ENDP

TECLADO PROC NEAR
    PUSH DX
    PUSH AX
        MOV AH,02   
        MOV DL,84d  ;T
        INT 21h
        MOV AH,02   
        MOV DL,69d  ;E
        INT 21h
        MOV AH,02    
        MOV DL,67d  ;C
        INT 21h
        MOV AH,02   
        MOV DL,76d  ;L
        INT 21h
        MOV AH,02   
        MOV DL,65d  ;A
        INT 21h
        MOV AH,02   
        MOV DL,68d  ;D
        INT 21h
        MOV AH,02   
        MOV DL,79d  ;O
        INT 21h
        MOV AH,02   
        MOV DL,58d  ;:
        INT 21h
        MOV AH,02    
        MOV DL,20h   ;espaco
        INT 21h
    POP AX
    POP DX
    RET
TECLADO ENDP

NOTADO PROC NEAR
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
        MOV AH, 06h    
        XOR AL, AL     ;limpa a tela
        XOR CX, CX     
        MOV DX, 184FH 
        MOV BH, 5Fh    ;magenta, branco
        INT 10H
  
        MOV AH,02   
        MOV DL,68d  ;D
        INT 21h
        MOV AH,02   
        MOV DL,79d  ;O
        INT 21h
        
        INT 10H
        MOV AL, 182 
        OUT 43h, AL ;prepara a nota 
        MOV AX,4560 ;do 
        
        OUT 42h, AL ; manda byte menos significativo
        MOV AL, AH 
        OUT 42h,AL ; manda byte mais significativo 
        IN AL, 61h ; verifica qual o valor esta na porta 61h 


        OR AL, 00000011b ;seta os dois bits menos significativos 
        OUT 61h, AL ; atualiza o valor na porta 61h ... reproduz 
        MOV BX, 5h ; determina a duracao do som
DURA:
        MOV CX, 0FFFFh 
DURAC: 
        DEC CX 
        JNE DURAC 
        DEC BX 
        JNE DURA 
        
        IN AL, 61h ; verifica qual o valor est? na porta 61h 
        AND AL, 11111100b ; zera os dois bits menos significativos 
        OUT 61h, AL ; atualiza valor na porta 61h, fim reprodu??o
    POP DX
    POP CX
    POP BX
    POP AX
    RET
NOTADO ENDP

NOTARE PROC NEAR
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
       MOV AH, 06h    
       XOR AL, AL     ;limpa a tela
       XOR CX, CX     
       MOV DX, 184FH  
       MOV BH, 2Fh    ;verde, branco
       INT 10H
        
        
        MOV AH,02   
        MOV DL,82d  ;R
        INT 21h
        MOV AH,02   
        MOV DL,69d  ;E
        INT 21h
        
        INT 10H
        MOV AL, 182 
        OUT 43h, AL ;prepara a nota 
        MOV AX, 4063 ;re    
        
        OUT 42h, AL ; manda byte menos significativo
        MOV AL, AH 
        OUT 42h,AL ; manda byte mais significativo 
        IN AL, 61h ; verifica qual o valor esta na porta 61h 


        OR AL, 00000011b ; seta os dois bits menos significativos 
        OUT 61h, AL ; atualiza o valor na porta 61h ... reproduz 
        MOV BX, 5h ; determina a duracao do som
        DURA2:
        MOV CX, 0FFFFh 
        DURAC2: 
        DEC CX 
        JNE DURAC2
        DEC BX 
        JNE DURA2 
        
        IN AL, 61h ; verifica qual o valor est? na porta 61h 
        AND AL, 11111100b ; zera os dois bits menos significativos 
        OUT 61h, AL ; atualiza valor na porta 61h, fim reprodu??o
    POP DX
    POP CX
    POP BX
    POP AX
    RET
NOTARE ENDP

NOTAMI PROC NEAR
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
       MOV AH, 06h    ; Scroll up function
       XOR AL, AL     ; Clear entire screen
       XOR CX, CX     ; Upper left corner CH=row, CL=column
       MOV DX, 184FH  ; lower right corner DH=row, DL=column 
       MOV BH, 3Fh    ; ciano, branco
       INT 10H
       
       MOV AH,02   
       MOV DL,77d  ;M
       INT 21h
       MOV AH,02   
       MOV DL,73d  ;I
       INT 21h
        
       INT 10H
       MOV AL, 182 
       OUT 43h, AL ;prepara a nota 
       MOV AX, 3619 ;mi 
        
       OUT 42h, AL ; manda byte menos significativo
       MOV AL, AH 
       OUT 42h,AL ; manda byte mais significativo 
       IN AL, 61h ; verifica qual o valor esta na porta 61h 


       OR AL, 00000011b ; seta os dois bits menos significativos 
       OUT 61h, AL ; atualiza o valor na porta 61h ... reproduz 
       MOV BX, 5h ; determina a duracao do som
       DURA3:
       MOV CX, 0FFFFh 
       DURAC3: 
       DEC CX 
       JNE DURAC3
       DEC BX 
       JNE DURA3 
        
       IN AL, 61h ; verifica qual o valor est? na porta 61h 
       AND AL, 11111100b ; zera os dois bits menos significativos 
       OUT 61h, AL ; atualiza valor na porta 61h, fim reprodu??o
    POP DX
    POP CX
    POP BX
    POP AX
    RET
NOTAMI ENDP

NOTAFA PROC NEAR
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
       MOV AH, 06h    ; Scroll up function
       XOR AL, AL     ; Clear entire screen
       XOR CX, CX     ; Upper left corner CH=row, CL=column
       MOV DX, 184FH  ; lower right corner DH=row, DL=column 
       MOV BH, 4Fh     ; vermelho, branco
       INT 10H
   
       MOV AH,02   
       MOV DL,70d  ;F
       INT 21h
       MOV AH,02   
       MOV DL,65d  ;A
       INT 21h
        
       INT 10h
       MOV AL, 182 
       OUT 43h, AL ;prepara a nota 
       MOV AX, 3416 ; fa
        
       OUT 42h, AL ; manda byte menos significativo
       MOV AL, AH 
       OUT 42h,AL ; manda byte mais significativo 
       IN AL, 61h ; verifica qual o valor esta na porta 61h 


       OR AL, 00000011b ; seta os dois bits menos significativos 
       OUT 61h, AL ; atualiza o valor na porta 61h ... reproduz 
       MOV BX, 5h ; determina a duracao do som
       DURA4:
       MOV CX, 0FFFFh 
       DURAC4: 
       DEC CX 
       JNE DURAC4
       DEC BX 
       JNE DURA4 
        
       IN AL, 61h ; verifica qual o valor est? na porta 61h 
       AND AL, 11111100b ; zera os dois bits menos significativos 
       OUT 61h, AL ; atualiza valor na porta 61h, fim reprodu??o
    POP DX
    POP CX
    POP BX
    POP AX
    RET
NOTAFA ENDP

NOTASOL PROC NEAR
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
       MOV AH, 06h    ; Scroll up function
       XOR AL, AL     ; Clear entire screen
       XOR CX, CX     ; Upper left corner CH=row, CL=column
       MOV DX, 184FH  ; lower right corner DH=row, DL=column 
       MOV BH, 6Fh     ; marrom, branco
       INT 10H
          
       MOV AH,02   
       MOV DL,83d  ;S
       INT 21h
       MOV AH,02   
       MOV DL,79d  ;O
       INT 21h
       MOV AH,02   
       MOV DL,76d  ;L
       INT 21h
          
       INT 10h
       MOV AL, 182 
       OUT 43h, AL ;prepara a nota 
       MOV AX, 3043 ; sol
        
       OUT 42h, AL ; manda byte menos significativo
       MOV AL, AH 
       OUT 42h,AL ; manda byte mais significativo 
       IN AL, 61h ; verifica qual o valor esta na porta 61h 


       OR AL, 00000011b ; seta os dois bits menos significativos 
       OUT 61h, AL ; atualiza o valor na porta 61h ... reproduz 
       MOV BX, 5h ; determina a duracao do som
       DURA5:
       MOV CX, 0FFFFh 
       DURAC5: 
       DEC CX 
       JNE DURAC5
       DEC BX 
       JNE DURA5 
        
       IN AL, 61h ; verifica qual o valor est? na porta 61h 
       AND AL, 11111100b ; zera os dois bits menos significativos 
       OUT 61h, AL ; atualiza valor na porta 61h, fim reprodu??o
    POP DX
    POP CX
    POP BX
    POP AX
    RET
NOTASOL ENDP

NOTALA PROC NEAR
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
       MOV AH, 06h    
       XOR AL, AL     ;limpa a tela
       XOR CX, CX     
       MOV DX, 184FH  
       MOV BH, 7Fh    ;cinza, branco
       INT 10H
        
       MOV AH,02   
       MOV DL,76d  ;L
       INT 21h
       MOV AH,02   
       MOV DL,65d  ;A
       INT 21h
       
       INT 10H
       MOV AL, 182 
       OUT 43h, AL ;prepara a nota 
       MOV AX, 2711 ;la
        
       OUT 42h, AL ; manda byte menos significativo
       MOV AL, AH 
       OUT 42h,AL ; manda byte mais significativo 
       IN AL, 61h ; verifica qual o valor esta na porta 61h 


       OR AL, 00000011b ; seta os dois bits menos significativos 
       OUT 61h, AL ; atualiza o valor na porta 61h ... reproduz 
       MOV BX, 5h ; determina a duracao do som
       DURA6:
       MOV CX, 0FFFFh 
       DURAC6: 
       DEC CX 
       JNE DURAC6
       DEC BX 
       JNE DURA6 
        
       IN AL, 61h ; verifica qual o valor est? na porta 61h 
       AND AL, 11111100b ; zera os dois bits menos significativos 
       OUT 61h, AL ; atualiza valor na porta 61h, fim reprodu??o
    POP DX
    POP CX
    POP BX
    POP AX
    RET
NOTALA ENDP

NOTASI PROC NEAR
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
       MOV AH, 06h    
       XOR AL, AL     ;limpa a tela
       XOR CX, CX     
       MOV DX, 184FH  
       MOV BH, 9Fh    ;azul claro, branco
       INT 10H
       
       MOV AH,02   
       MOV DL,83d  ;S
       INT 21h
       MOV AH,02   
       MOV DL,73d  ;I
       INT 21h
        
       INT 10H
       MOV AL, 182 
       OUT 43h, AL ;prepara a nota 
       MOV AX, 2415 ;si
        
       OUT 42h, AL ; manda byte menos significativo
       MOV AL, AH 
       OUT 42h,AL ; manda byte mais significativo 
       IN AL, 61h ; verifica qual o valor esta na porta 61h 


       OR AL, 00000011b ; seta os dois bits menos significativos 
       OUT 61h, AL ; atualiza o valor na porta 61h ... reproduz 
       MOV BX, 5h ; determina a duracao do som
       DURA7:
       MOV CX, 0FFFFh 
       DURAC7: 
       DEC CX 
       JNE DURAC7
       DEC BX 
       JNE DURA7 
        
       IN AL, 61h ; verifica qual o valor est? na porta 61h 
       AND AL, 11111100b ; zera os dois bits menos significativos 
       OUT 61h, AL ; atualiza valor na porta 61h, fim reprodu??o
    POP DX
    POP CX
    POP BX
    POP AX
    RET
NOTASI ENDP

MAIN PROC

    notas:
        MOV DH,10d ; coluna 
        MOV DL,30d ; linha 
        MOV AH,02h ; move o cursor 
        MOV BH,00h ; pagina de video 0 
        INT 10h
    
    CALL TECLADO
    
    jmp inicio

    inicio:
    MOV AL,00h
    MOV AH,08h   ; le um caractere do teclado
    INT 21h      ; salva o char em AL
    CMP AL, 31h
    JE DO        ; pula se igual
    CMP AL, 32h
    JE RE
    CMP AL, 33h 
    JE MI
    CMP AL, 34h
    JE FA
    CMP AL, 35h
    JE SOL
    CMP AL, 36h
    JE LA
    CMP AL, 37h
    JE SI2
    JMP FIM

    ;-------------------DO----------------
    DO:
        CALL NOTADO
        jmp notas
        
    ;------------------RE------------------   
    RE:
       CALL NOTARE
       jmp notas
        
    ;------------------MI------------------
    MI:
       CALL NOTAMI
       jmp notas

    ;------------------FA-------------------
    FA:
       CALL NOTAFA
       jmp notas
 
   ;------------------SOL-------------------
    SOL:
      CALL NOTASOL 
      jmp notas
   
   ;-------------------LA-------------------
    LA:
     CALL NOTALA
     jmp notas
      
   ;------------------SI----------------    
    SI2:
      CALL NOTASI
      jmp notas
        
   ;------------- FIM ---------------
   
       FIM:
       MOV AH,4Ch   ; funcao para sair
       MOV AL,00    ; retorna 00
       INT 21h

MAIN ENDP ;finaliza procedure
COD ENDS ;finaliza segmento
END MAIN ;finaliza programa