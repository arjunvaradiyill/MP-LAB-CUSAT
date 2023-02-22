data segment
        msg1 db "Enter a string: ",'$'
        msg2 db "Number of vowels: ",'$'
data ends
display macro msg
        lea dx,msg
        mov ah,09h
        int 21h
endm
code segment
        assume ds:data,cs:code
start:
        mov ax,data
        mov ds,ax
        mov cl,00h
        display msg1
input:
        mov ah,01h
        int 21h
        cmp al,"a"
        je ok
        cmp al,"e"
        je ok
        cmp al,"i"
        je ok
        cmp al,"o"
        je ok
        cmp al,"u"
        je ok
        cmp al,"A"
        je ok
        cmp al,"E"
        je ok
        cmp al,"I"
        je ok
        cmp al,"O"
        je ok
        cmp al,"U"
        je ok
        cmp al,0dh
        je done
        jmp input
ok:
        inc cl
        jmp input
done:
        display msg2
        mov dl,cl
        add dl,30h
        mov ah,02h
        int 21h
        mov ah,4ch
        int 21h
code ends
end start
