include macrospalin.lib
.stack
    db 100h dup(?)

.data                         
    ;Pantalla principal
    introGame db "Bienvenido a Topos $ "
    playButtom db "P:Jugar $"
    exitButtom db "Q:Salir $"
    authors db "Jose Ignacio Alfaro, Moises Vindas, Alejandro Umana $"
    estadistica db 'ESTADISTICAS DEL JUEGO$'
        
    
    
    
    ;Info players
    
    player1 db "Jugador 1:       $"
    player2 db "Jugador 2:       $"
    player3 db "Jugador 3:       $"    

    
    ;Variables dentro de play
    confJuego db "OPCIONES DE JUEGO... $"
    
    cantPlayer db "Digite la cantidad de jugadores:  $"
    players db ?
    
    
    playersCount db "1"
    
    
    
    
    
    charPlayer1 db "Digite el caracter del jugador 1:  $"
    charPlayer2 db "Digite el caracter del jugador 2:  $"
    charPlayer3 db "Digite el caracter del jugador 3:  $"  
    
    error db "Cantidad de jugadores incorrecta... Intente de nuevo...  $"
         
         
         
    ;Pantalla del juego
    
    character1 db "0$"
    character2 db "0$"
    character3 db "0$"
    
    charScore db "Puntaje: $"
    
    
    score1 dw ?,"$"
    score2 dw ?,"$"
    score3 dw ?,"$"
    
    
    reset db "R:Reset$"
    giveUp db "G:Rendirse$"  
    
    
    matrizFila db "===============================$" 
    matrizColum db "º  º  º  º  º  º  º  º  º  º  º$"
    
    
    xCont db "10"
    yCont db "10"
    
    
    
    ;Dentro de juego
    
    labelTopo db "Caracter topo: $"
    
    moleCharacter1 db ?,"$"
    
    moleCharacter2 db ?,"$"
    
    moleCharacter3 db ?,"$" 
                
    moleBlanco db " $"
    
    character db ?
    
    deleteMole db "                   $"
    
    jugando db ?
    
    level dw 1
    
    
    whiteSpace db "             $"
    
    ;Random 
        numerox db 0
        
        numeroy db 0
    
        
    ;Mouse
    mouseX dw 0
    textoX db 0
    
    
    
    mouseY dw 0
    textoY db 0 
    
    
    click db ?
    
    ;Juego
       nivel dw ?
       
       colorTopo db 1
       
       azul db 01h
       
       rojo db 04h
    
       clickTopo db ?,"$"
       
       colorMole db ?,"$"
       
       contaMouse dw 40
       
       
    
    ;Macro color en los topos
    imprimirColor macro caracter, color
	mov al,caracter 
	mov bl,color 
	mov cx, 1h
	mov ah,09h 
	int 10h
	
    ENDM 
    
    
    
    
    beep macro                 ;Sonido del beep
    mov ah,2h
    mov dl,07h
    int 21h 
    ENDm
    
    
    
    
    
    
    
    
    
  ;Level Labels
  lvl1 db "Baby Level 1 $"
  lvl2 db "Soft Level 2 $"
  lvl3 db "Medium Level 3$"
  lvl4 db "Hard Level   4$"
  lvl5 db "Brutal Level 5$"
  
  
  
  
  
  
  ;Rendirse
    give db "El oponente se ha rendido :) $"
    
    winner db "Ganador: $"
    
    
    
  
  
  
  
    
    
 ;************************Variables de topos*********************************************
 
            
      
 
 
 
 
 
 
 
 
 
 
 
 ;*****************************************************************************************
    
    
;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
imprimir_caracter macro caracter   ;imprime el caracter
        
        mov ah, 09h             ;Imprime un caracter
        mov al, caracter        ;Caracter ascii del topo
        mov bh, 00h             ;Pagina del modo texto
        mov bl, 0eh             ;Color del caracter a imprimir
        mov cx, 01              ;Cantidad de veces a imprimir el caracter
        int 10h 
        
    endm
    
    posTexto macro pos_click,pos_texto
        
        mov ax,pos_click
        mov bl,8
        div bl
        mov pos_texto,al
        
    endm
    
    
    leer_caracter macro clickTopo, colorMole
        mov ah,08h
        mov bh,0
        int 10h
        
        mov clickTopo,al 
        mov colorMole, ah
        
        endm
    
    
 mov_cursor macro x, y    ;gotoxy     ;Mueve el cursor a la pocision x,y de la pantalla
        mov ah, 02h
        mov bh, 0
        mov dh, y
        mov dl, x
        int 10h   
    endm  


