data segment
        msg1 db "Enter first no: ",'$'
        msg2 db 10,13, "Enter second no: ",'$'
        msg3 db 10,13, "Sum is: ",'$'
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
        mov ah,01h
        int 21h
        mov bh,al
        mov ah,01h
        int 21h
        mov bl,al
        display msg2
        mov ah,01h
        int 21h
        mov ch,al
        mov ah,01h
        int 21h
        mov cl,al

        mov ah,00h
        mov al,bl
        add al,cl
        aaa
        add ax,3030h
        mov bl,al

        mov al,bh
        add al,ch
        aaa
        add ax,3030h
        mov bh,al
        display msg3
        mov dl,bh
        mov ah,02h
        int 21h
        mov dl,bl
        mov ah,02h
        int 21h
        mov ah,4ch
        int 21h
code ends
end start
