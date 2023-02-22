data segment
        msg1 db  10,13,"Hello World",'$'
        msg2 db 10,13,"Enter the count: ",'$'
        
data ends
code segment
        assume cs:code,ds:data
start:
        mov ax,data
        mov ds,ax
        lea dx,msg2
        mov ah,09h
        int 21h
        mov ah,01h
        int 21h
        sub al,30h
        mov cl,al
repeat:
        lea dx,msg1
        mov ah,09h
        int 21h
        dec cl
        jnz repeat

        mov ah,4ch
        int 21h
code ends
end start
        
