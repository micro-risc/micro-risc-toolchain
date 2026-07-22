; R-Type ALU

#ruledef {
    add     %{rd: reg}, %{rs1: reg}, %{rs2: reg}    => $le( 0x00 @ rs2 @ rs1 @ 0x0 @ rd @ 0x00 )
    sub     %{rd: reg}, %{rs1: reg}, %{rs2: reg}    => $le( 0x00 @ rs2 @ rs1 @ 0x1 @ rd @ 0x00 )
    addc    %{rd: reg}, %{rs1: reg}, %{rs2: reg}    => $le( 0x00 @ rs2 @ rs1 @ 0x2 @ rd @ 0x00 )
    subb    %{rd: reg}, %{rs1: reg}, %{rs2: reg}    => $le( 0x00 @ rs2 @ rs1 @ 0x3 @ rd @ 0x00 )
    and     %{rd: reg}, %{rs1: reg}, %{rs2: reg}    => $le( 0x00 @ rs2 @ rs1 @ 0x4 @ rd @ 0x00 )
    or      %{rd: reg}, %{rs1: reg}, %{rs2: reg}    => $le( 0x00 @ rs2 @ rs1 @ 0x5 @ rd @ 0x00 )
    xor     %{rd: reg}, %{rs1: reg}, %{rs2: reg}    => $le( 0x00 @ rs2 @ rs1 @ 0x6 @ rd @ 0x00 )
    sll     %{rd: reg}, %{rs1: reg}, %{rs2: reg}    => $le( 0x00 @ rs2 @ rs1 @ 0x7 @ rd @ 0x00 )
    srl     %{rd: reg}, %{rs1: reg}, %{rs2: reg}    => $le( 0x00 @ rs2 @ rs1 @ 0x8 @ rd @ 0x00 )
    sra     %{rd: reg}, %{rs1: reg}, %{rs2: reg}    => $le( 0x00 @ rs2 @ rs1 @ 0x9 @ rd @ 0x00 )
    ror     %{rd: reg}, %{rs1: reg}, %{rs2: reg}    => $le( 0x00 @ rs2 @ rs1 @ 0xA @ rd @ 0x00 )
    rol     %{rd: reg}, %{rs1: reg}, %{rs2: reg}    => $le( 0x00 @ rs2 @ rs1 @ 0xB @ rd @ 0x00 )
    cmp     %{rs1: reg}, %{rs2: reg}                => $le( 0x00 @ rs2 @ rs1 @ 0xC @ 0x0 @ 0x00 )
}

; I-Type ALU

#ruledef {
    add     %{rd: reg}, %{rs1: reg}, #{imm: i12}    => $le( imm @ rs1 @ 0x0 @ rd @ 0x01 )
    sub     %{rd: reg}, %{rs1: reg}, #{imm: i12}    => $le( imm @ rs1 @ 0x1 @ rd @ 0x01 )
    addc    %{rd: reg}, %{rs1: reg}, #{imm: i12}    => $le( imm @ rs1 @ 0x2 @ rd @ 0x01 )
    subb    %{rd: reg}, %{rs1: reg}, #{imm: i12}    => $le( imm @ rs1 @ 0x3 @ rd @ 0x01 )
    and     %{rd: reg}, %{rs1: reg}, #{imm: i12}    => $le( imm @ rs1 @ 0x4 @ rd @ 0x01 )
    or      %{rd: reg}, %{rs1: reg}, #{imm: i12}    => $le( imm @ rs1 @ 0x5 @ rd @ 0x01 )
    xor     %{rd: reg}, %{rs1: reg}, #{imm: i12}    => $le( imm @ rs1 @ 0x6 @ rd @ 0x01 )
    sll     %{rd: reg}, %{rs1: reg}, #{imm: i12}    => $le( imm @ rs1 @ 0x7 @ rd @ 0x01 )
    srl     %{rd: reg}, %{rs1: reg}, #{imm: i12}    => $le( imm @ rs1 @ 0x8 @ rd @ 0x01 )
    sra     %{rd: reg}, %{rs1: reg}, #{imm: i12}    => $le( imm @ rs1 @ 0x9 @ rd @ 0x01 )
    ror     %{rd: reg}, %{rs1: reg}, #{imm: i12}    => $le( imm @ rs1 @ 0xA @ rd @ 0x01 )
    rol     %{rd: reg}, %{rs1: reg}, #{imm: i12}    => $le( imm @ rs1 @ 0xB @ rd @ 0x01 )
    cmp     %{rs1: reg}, #{imm: i12}                => $le( imm @ rs1 @ 0xC @ 0x0 @ 0x01 )
}

; LI-Type LI

#ruledef {
    li %{rd: reg}, #{imm: i20}                      => $le( imm @ rd @ 0x07 )
}