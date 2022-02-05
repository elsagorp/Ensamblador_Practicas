.data
arg: .word 7

.text
begin:
lw a0, arg
jal ra,fact(int)
li a7, 1
ecall
end:
li a7, 10
ecall

fact(int):
        addi    sp, sp, -32
        sw      ra, 28(sp)                      # 4-byte Folded Spill
        sw      s0, 24(sp)                      # 4-byte Folded Spill
        addi    s0, sp, 32
        sw      a0, -12(s0)
        addi    a0, zero, 1
        sw      a0, -20(s0)
        sw      a0, -16(s0)
        j       .LBB0_1
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
        lw      a1, -16(s0)
        lw      a0, -12(s0)
        blt     a0, a1, .LBB0_4
        j       .LBB0_2
.LBB0_2:                                #   in Loop: Header=BB0_1 Depth=1
        lw      a0, -20(s0)
        lw      a1, -16(s0)
        mul     a0, a0, a1
        sw      a0, -20(s0)
        j       .LBB0_3
.LBB0_3:                                #   in Loop: Header=BB0_1 Depth=1
        lw      a0, -16(s0)
        addi    a0, a0, 1
        sw      a0, -16(s0)
        j       .LBB0_1
.LBB0_4:
        lw      a0, -20(s0)
        lw      s0, 24(sp)                      # 4-byte Folded Reload
        lw      ra, 28(sp)                      # 4-byte Folded Reload
        addi    sp, sp, 32
        jalr zero, ra, 0