# In: $s1 = multiplier, $s2 = multiplicand
# Out: $t0 = result

.data
	x: .asciiz "\n x = \n"
	y: .asciiz "\n y = \n"
	mult: .asciiz "\n x * y = "
.text

	li $v0, 4
	la $a0, x
	syscall
	
	#nhap x
	li $v0, 5
	syscall
	
	#luu x vao thanh ghi t0
	move $s1,$v0
	
	li $v0, 4
	la $a0, y
	syscall
	
	#nhap y
	li $v0, 5
	syscall
	
	#luu gia tri y vao thanh ghi t0
	move $s2,$v0

move $t0,$zero      # result
mult_loop:
    andi $t1,$s1,1
    beq $t1,$zero,bit_clear
    addu $t0,$t0,$s2  
    
  
bit_clear:
    sll $s2,$s2,1     
    srl $s1,$s1,1     
    bne $s2,$zero,mult_loop
    
      li $v0, 4
	la $a0, mult
	syscall
	
	li $v0, 1
	addu $t0, $t0, $zero
	syscall