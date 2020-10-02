#IMT2018085

LUI $s5, 4097
LUI $s0, 4097
ORI $s5, $s5, 256
ADDI $t0, $zero, 0 #i=0
ADDI $t1, $zero, 0 #j=0
j CREATE_ARRAY 

CREATE_ARRAY: #till i<N (here N=5)
BEQ $t0, 5, EXIT_LOOP #assuming array size is 5 (i.e N=5)
SW $t0, ($s0) #A[i] = i
ADDI $s0, $s0, 4 #going to next word in array
ADDI $t0, $t0, 1 #i+=1
j CREATE_ARRAY

EXIT_LOOP:
MUL $t0, $t0, 4
SUB $s0, $s0, $t0
LW $t7, 0($s0)
SW $t7, 0($s5)
j FIND_MAX

FIND_MAX:
BEQ $t1, 5, DONE #assuming array size is 5 (i.e N=5)
LW $t7, 0($s0)
LW $t8, 0($s5)
BGT $t7, $t8, CHANGE_MAX #change max if A[i]>max
j CONTINUE_LOOP

CONTINUE_LOOP:
ADDI $s0, $s0, 4 #going to next word in array
ADDI $t1, $t1, 1 #increment j
j FIND_MAX

CHANGE_MAX:
SW $t7, 0($s5) #set value in $t7 i.e A[i] as max
j CONTINUE_LOOP

DONE:


