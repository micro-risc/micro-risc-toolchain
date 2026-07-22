; register alu ops

#ruledef {
    c.add   {d: dst}, {s: src} => $le(s @ 0x0 @ d @ 0b00 @ 0b00)
    c.sub   {d: dst}, {s: src} => $le(s @ 0x1 @ d @ 0b00 @ 0b00)
    c.addc  {d: dst}, {s: src} => $le(s @ 0x2 @ d @ 0b00 @ 0b00)
    c.subb  {d: dst}, {s: src} => $le(s @ 0x3 @ d @ 0b00 @ 0b00)
    c.and   {d: dst}, {s: src} => $le(s @ 0x4 @ d @ 0b00 @ 0b00)
    c.or    {d: dst}, {s: src} => $le(s @ 0x5 @ d @ 0b00 @ 0b00)
    c.xor   {d: dst}, {s: src} => $le(s @ 0x6 @ d @ 0b00 @ 0b00)
    c.sll   {d: dst}, {s: src} => $le(s @ 0x7 @ d @ 0b00 @ 0b00)
    c.srl   {d: dst}, {s: src} => $le(s @ 0x8 @ d @ 0b00 @ 0b00)
    c.sra   {d: dst}, {s: src} => $le(s @ 0x9 @ d @ 0b00 @ 0b00)
    c.ror   {d: dst}, {s: src} => $le(s @ 0xA @ d @ 0b00 @ 0b00)
    c.rol   {d: dst}, {s: src} => $le(s @ 0xB @ d @ 0b00 @ 0b00)
    c.mov   {d: dst}, {s: src} => $le(s @ 0xC @ d @ 0b00 @ 0b00)
    c.mul   {d: dst}, {s: src} => $le(s @ 0xD @ d @ 0b00 @ 0b00)
    c.div   {d: dst}, {s: src} => $le(s @ 0xE @ d @ 0b00 @ 0b00)
    c.rem   {d: dst}, {s: src} => $le(s @ 0xF @ d @ 0b00 @ 0b00)
}

; imm alu ops
#ruledef {
    c.addi   {d: dst}, {imm: i5} => $le(imm @ 0x0`3 @ d @ 0b00 @ 0b10)
    c.adci   {d: dst}, {imm: i5} => $le(imm @ 0x1`3 @ d @ 0b00 @ 0b10)
    c.andi   {d: dst}, {imm: i5} => $le(imm @ 0x2`3 @ d @ 0b00 @ 0b10)
    c.ori    {d: dst}, {imm: i5} => $le(imm @ 0x3`3 @ d @ 0b00 @ 0b10)
    c.xori   {d: dst}, {imm: i5} => $le(imm @ 0x4`3 @ d @ 0b00 @ 0b10)
    c.slli   {d: dst}, {imm: i5} => $le(imm @ 0x5`3 @ d @ 0b00 @ 0b10)
    c.srli   {d: dst}, {imm: i5} => $le(imm @ 0x6`3 @ d @ 0b00 @ 0b10)
    c.srai   {d: dst}, {imm: i5} => $le(imm @ 0x7`3 @ d @ 0b00 @ 0b10)
}