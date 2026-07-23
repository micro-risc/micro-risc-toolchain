#fn get_real(addr) => addr - $

; B-Type Branches
#ruledef {
    bzs {target: i22} => $le( get_real(target)[21:6] @ 0x0 @ get_real(target)[5:2] @ 0x04 )
    bzc {target: i22} => $le( get_real(target)[21:6] @ 0x1 @ get_real(target)[5:2] @ 0x04 )
    bns {target: i22} => $le( get_real(target)[21:6] @ 0x2 @ get_real(target)[5:2] @ 0x04 )
    bnc {target: i22} => $le( get_real(target)[21:6] @ 0x3 @ get_real(target)[5:2] @ 0x04 )
    bvs {target: i22} => $le( get_real(target)[21:6] @ 0x4 @ get_real(target)[5:2] @ 0x04 )
    bvc {target: i22} => $le( get_real(target)[21:6] @ 0x5 @ get_real(target)[5:2] @ 0x04 )
    bcs {target: i22} => $le( get_real(target)[21:6] @ 0x6 @ get_real(target)[5:2] @ 0x04 )
    bcc {target: i22} => $le( get_real(target)[21:6] @ 0x7 @ get_real(target)[5:2] @ 0x04 )
    bgt {target: i22} => $le( get_real(target)[21:6] @ 0x8 @ get_real(target)[5:2] @ 0x04 )
    bge {target: i22} => $le( get_real(target)[21:6] @ 0x9 @ get_real(target)[5:2] @ 0x04 )
    blt {target: i22} => $le( get_real(target)[21:6] @ 0xA @ get_real(target)[5:2] @ 0x04 )
    ble {target: i22} => $le( get_real(target)[21:6] @ 0xB @ get_real(target)[5:2] @ 0x04 )
    bhi {target: i22} => $le( get_real(target)[21:6] @ 0xC @ get_real(target)[5:2] @ 0x04 )
    bhs {target: i22} => $le( get_real(target)[21:6] @ 0xD @ get_real(target)[5:2] @ 0x04 )
    blo {target: i22} => $le( get_real(target)[21:6] @ 0xE @ get_real(target)[5:2] @ 0x04 )
    bls {target: i22} => $le( get_real(target)[21:6] @ 0xF @ get_real(target)[5:2] @ 0x04 )
}

; J-Type jmp and I-Type ji
#ruledef {
    jmp {target: i26}               => $le( get_real(target)[25:2] @ 0x05)
    ji [%{rs1: reg} + #{imm: i12}]  => $le( imm @ rs1 @ 0x0 @ 0x0 @ 0x06 ) 
}
