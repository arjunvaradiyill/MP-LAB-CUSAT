data segment
        word1 db "abracadabraaaaa",'$'
        letter db "a"
    
data ends
code segment
        assume ds:data, cs:code
start:
        mov ax,data
        mov ds,ax
        lea si,word1
        lea di,letter
        mov bh,00h
        mov cl,0fh
check:
        mov ah,[si]
        mov bl,[di]
        cmp ah,bl
        jnz next
        inc bh
next:
        inc si
        loop check
        mov al,bh
        add al,30h       ;converting hexa into ascii
        mov dl,al
        mov ah,02h
        int 21h
        mov ah,4ch
        int 21h
code ends
end start
