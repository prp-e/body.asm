global _start 

section .data
 align 2
 str1 db 'Enter color of head: '
 str1Len equ $-str1
 str2 db 'Enter color of tongue: '
 str2Len equ $-str2
 beheadNote db 'The person is beheaded', 0x0a
 beheadNoteLen equ $-beheadNote
 aliveNote db 'The person remains alive', 0x0a
 aliveNoteLen equ $-aliveNote

section .bss
 head resb 10
 tongue resb 10


; Use g for Green and r for Red. 


section .text
 _start:
  mov edx, str1Len
  mov ecx, str1
  mov ebx, 1
  mov eax, 4
  int 0x80

  mov eax, 3
  mov ebx, 2
  mov ecx, head
  mov edx, 10
  int 0x80
  
  mov edx, head
  cmp edx, 'g'
  je tongueCheck
  

 tongueCheck:
  mov edx, str2Len
  mov ecx, str2
  mov ebx, 1
  mov eax, 4
  int 0x80
  
  mov eax, 3
  mov ebx, 2
  mov ecx, tongue
  mov edx, 10
  int 0x80

  mov edx, tongue
  cmp edx, 'r'
  je behead
  jne alive
  

  behead:
  mov edx, beheadNoteLen
  mov ecx, beheadNote
  mov ebx, 1
  mov eax, 4
  int 0x80


 alive:
  mov edx, aliveNoteLen
  mov ecx, aliveNote
  mov ebx, 1
  mov eax, 4
  int 0x80


  
  mov eax, 1
  int 0x80
