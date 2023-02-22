data segment
        msg1 db "OraNgE",'$'
        msg2 db "Entered word is OraNgE",'$'
        msg3 db 10,13, "After case change: ",'$'
        count db 6
data ends
display macro msg
        lea dx,msg
        mov ah,09h
        int 21h
endm
code segment
        assume ds:data, cs:code
start:
        mov ax,data
        mov ds,ax
        display msg2
        display msg3
        lea si,msg1
        mov cl,count
check:
        mov ah,[si]
        xor ah,20h
        mov dl,ah
        mov ah,02h
        int 21h
        inc si
        loop check
        mov ah,4ch
        int 21h
code ends
end start

