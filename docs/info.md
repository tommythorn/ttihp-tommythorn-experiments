<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The 8b input is split into 5b immediate and 3b opcode which enables
you to loads rs1, rs2, rd, as well as writing directly to rf[rd].
Other opcodes allows you to add, shift, and, and finally output the
top 8b to the output port.

## How to test

Replicate the test.py sequence or make your own.

## External hardware

List external hardware used in your project (e.g. PMOD, LED display, etc), if any
