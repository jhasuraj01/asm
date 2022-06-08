load_data_segment macro
  mov ax, @data
  mov ds, ax
endm

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

input_str macro str
  mov ah, 0ah     ; Accept string input
  lea dx, str
  int 21h
endm

input_char macro
  mov ah, 01h     ; Accept char input
  int 21h
endm

exit macro
  mov ah, 4ch     ; Terminate the code properly and return to DOS Prompt
  int 21h
  end
endm

show_menu macro
  print newline
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
  print newline
  print ask_input
endm

route_user_based_on_input macro
  input_char
  print newline
  mov bl, al    ; move user input from al to bl
  cmp bl, 31h   ; if choice is 1 (input char - (char) '1')
    je label_input_string
  cmp bl, 32h   ; if choice is 2 (input char - (char) '2')
    je label_calculate_string_length
  cmp bl, 33h   ; if choice is 3 (input char - (char) '3')
    je label_reverse_string
  cmp bl, 34h   ; if choice is 4 (input char - (char) '4')
    je label_check_palindrome
  jmp label_exit
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
  ask_input db "  Enter Your Choice: $"

  head_inps db "***    Input String    ***$"
  head_lens db "***  Length of String  ***$"
  head_revs db "*** Reverse the String ***$"
  head_pals db "***  Check Palindrome  ***$"

  string_01 db 25, ?, 25 dup("$")
.code
  load_data_segment
  
  label_menu:
    show_menu
    route_user_based_on_input

  label_input_string:
    print head_inps
    jmp label_menu

  label_calculate_string_length:
    print head_lens
    jmp label_menu

  label_reverse_string:
    print head_revs
    jmp label_menu

  label_check_palindrome:
    print head_pals
    jmp label_menu
  
  label_exit:
    exit