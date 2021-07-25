            LHI      R2, (A>>16)&0xFFFF  
            ADDUI    R2, R2, A&0xFFFF
            LHI      R3, (B>>16)&0xFFFF  
            ADDUI    R3, R3, B&0xFFFF
            ADDU     R4, R0, R3
      loop:  
            LD     F0, 0(R2)
            LD     F4, 0(R3)
            ADDD   F0, F0, F4  
            ADDD   F2, F0, F2 ;; <- A stall is found (an example of how to answer your questions)
            ADDI   R2, R2, #8  
            ADDI   R3, R3, #8  
            SUB    R5, R4, R2  
            BNEZ   R5, loop  
            TRAP   #0         ;; Exit <- this is a comment !! 
      A:    .double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  
      B:    .double 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  