;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*    
    
    
    
   ;Macro de impresion de topos
    
    imprimir_topos macro numerox, numeroy, nivel, character
        mov si, 0
        ;mov cx,"2"
            randomx:    
            	mov ah, 2Ch
            	int 21h
            
            	mov numerox, dl
                
                cmp nivel, si
                je nivelJuego
                
                
                
                                     
            	cmp numerox, 31
            	je randomy
            
            	cmp numerox, 34
            	je randomy
            	
            	cmp numerox, 37
            	je randomy
            
            	cmp numerox, 40
            	je randomy
            
            	cmp numerox, 43
            	je randomy
            
            	cmp numerox, 46
            	je randomy
            
            	cmp numerox, 49
            	je randomy
            
            	cmp numerox, 52
            	je randomy
            
            	cmp numerox, 55
            	je randomy
            
            	cmp numerox, 58
            	je randomy
            
            
                jmp randomx
  
	randomy:
    
        mov ah, 2Ch
    	int 21h
    
        mov numeroy, dl
   
     	cmp numeroy, 3
		je imprimir

  		cmp numeroy, 5
		je imprimir
		
		cmp numeroy, 7
		je imprimir

		cmp numeroy, 9
		je imprimir

		cmp numeroy, 11
		je imprimir

		cmp numeroy, 13
		je imprimir

		cmp numeroy, 15
		je imprimir

		cmp numeroy, 17
		je imprimir

		cmp numeroy, 19
		je imprimir

		cmp numeroy, 21
		je imprimir                           
    
   
        jmp randomy
         
	imprimir:
	
	       cmp colorTopo, 1
	       je imprimir_rojo
	       
	       cmp colorTopo,2
	       je imprimir_azul
	       
	       
	       imprimir_rojo:    
           	gotoxy numeroy, numerox   
           	imprimirColor character, rojo
           	mov colorTopo, 2 
           	inc si
           	jmp randomx
            
           
           imprimir_azul:
            gotoxy numeroy, numerox   
           	imprimirColor character, azul
           	mov colorTopo, 1 
           	inc si
           	jmp randomx
            
            
    endm    
        
        
        

mouseMacro macro 
    
    mov ax, 00h ;utilizar mouse
    int 33h
    
    mov ax, 03h
    int 33h
  
    mov mouseX,cx  ;se guarda la posicion x del cursor
    
    mov mouseY,dx  ;se guarda la posicion y del cursor
    
    shl bl, 2 ;Se corre para obtener la posicion de los clicks
    
  
  
    
    cmp bl,0100b ;Compara click izquierdo
    je topo
    
    cmp bl, 1000b ;Compara click derecho
    je topo
    
    
        
        
    endm        
        
        
        
        
        
        
        
        
        
        
        
    
.code
    mov ax,@data
    mov ds,ax
    
    ;mov ah,00h      
    ;mov al,02h                  ;establece modo texto 80x25
    ;mov bh,00        
    int 10h                                
    

start:

    

    gotoxy 1,30
    imprime introGame 
    
    gotoxy 22,2
    imprime authors
    
    
    gotoxy 5,1
    imprime playButtom
                           ; Se imprime en pantalla los botones y la bienvenida
    gotoxy 5,14
    imprime exitButtom
    
    ;:call mouse
    
    
     
    
    lee_caracter
    cmp al, "P"
    je play
    cmp al, "p"
    je play                ;Salta a la etiqueta play donde pedimos la cant de jugadores
    
    cmp al, "Q"
    je exit 
    cmp al, "q"
    je exit 
     
    jmp start 
     
     


play:
    limpiar 07h
    
    gotoxy 2,30
    imprime confJuego
    
    gotoxy 5,22
    imprime cantPlayer
    
    lee_caracter
    
    mov players, al
    
    cmp players, "2"
    je twoplayer
    
    cmp players, "3"
    je threeplayer
    
    
    
    jmp errorPlayer
    
    
    
    
    
    
twoplayer:
         gotoxy 8,2
         imprime charPlayer1
         lee_caracter          ;Toma los caracteres de los jugadores y los agrega a las variables
         mov character1, al
         
         
         gotoxy 10,2
         imprime charPlayer2
         lee_caracter
         mov character2, al
         
         mov ah,1
         int 21h
         
         
         
         jmp drawGame1
         








