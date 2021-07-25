            LHI     R2, (A>>16) & 0xFFFF  
            ADDUI   R2, R2, A & 0xFFFF  
            LHI     R3, (B>>16)&0xFFFF  
            ADDUI   R3, R3, B&0xFFFF  
      loop:  
            LW     R1, 0 (R2)  
            ADD    R1, R1, R3  
            SW     0(R2), R1  
            LW     R5, 0 (R1)  
            ADDI   R5, R5, #10  
            ADDI   R2, R2, #4  
            SUB    R4, R3, R2  
            BNEZ   R4, loop  
            TRAP   #0  
      A: .word 0, 4, 8, 12, 16, 20, 24, 28, 32, 36  
      B: .word 9, 8, 7, 6, 5, 4, 3, 2, 1, 0  
