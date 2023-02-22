data segment
        msg1 db "Enter a number",'$'
        msg2 db 10,13, "Number is Even",'$'
        msg3 db 10,13, "Number is Odd",'$'
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
        mov dl,02h
        div dl
        cmp ah,0h
        jnz odd
        display msg2
        jmp done
odd:
        display msg3
done:
        mov ah,4ch
        int 21h
code ends
end start