threeplayer:
           
         gotoxy 8,2
         imprime charPlayer1
         lee_caracter          ;Toma los caracteres de los jugadores y los agrega a las variables
         mov character1, al
         
         
         gotoxy 10,2
         imprime charPlayer2
         lee_caracter
         mov character2, al
         
         
         gotoxy 12,2
         imprime charPlayer3
         lee_caracter
         mov character3, al
        
         
         
         mov ah,1
         int 21h
         
         jmp drawGame2
         
 
            
            
    
    
drawGame1:

        limpiar 07h
        
        gotoxy 1,2
        imprime player1          ;Imprime el marco del juego con los jugadores y puntaje
        
        gotoxy 1,13 
        imprimeColor character1
        
        gotoxy 1,15
        imprime charScore
        imprime score1
        
        gotoxy 1,30
        imprime player2          ;Imprime el marco del juego con los jugadores y puntaje
        
        gotoxy 1,41 
        imprimeColor character2   
        
        gotoxy 1,44
        imprime charScore
        imprime score2
       
        
        gotoxy 23,2
        imprime giveUp
                                             
        gotoxy 23,14
        imprime reset
        
        gotoxy 23, 70
        imprime exitButtom
        
        jmp matriz



        
puntuacion2 proc
    limpiar
    mov ax,score1
    mov bx,score2
    mov cx,score3
    
    cmp ax,bx
    jg  result
    
    cmp bx,cx
    jg  mayor2
    
    mov dx,cx
    jmp impmayor3
    
    result:
        cmp ax,cx
        jg mayor1
        
    mayor1:
        mov dx,ax
        jmp impmayor1
        
    mayor2:
        mov dx,bx
        jmp impmayor2
        
    impmayor1:
        gotoxy 6,4
        imprime estadistica
        
        gotoxy 6,7
        imprimeColor character1
     
        gotoxy 8,7
        imprime character2
       
        gotoxy 10,7
        imprime character3
        
        gotoxy 15,2
        imprime reset
        
        gotoxy 15,70
        imprime exitButtom
        jmp loopEspera
        
    impmayor2:
        gotoxy 6,4
        imprime estadistica
        gotoxy 6,6
        imprimecolor character2
        gotoxy 6,8
        imprime character1
        gotoxy 6,10
        imprime character3
        
        gotoxy 23,2
        imprime reset
        
        gotoxy 23,70
        imprime exitButtom
        jmp loopEspera
        
    impmayor3:
        gotoxy 6,4
        imprime estadistica
        gotoxy 6,6
        imprimecolor character3
        gotoxy 6,8
        imprime character1
        gotoxy 6,10
        imprime character2
        
        gotoxy 23,2
        imprime reset
        
        gotoxy 23,70
        imprime exitButtom
        jmp loopEspera
    
endp        
 
 
 
 
 
 
puntuacion1 proc
    limpiar
    imput1:
        gotoxy 6,4
        imprime estadistica
        gotoxy 7,4
        imprimecolor character1
        gotoxy 8,4
        imprime character2
        jmp loopEspera
        
    inicio:
        mov ax,score1
        mov bx,score2
        
        cmp ax,bx
        jg imput1
        jl imput2
    imput2:
        gotoxy 6,4
        imprime estadistica
        gotoxy 7,4
        imprimecolor character2
        gotoxy 8,4
        imprime character1
        jmp loopEspera
        
 endp 

drawGame2:
        limpiar 07h
        
        gotoxy 1,2
        imprime player1          ;Imprime el marco del juego con los jugadores y puntaje
        
        gotoxy 1,13 
        imprimeColor character1
        
        gotoxy 1,15
        imprime charScore
        imprime score1
        
        gotoxy 1,28
        imprime player2          ;Imprime el marco del juego con los jugadores y puntaje
        
        gotoxy 1,39 
        imprimeColor character2
        
        gotoxy 1,42
        imprime charScore
        imprime score2
        
        gotoxy 1,54
        imprime player3
        
        gotoxy 1,65
        imprimeColor character3
        
        gotoxy 1,68
        imprime charScore
        imprime score3
        
        
        gotoxy 23,2
        imprime reset
        
        gotoxy 23,70
        imprime exitButtom
        
        jmp matriz
     
