load_data_segment macro
  mov ax, @data
  mov ds, ax
endm

print macro str
  mov ah, 09h     ; Display String
  lea dx, str
  int 21h
endm

exit macro
  mov ah, 4ch     ; Terminate the code properly and return to DOS Prompt
  int 21h
  end
endm

show_menu macro
  print menu
  print newline
  print menu_opt1
  print newline
  print menu_opt2
  print newline
  print menu_opt3
  print newline
  print menu_opt4
  print newline
  print menu_opt5
endm

.model
.data
  newline db 0ah, 0dh, "$"
  menu db "MENU:$"
  menu_opt1 db "  1. Accept$"
  menu_opt2 db "  2. Length$"
  menu_opt3 db "  3. Reverse$"
  menu_opt4 db "  4. Palindrome$"
  menu_opt5 db "  5. Exit$"
.code
  load_data_segment
  show_menu
  exit