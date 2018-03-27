.data
msg1: .asciiz "\nEnter integer values\n"
msg2: .asciiz ","
msg3: .asciiz "Bubble Sort"
msg4: .asciiz "########pass########"
msg5: .asciiz "\n"
msg6: .asciiz "\nNumber list has been sorted\n"

.globl main
main:
move $s0,$gp

addi $t0,1
add $t1,$zero,$zero
add $t2,$zero,$zero
add $t3,$zero,$zero

sub $t7,$zero,1

li $v0,4
la $a0,msg1
syscall


add $s1,$s0,$zero

entervalues:

li $v0,4
la $a0,msg1
syscall
li $v0,5
syscall

beq $v0,$t7,bubblesort

sb $v0,0($s1)
addi $s1,1
add $t5,$s1,$zero
j entervalues

bubblesort:

add $t4,$s0,$zero
addi $t6,1
sub $s1,$s1,$t0
beq $s1,$s0,ending

add $s2,$s0,$zero

loopinterno:

lb $t1,0($s2)
lb $t2,1($s2)
slt $t3,$t2,$t1
beq $t3,$zero,proximo
sb $t2,0($s2)
sb $t1,1($s2)

proximo:

addi $s2,1
bne $s2,$s1,loopinterno

li $v0,4
la $a0,msg5
syscall

li $v0,4
la $a0,msg5
syscall

li $v0,4
la $a0,msg5
syscall

imprime:

li $v0,1
lb $a0,0($t4)
syscall

li $v0,4
la $a0,msg2
syscall

addi $t4,1
bne $t4,$t5,imprime

jal bubblesort

ending:
li $v0,4
la $a0,msg6
syscall
li $v0,5
syscall
