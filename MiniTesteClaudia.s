#Mini Teste

.data

#testar
#tab: .word 30, -10, 50, 130, 80, 40, 20, 60

.text
.globl limpa_inliers

#testar
#la $a0, tab
#li $a1, 8 #tamanho tabela
#li $a2, 25 #limiar inferior
#li $a3, 80 #limiar superior

limpa_inliers:
li $v0, 0
li $t0, 0 #indice

inliers:

beq $t0, $a1, EXIT
lw $t1, 0($a0) #t1="30"

li $t2, 0
slt $t2, $t1, $a2 #if t1<lim inf -> nao se altera
beq $t2, 1, next

li $t3, 1
slt $t3, $t1, $a3 #if t1>=lim sup -> nao se altera
beq $t3, 0, next

sw $0, 0($a0) #colocar valor a zero
addi $v0, $v0, 1

next:
addi $t0, $t0, 1
addi $a0, $a0, 4
j inliers

EXIT:
jr $ra

#testar
#la $a1, tab
#lw $t4, 28($a1) #28: indice 8, numero 59, deve dar 1
#move $a0, $t4 #argument (a0)
#li $v0, 1 #code for print_int
#syscall
