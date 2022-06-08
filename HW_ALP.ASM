PRINT macro str
  mov ah, 09h
  lea dx, str
  int 21h
endm

EXIT macro
  mov ah, 4ch
  int 21h
  end
endm

.model
.data
  message db "Hello World$"
.code
  mov ax, @data
  mov ds, ax

  PRINT message
  EXIT