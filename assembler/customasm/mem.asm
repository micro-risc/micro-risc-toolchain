; I-Type Loads

#ruledef {
    lb      %{rd: reg}, [%{rs1: reg} + #{imm: i12}]    => $le( imm @ rs1 @ 0x0 @ rd @ 0x02 )
    lh      %{rd: reg}, [%{rs1: reg} + #{imm: i12}]    => $le( imm @ rs1 @ 0x1 @ rd @ 0x02 )
    lw      %{rd: reg}, [%{rs1: reg} + #{imm: i12}]    => $le( imm @ rs1 @ 0x2 @ rd @ 0x02 )
    ld      %{rd: reg}, [%{rs1: reg} + #{imm: i12}]    => $le( imm @ rs1 @ 0x3 @ rd @ 0x02 )
    lbu     %{rd: reg}, [%{rs1: reg} + #{imm: i12}]    => $le( imm @ rs1 @ 0x4 @ rd @ 0x02 )
    lwu     %{rd: reg}, [%{rs1: reg} + #{imm: i12}]    => $le( imm @ rs1 @ 0x5 @ rd @ 0x02 )
    ldu     %{rd: reg}, [%{rs1: reg} + #{imm: i12}]    => $le( imm @ rs1 @ 0x6 @ rd @ 0x02 )
}

; S-Type Stores

#ruledef {
    sb      %{rs2: reg}, [%{rs1: reg} + #{imm: i12}]    => $le( imm[11:4] @ rs2 @ rs1 @ 0x0 @ imm[3:0] @ 0x03 )
    sh      %{rs2: reg}, [%{rs1: reg} + #{imm: i12}]    => $le( imm[11:4] @ rs2 @ rs1 @ 0x1 @ imm[3:0] @ 0x03 )
    sw      %{rs2: reg}, [%{rs1: reg} + #{imm: i12}]    => $le( imm[11:4] @ rs2 @ rs1 @ 0x2 @ imm[3:0] @ 0x03 )
    sd      %{rs2: reg}, [%{rs1: reg} + #{imm: i12}]    => $le( imm[11:4] @ rs2 @ rs1 @ 0x3 @ imm[3:0] @ 0x03 )
}