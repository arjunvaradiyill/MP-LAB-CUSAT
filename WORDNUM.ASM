data segment
        msg1 db "How are you rizin$"
        
data ends
code segment
        assume ds:data,cs:code
start:
        mov ax,data
        mov ds,ax
        lea si,msg1
        mov bh,01h
check:
        mov ah,[si]
        cmp ah,"$"
        jz print
        cmp ah," "
        jnz next
        inc bh
next:
        inc si
        loop check
print:
        mov al,bh
        add al,30h
        mov dl,al
        mov ah,02h
        int 21h
        mov ah,4ch
        int 21h
code ends
end start

