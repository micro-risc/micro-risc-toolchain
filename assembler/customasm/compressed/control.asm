#fn cb_off(addr) => {
    offset = addr - $
    $assert((addr % 2) == 0, "Jump Target Not Aligned")
    
    $assert(offset >= -256 && offset <= 254, "Branch Target Too Far")
    
    offset[8:1]
}


; c.jmp and c.ji
#ruledef {
    c.jmp {addr} => {
        offset = addr - $
        $assert((addr % 2) == 0, "Jump Target Not Aligned")
        $assert(offset >= -4096 && offset <= 4094, "Jump Target Too Far")
        $le(offset[12:1] @ 0b01 @ 0b11)
    }

    c.ji {imm, i5}({s: register}) => $le(imm @ 0x0`3 @ s @ 0b10 @ 0b00)
}