matriz:
      
      mov cx, 10
      mov xCont, 2
      mov yCont, 30
      
      matrizX:
        
        gotoxy xCont,yCont
        
        imprime matrizFila
        
        inc xCont                   ;Genera la matriz y pide el catacter del topo 
        
        
        gotoxy xCont, yCont
        imprime matrizColum
        
        inc xCont
        
        loop matrizX
        
        gotoxy xCont,yCont
        imprime matrizFila
       
        
        






escogerCaracter:
           cmp players, "2"
           je escogerTwo
           
           
           cmp players, "3"
           je escogerThree
           
           ;cmp playersCount, "9"
           ;jmp estadisticas
 
           
               escogerTwo:
                   cmp playersCount, "1"
                   je asignarCaracter1
                   
                   cmp playersCount, "2"
                   je  asignarCaracter2
                   
                       asignarCaracter1:
                            
                            gotoxy 4,0
                            
                            imprime labelTopo
                            mov ah,01
                            int 21h     
                            mov moleCharacter1, al
                            mov character, al
                            mov playersCount, "2"
                            mov jugando, "1"
                            gotoxy 4,0
                            imprime deleteMole
                            
                            jmp imprimirTopo 
                            
                       asignarCaracter2:
                            gotoxy 4,0
                            
                            imprime labelTopo
                            mov ah,01
                            int 21h     
                            mov moleCharacter2, al
                            mov character, al
                            mov jugando, "2"
                            mov playersCount, "9"
                            gotoxy 4,0
                            imprime deleteMole
                           
                            jmp imprimirTopo
           
            
        
  
                 escogerThree:
                   cmp playersCount, "1"
                   je asignarTopo1
                   
                   cmp playersCount, "2"
                   je  asignarTopo2
                   
                   
                   cmp playersCount, "3"
                   je asignarTopo3
                   
                   ;cmp playersCount
                   ;je estadisticas
                        
                        
                        asignarTopo1:
                            gotoxy 4,0
                            
                            imprime labelTopo
                            mov ah,01
                            int 21h     
                            mov moleCharacter1, al
                            mov character, al
                            mov playersCount, "2"
                            mov jugando, "1"
                            gotoxy 4,0
                            imprime deleteMole
                           
                            jmp imprimirTopo
                            
                            
                        asignarTopo2:
                            gotoxy 4,0
                            
                            imprime labelTopo
                            mov ah,01
                            int 21h     
                            mov moleCharacter2, al
                            mov character, al
                            mov playersCount, "3"
                            mov jugando, "2"
                            gotoxy 4,0
                            imprime deleteMole
                      
                            jmp imprimirTopo
                            
                            
                            
                            
                        asignarTopo3:
                            gotoxy 4,0
                            
                            imprime labelTopo
                            mov ah,01
                            int 21h     
                            mov moleCharacter3, al
                            mov character, al
                            mov jugando, "3"
                            mov playersCount, "9"
                            gotoxy 4,0
                            imprime deleteMole
                       
                            jmp imprimirTopo
                            
                   
                   

    
topo:
    posTexto mouseX,textoX
    posTexto mouseY,textoY 
    
    mov_cursor textoX,textoY
    
    leer_caracter clickTopo, colorMole
                                    ;Se usa para aumentar el puntaje... falta comparar
    cmp jugando, "1"
    je  validarPuntaje1
     
    
    cmp jugando, "2"
    je validarPuntaje2
    
    cmp jugando,"3"
    je validarPuntaje3



imprimirTopo:
        imprimir_topos numerox,numeroy, nivel, character            
        jmp nivelJuego



limpiarM:
       
        mov cx, 10
        mov xCont, 2
        mov yCont, 30
        
        gotoxy 20,0
        
      
      matrizAux:
        
        gotoxy xCont,yCont
        
        imprime matrizFila
        
        inc xCont                   ;Genera la matriz y pide el catacter del topo 
        
        
        gotoxy xCont, yCont
        imprime matrizColum
        
        inc xCont
        
        loop matrizAux
        
        gotoxy xCont,yCont
        imprime matrizFila
        
        je imprimirTopo







        
finNivel:
   lee_caracter


errorPlayer:
          gotoxy 8,2    
          imprime error
          mov ah,1
          int 21h
          jmp play 



validarPuntaje1:
        cmp moleCharacter1, al
        je sumarpuntaje1
        jne restarPuntaje1


