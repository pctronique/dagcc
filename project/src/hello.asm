section .data                               ; Section des donnees
Text:           db 'Hello, World!',0Ah      ; En ascii, 0Ah = 10 = '\n'. La virgule sert a concatener les chaines
BufferSize:     equ $-Text                  ; Taille de la chaine

section .opcode                             ; Section du code source
        global _start                       ; Etiquet du debut
_start:                                     ; Debut du code source
                                            ; Afficher du texte sur la console
        mov eax, 4                          ; Appel de sys_write
        mov ebx, 1                          ; Sortie standard STDOUT
        mov ecx, Text                       ; Chaine a afficher
        mov edx, BufferSize                 ; Taille de la chaine
        int 80h                             ; Afficher le texte
        
                                            ; fin du programme asm
        mov eax, 1                          ; Appel de sys_exit
        mov ebx, 0                          ; Code de retour
        int 80h                             ; Interruption du kernel
