LUI $t0, 4097
ORI $t1, $t0, 256
LW $t2, 0($t1)

ORI $t3, $t0, 260 
LW $t4, 0($t3)
BGT $t4, $t2, REV_SUB
SUB $t5, $t2, $t4

REV_SUB:
SUB $t5, $t4, $t2
j DONE

DONE:
SW $t5, 268501256($zero)