sumarpuntaje1:
        add score1,10
        gotoxy textoY, textoX
        imprime moleBlanco
        
        
        gotoxy 1,24
        mov ax,score1
        mov bx,10             
        mov dx,0000h
        mov cx,0000h
        
        
        meterPila:
        mov dx,0000h
        div bx                     
        push dx
        inc cx
        cmp ax,0
        jne meterPila
        
        sacarPila:
        pop dx
        add dx,30h                
        mov ah,02h
        int 21h
        loop sacarPila
        
        jmp nivelJuego






restarpuntaje1:
        cmp score1,0
        je proc1
        jne proc2
       
        proc2:
            sub score1,10
            
        proc1:
            gotoxy textoY, textoX
            imprime moleBlanco
            
            gotoxy 1,24
            mov ax,score1
            mov bx,10             
            mov dx,0000h
            mov cx,0000h
            
            
            meterPila2:
            mov dx,0000h
            div bx                     
            push dx
            inc cx
            cmp ax,0
            jne meterPila2
            
            sacarPila2:
            pop dx
            add dx,30h                 
            mov ah,02h
            int 21h
            loop sacarPila2
        
        
        
        
        jmp sonido




validarPuntaje2:
        cmp moleCharacter2, al 
        je sumarpuntaje2
        jne restarPuntaje2
       









sumarpuntaje2:
        add score2,10
        gotoxy textoY, textoX
        imprime moleBlanco
        
        
        gotoxy 1,53
        mov ax,score2
        mov bx,10             
        mov dx,0000h
        mov cx,0000h
        
        
        meterPila3:
        mov dx,0000h
        div bx                     
        push dx
        inc cx
        cmp ax,0
        jne meterPila3
        
        sacarPila3:
        pop dx
        add dx,30h                
        mov ah,02h
        int 21h
        loop sacarPila3
        
        jmp nivelJuego    
       
        
        






restarpuntaje2:
        cmp score2,0
        je proc3
        jne proc4
       
        proc4:
            sub score2,10
            
        proc3:
            gotoxy textoY, textoX
            imprime moleBlanco
            
            gotoxy 1,53
            mov ax,score2
            mov bx,10             
            mov dx,0000h
            mov cx,0000h
            
            
            meterPila4:
            mov dx,0000h
            div bx                     
            push dx
            inc cx
            cmp ax,0
            jne meterPila4
            
            sacarPila4:
            pop dx
            add dx,30h                 
            mov ah,02h
            int 21h
            loop sacarPila4
        
        
        jmp sonido





validarPuntaje3:
        cmp moleCharacter3, al
        je sumarpuntaje3
        jne restarPuntaje3
        









sumarpuntaje3:
        add score3,10
        gotoxy textoY, textoX
        imprime moleBlanco
        
        
        gotoxy 1,77
        mov ax,score3
        mov bx,10             
        mov dx,0000h
        mov cx,0000h
        
        
        meterPila5:
        mov dx,0000h
        div bx                     
        push dx
        inc cx
        cmp ax,0
        jne meterPila5
        
        sacarPila5:
        pop dx
        add dx,30h                
        mov ah,02h
        int 21h
        loop sacarPila5
        
        
        jmp nivelJuego






restarpuntaje3:
        cmp score3,0
        je proc5
        jne proc6
       
        proc6:
            sub score3,10
            
        proc5:
            gotoxy textoY, textoX
            imprime moleBlanco
            
            gotoxy 1,77
            mov ax,score3
            mov bx,10             
            mov dx,0000h
            mov cx,0000h
            
            
            meterPila6:
            mov dx,0000h
            div bx                     
            push dx
            inc cx
            cmp ax,0
            jne meterPila6
            
            sacarPila6:
            pop dx
            add dx,30h                 
            mov ah,02h
            int 21h
            loop sacarPila6
        
        
        jmp sonido

      



cambioNivel:
    cmp level, 1
    je cambio2
    
    cmp level, 2
    je cambio3
    
    cmp level, 3
    je cambio4
    
    cmp level, 4
    je cambio5
    
    cmp level, 5
    je cambio6
    
    cmp level, 6
    je cambioJugador
    
   
   
   
cambio2:
      mov level, 2  ;Nivel del juego
      mov nivel, 6 ;Cantidad de topos a imprimir
      mov contaMouse, 30 ; Bajar cantidad cantidad de "loops"
      gotoxy 10,2
      imprime lvl1
      jmp imprimirTopo

