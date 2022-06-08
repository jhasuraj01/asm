print macro str
  mov ah, 09h     ; Display String
  lea dx, str
  int 21h
endm

print2 macro str
  mov ah, 09h     ; Display String
  lea dx, str+2   ; str[0] is buffer size, str[1] is string length
  int 21h
endm

exit macro
  mov ah, 4ch     ; Terminate the code properly and return to DOS Prompt
  int 21h
  end
endm

accept macro str
  mov ah, 0ah     ; Accept string input
  lea dx, str
  int 21h
endm

.model
.data
  newline db 0ah, 0dh, "$"
  askname db "Enter Your Name: $"
  myname db 25, ?, 25 dup("$")
  hello db "Hello $"
.code
  mov ax, @data
  mov ds, ax

  print askname
  accept myname
  print newline
  print hello
  print2 myname
  exit