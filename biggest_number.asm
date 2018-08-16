include  c:\masm32\include\masm32rt.inc

.686p
.mmx

.data

data           dd     3,67,34,222,45,75,54,24,44,33,22,11,66,0
array_len      =      LENGTHOF data 

.data?


.code
start:

    mov    esi, offset data
    mov    eax, [esi]
    mov    ecx, array_len
    
    _loop:
        
        mov     ebx, [esi]
        cmp     ebx, eax
        cmovge  eax, ebx
        
        add     esi, 4
        
        loop     _loop
        
    _end_loop:
    
    print str$(eax)        
   
    push    0
    call    ExitProcess
   
END  start