cambio3:
    mov level, 3
    mov nivel, 8
    mov contaMouse, 25
    gotoxy 10,2
    imprime whiteSpace
    gotoxy 10,2
    imprime lvl2
    
    jmp limpiarM
    
    
    
    
cambio4:
    mov level, 4
    mov nivel, 10
    mov contaMouse, 15
    gotoxy 10,2
    imprime whiteSpace
    gotoxy 10,2
    imprime lvl3
    
    jmp limpiarM

cambio5:
    mov level, 5
    mov nivel, 12                                         
    mov contaMouse, 5
    gotoxy 10,2
    imprime whiteSpace
    gotoxy 10,2
    imprime lvl4
    
    jmp limpiarM


cambio6:
    mov level, 6
    mov nivel, 10
    mov contaMouse, 5
    gotoxy 10,2
    imprime whiteSpace
    gotoxy 10,2
    imprime lvl5
    
    jmp limpiarM


cambioJugador:
      cmp players, "2"
      je cambio_jugador2
      
      cmp players, "3"
      je cambio_jugador3
      
       
      
cambio_jugador2:
      mov level, 1
      mov contaMouse, 40
      
      cmp playersCount, "9"
      je puntuacion1
      
      
      cmp playersCount, "2"
      je matriz      
      
      
      
cambio_jugador3:
      mov level, 1
      mov contaMouse, 40        
      
      cmp playersCount, "9"
      je puntuacion2
      
      
      cmp playersCount, "2"
      je matriz 
      
      
      cmp playersCount, "3"
      je matriz
      
      

rendirse:
    cmp players, 3
    je sonido
    
    cmp players, 2
    je compararGano
    
    
    
compararGano:
        
       cmp jugando, "1"
       je gano2
       
       cmp jugando, "2"
       je gano1
       


gano2:
    
        limpiar   ;Limpia la pantalla
    
      gotoxy 2,30
    
      imprime give    ;Imprime el mensaje de que se rindio y tira el jugador ganador
    
      gotoxy 22,22
      imprime winner
     
      imprime character2
        
      gotoxy 23,2
      imprime reset
        
      gotoxy 23,70
      imprime exitButtom     
        
        
        loopEspera:
                  
                
                 mov ah, 1
                 int 16h
                 jz loopEspera
    
                 mov ah, 0
                 int 16h
                 
     
                 cmp al, "Q"     ;Salir
                 je exit
                 
                                   ;Reset el topo 
                 cmp al, "R"
                 je resetea 
                 
                 
                 jmp loopEspera       
    
     
   
   
        
    
         
      
gano1:
      
      limpiar   ;Limpia la pantalla
    
      gotoxy 2,30
    
      imprime give    ;Imprime el mensaje de que se rindio y tira el jugador ganador
    
      gotoxy 22,22
      imprime winner
     
      imprime character1
        
      gotoxy 23,2
      imprime reset
        
      gotoxy 23,70
      imprime exitButtom    
        
        
        loopEspera1:
                
                 mov ah, 1
                 int 16h
                 jz loopEspera1
    
                 mov ah, 0
                 int 16h
                 
     
                 cmp al, "Q"     ;Salir
                 je exit
                 
                                   ;Reset el topo 
                 cmp al, "R"
                 je resetea 
                 
                 
                 jmp loopEspera1      
      
      
      
      
      
      
             
      
 
      
      
sonido:
    beep
    jmp nivelJuego          
             




resetea:
    
    
    xor ax,ax
    xor bx,bx
    xor cx,cx
    xor dx,dx 
    limpiar 
    jmp start
    
    
    
    
    
;-*-*-*-*-*-*-*-*-*-*JUEGO NIVELES *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
 nivelJuego:
  
    mouseMacro
    
    dec contaMouse  ;40 
    
    cmp contaMouse, 0
    je cambioNivel
    
    mov ah, 1
    int 16h
    jz nivelJuego
    
    mov ah, 0
    int 16h
    
    
    cmp al, "G"     ;G rendirse
    je rendirse
    
    
    cmp al, "Q"     ;Salir
    je exit        
    
     
    cmp al, "R"
    je resetea      ;Reset 
    
   
    jne sonido
    




 

exit: 
    mov ax, 4c00h
    
    