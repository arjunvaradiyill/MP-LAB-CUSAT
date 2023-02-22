data segment
        msg1 db "Enter a Character: ",'$'
        msg2 db 10,13, "Entered character is ",'$'
        msg3 db "'",'$'
        msg4 db "'",'$'
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

        display msg1
        mov ah,01h
        int 21h

        display msg2
        display msg3

        mov dl,al
        mov ah,02h
        int 21h

        display msg4

        mov ah,4ch
        int 21h
code ends
end start
