data segment
        msg1 db "Enter a string: ",'$'
        msg2 db 10,13, "Reversed string is: ",'$'
data ends
display macro msg
        lea dx,msg
        mov ah,09h
        int 21h
endm
code segment
        assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        display msg1
        mov cl,00h
input:
        mov ah,01h
        int 21h
        mov [di],al
        inc di
        inc cl
        cmp al,0dh
        jnz input
        sub di,02h
        dec cl
        display msg2

output:
        mov dl,[di]
        mov ah,02h
        int 21h
        dec di
        dec cl
        jnz output
        mov ah,4ch
        int 21h
code ends
end start
        
