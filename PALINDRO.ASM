data segment
        msg1 db "Enter string: ",'$'
        msg2 db "String is palindrome",'$'
        msg3 db "String is not palindrome",'$'
        var db 20 dup(0)
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
        mov si,00h
input:
        mov ah,01h
        int 21h
        cmp al,0dh
        jz down
        mov [var+si],al
        inc si
        loop input
down:
        mov di,00h
        dec si
        jnz check
check:
        mov al,[var+si]
         cmp al,[var+di]
        jnz fail
        inc di
        dec si
        jnz check
        display msg2
        jmp done
fail:
        display msg3
done:
        mov ah,4ch
        int 21h
code ends
end start
        

        
