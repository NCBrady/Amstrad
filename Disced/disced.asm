ORG &9000
CALL L933D
CALL L941A
CALL L9388
.L9009
CALL L9440
.L900C
CALL L941A
.L900F
CALL L9293
CALL L92E6
.L9015
LD A,(L962E)
CP &0001
JP Z,L90CA
LD HL,(L9626)
CALL &BB81
CALL &BB75
CALL &BB06
CALL &BB84
CP &0001
JP Z,L9207
CP &0003
JP Z,L919E
CP &0007
JP Z,L91BA
CP &0008
JP Z,L91A9
CP &0010
JP Z,L90E1
CP &0012
JP Z,L9107
CP &0013
JP Z,L90F5
CP &0014
JP Z,L91C5
CP &0017
JP Z,L91D0
CP &00F0
JP Z,L9115
CP &00F1
JP Z,L912D
CP &00F2
JP Z,L9145
CP &00F3
JP Z,L9160
CP &00F8
JP Z,L9184
CP &00F9
JP Z,L917A
CP &00FA
JP Z,L918E
CP &00FB
JP Z,L9194
CP &00FC
JP Z,L91F1
CP &0030
JR C,L9015
CP &0047
JR NC,L9015
CALL L93BD
CALL L93B8
LD B,A
.L9095
CALL &BB06
CP &0047
JR NC,L9095
CP &0030
JR C,L9095
CALL L93BD
ADD B
LD HL,(L962C)
LD (HL),A
INC HL
PUSH HL
PUSH AF
CALL &BB78
LD A,H
CP &0033
CALL NC,L9404
PUSH HL
CALL L940A
POP HL
POP AF
PUSH HL
CALL &BB5D
POP HL
INC H
LD (L9626),HL
POP HL
LD (L962C),HL
JP L9015
.L90CA
XOR A
LD (L962E),A
LD A,&0006
LD (L9627),A
LD A,(L9626)
CP &0014
JR NC,L90E1
INC A
LD (L9626),A
.L90DE
JP L9015
.L90E1
LD HL,&0605
LD (L9626),HL
LD A,(L9625)
CP &0001
JP Z,L900C
CALL L9287
JP L900F
.L90F5
LD A,&0007
CALL &BB5A
LD HL,&8800
LD DE,&8A00
LD BC,&0200
LDIR
JR L90DE
.L9107
LD HL,&8A00
LD DE,&8800
LD BC,&0200
LDIR
JP L900C
.L9115
CALL &BB78
LD A,L
CP &0005
JR Z,L90DE
DEC L
LD (L9626),HL
LD DE,&FFF0
LD HL,(L962C)
ADD HL,DE
LD (L962C),HL
JR L90DE
.L912D
CALL &BB78
LD A,L
CP &0014
JR Z,L90DE
INC L
LD (L9626),HL
LD DE,&0010
LD HL,(L962C)
ADD HL,DE
LD (L962C),HL
JR L90DE
.L9145
CALL &BB78
LD A,H
CP &0007
JR C,L90DE
DEC H
DEC H
DEC H
LD (L9626),HL
LD DE,&FFFF
LD HL,(L962C)
ADD HL,DE
LD (L962C),HL
.L915D
JP L9015
.L9160
CALL &BB78
LD A,H
CP &0033
JR NC,L915D
INC H
INC H
INC H
LD (L9626),HL
LD DE,&0001
LD HL,(L962C)
ADD HL,DE
LD (L962C),HL
JR L915D
.L917A
LD A,(L9624)
CP &0000
JR Z,L915D
DEC A
JR L9188
.L9184
LD A,(L9624)
INC A
.L9188
LD (L9624),A
JP L9009
.L918E
LD A,(L9623)
DEC A
JR L9198
.L9194
LD A,(L9623)
INC A
.L9198
LD (L9623),A
JP L9009
.L919E
CALL L9347
LD DE,&8000
CALL &BC9B
JR L91B2
.L91A9
CALL L9347
LD HL,L9503
CALL L937F
.L91B2
CALL &BB06
.L91B5
CALL L933D
JR L915D
.L91BA
LD H,&001C
CALL L93CB
LD (L9623),A
JP L9009
.L91C5
LD H,&000E
CALL L93CB
LD (L9624),A
JP L9009
.L91D0
CALL L9439
LD HL,L95E8
CALL L937F
CALL &BB06
CP &0059
JR NZ,L91E8
LD A,&0085
LD (L9628),A
CALL L9440
.L91E8
CALL L9420
CALL L933D
JP L900C
.L91F1
CALL L9347
LD HL,L9602
CALL L937F
CALL &BB06
CP &0059
JR NZ,L91B5
CALL L933D
JP &BB00
.L9207
CALL &BB78
PUSH HL
CALL &BB00
POP HL
.L920F
PUSH HL
INC H
INC H
LD (L9626),HL
LD A,H
CP &0036
JR NC,L9251
CALL L940A
.L921D
CALL &BB81
CALL &BB06
CALL &BB84
CP &00FC
JR Z,L927D
CP &007E
JR NC,L921D
CP &0020
JR C,L921D
CALL &BB5A
LD HL,(L962C)
LD (HL),A
INC HL
LD (L962C),HL
POP HL
PUSH AF
CALL &BB75
POP AF
CALL L939F
LD HL,(L9626)
INC H
.L924A
PUSH HL
CALL &BB75
POP HL
JR L920F
.L9251
POP DE
LD H,&0006
INC L
LD A,L
CP &0015
JR NC,L925F
LD (L9626),HL
JR L924A
.L925F
LD A,(L9625)
CP &0001
JR Z,L9274
CALL L9287
CALL L92E6
LD HL,&3404
LD (L9626),HL
JR L924A
.L9274
CALL L941A
CALL L9388
JP L900C
.L927D
POP HL
LD (L9626),HL
CALL L9388
JP L915D
.L9287
LD HL,&8900
LD (L962C),HL
LD A,&0001
LD (L9625),A
RET
.L9293
LD DE,&001B
LD HL,&0156
CALL &BBC0
LD HL,&0000
PUSH HL
LD DE,&0190
CALL &BBF9
LD HL,&FEF2
POP DE
PUSH DE
CALL &BBF9
POP HL
PUSH HL
LD DE,&FE70
CALL &BBF9
LD HL,&010E
POP DE
PUSH DE
CALL &BBF9
LD DE,&01C2
LD HL,&0156
CALL &BBC0
POP HL
PUSH HL
LD DE,&009A
CALL &BBF9
LD HL,&FEF2
POP DE
PUSH DE
CALL &BBF9
POP HL
PUSH HL
LD DE,&FF66
CALL &BBF9
LD HL,&010E
POP DE
JP &BBF9
.L92E6
LD HL,&0601
CALL &BB75
LD HL,L947F
CALL L937F
LD HL,&0617
CALL &BB75
LD HL,L94D3
CALL L937F
LD HL,&0E03
CALL &BB75
LD A,(L9624)
CALL L939F
LD HL,&1C03
CALL &BB75
LD A,(L9623)
CALL L939F
LD HL,&2803
CALL &BB75
LD A,(L9625)
CALL L939F
LD DE,(L962C)
LD B,&0010
LD L,&0005
.L932A
PUSH HL
PUSH BC
CALL L9338
CALL L934C
POP BC
POP HL
INC L
DJNZ L932A
RET
.L9338
LD H,&0006
JP &BB75
.L933D
LD A,&0002
CALL &BC0E
LD A,&00C0
JP &BC08
.L9347
LD A,&0040
JP &BC08
.L934C
PUSH DE
LD B,&0010
CALL L9370
LD HL,L961D
CALL L937F
POP DE
LD B,&0010
.L935B
LD A,(DE)
INC DE
CP &0020
JR C,L9367
CALL &BB5A
.L9364
DJNZ L935B
RET
.L9367
PUSH DE
PUSH BC
CALL &BB5D
POP BC
POP DE
JR L9364
.L9370
LD A,(DE)
INC DE
PUSH BC
CALL L939F
LD A,&0020
CALL &BB5A
POP BC
DJNZ L9370
RET
.L937F
LD A,(HL)
OR A
RET Z
INC HL
CALL &BB5A
JR L937F
.L9388
LD C,&001A
.L938A
INC C
LD A,C
CP &0048
RET Z
CALL &BB30
LD B,A
SUB &0041
SUB &001A
JR NC,L938A
LD A,C
CALL &BB27
JR L938A
.L939F
LD B,&0002
LD C,A
CALL L93B8
.L93A5
AND &000F
CP &000A
JR NC,L93AF
ADD &0030
JR L93B1
.L93AF
ADD &0037
.L93B1
CALL &BB5A
LD A,C
DJNZ L93A5
RET
.L93B8
RRCA
RRCA
RRCA
RRCA
RET
.L93BD
CALL &BB5A
SUB &0030
CP &000A
CALL NC,L93C8
RET
.L93C8
SUB &0007
RET
.L93CB
LD L,&0003
CALL &BB75
CALL &BB81
LD HL,L962F
LD B,&0002
.L93D8
CALL &BB06
CP &0047
JR NC,L93D8
CP &0030
JR C,L93D8
CALL &BB5A
CP &0041
JR C,L93EC
SUB &0037
.L93EC
LD (HL),A
INC HL
DJNZ L93D8
DEC HL
XOR A
RLD
RLD
LD B,A
DEC HL
XOR A
RLD
RLD
CALL L93B8
ADD B
JP &BB84
.L9404
LD A,&0001
LD (L962E),A
RET
.L940A
LD B,&0002
LD C,&0039
LD A,H
.L940F
CP B
LD H,C
JP Z,&BB75
INC B
INC B
INC B
INC C
JR L940F
.L941A
LD HL,&0605
LD (L9626),HL
.L9420
LD HL,&8800
LD (L962C),HL
XOR A
LD (L9625),A
INC A
LD (&BE66),A
LD A,&0084
LD (L9628),A
LD A,&00FF
LD (&BE78),A
RET
.L9439
XOR A
LD (&BE78),A
JP L9347
.L9440
LD HL,&0605
LD (L9626),HL
XOR A
.L9448 EQU $ + 1
LD (L9625),A
LD HL,L9628
CALL &BCD4
LD (L9629),HL
LD A,C
LD (L962B),A
.L9457
CALL &BB1B
CP &00FC
RET Z
LD HL,&8800
LD (L962C),HL
LD A,(L9624)
LD D,A
LD E,&0000
LD A,(L9623)
LD C,A
RST &0018
ADD HL,HL
SUB (HL)
JR NC,L9477
LD A,C
LD (L9623),A
RET
.L9477
LD A,&0010
ADD C
LD (L9623),A
JR L9457
.L947F
LD B,H
LD C,C
LD D,E
LD B,E
LD B,L
LD B,H
JR NZ,L94A7
HALT
LD H,L
LD (HL),D
LD (HL),E
LD L,C
LD L,A
LD L,(HL)
JR NZ,L94C1
LD L,&0033
LD SP,&6220
LD A,C
JR NZ,L94E6
LD L,C
LD H,C
LD L,H
LD L,H
JR NZ,L94E0
LD (HL),D
LD H,C
LD H,H
LD A,C
JR NZ,L9448
JR NZ,L94D7
ADD HL,SP
.L94A7
JR C,L94E1
DEC C
LD A,(BC)
LD A,(BC)
JR NZ,L94CE
JR NZ,L94D0
JR NZ,L9506
LD (HL),D
LD H,C
LD H,E
LD L,E
JR NZ,L94F6
JR NZ,L94C3
ADD HL,BC
JR NZ,L94DD
JR NZ,L9512
LD H,L
LD H,E
.L94C1
LD (HL),H
LD L,A
.L94C3
LD (HL),D
JR NZ,L9504
JR NZ,L94D1
ADD HL,BC
JR NZ,L94EB
JR NZ,L951D
LD H,C
.L94CE
LD H,A
LD H,L
.L94D1 EQU $ + 1
.L94D0
JR NZ,L9510
NOP
.L94D3
LD D,B
LD (HL),D
LD H,L
LD (HL),E
.L94D7
LD (HL),E
JR NZ,L951D
LD L,A
LD L,(HL)
LD (HL),H
.L94DD
LD (HL),D
LD L,A
LD L,H
.L94E1 EQU $ + 1
.L94E0
JR NZ,L950D
JR NZ,L952C
JR NZ,L954C
.L94E6
LD L,A
LD (HL),D
JR NZ,L9532
LD H,L
.L94EB
LD L,H
LD (HL),B
JR NZ,L955E
LD (HL),D
JR NZ,L9562
LD (HL),D
LD H,L
LD (HL),E
LD (HL),E
.L94F6
JR NZ,L953D
LD D,E
LD B,E
JR NZ,L9570
LD L,A
JR NZ,L9544
LD A,B
LD L,C
LD (HL),H
NOP
.L9503
LD (BC),A
.L9504
LD D,B
LD (HL),D
.L9506
LD H,L
LD (HL),E
LD (HL),E
JR NZ,L9566
LD B,E
LD C,A
.L950D
LD C,(HL)
LD D,H
LD D,D
.L9510
LD C,A
LD C,H
.L9512
LD E,L
JR NZ,L9540
JR NZ,L9572
LD L,E
LD H,L
LD A,C
LD E,L
DEC C
LD A,(BC)
.L951D
LD A,(BC)
LD B,E
JR NZ,L954E
JR NZ,L9566
LD H,C
LD (HL),H
JR NZ,L956B
LD L,C
LD (HL),E
LD H,E
DEC C
LD A,(BC)
.L952C
LD D,B
JR NZ,L955C
JR NZ,L9581
LD H,C
.L9532
LD H,A
LD H,L
JR NZ,L957C
LD L,H
LD L,C
LD (HL),B
DEC C
LD A,(BC)
LD D,H
.L953D EQU $ + 1
JR NZ,L956B
JR NZ,L9592
.L9540
LD H,L
LD H,C
LD H,H
.L9544 EQU $ + 1
JR NZ,L9599
LD (HL),D
LD H,C
LD H,E
LD L,E
DEC C
LD A,(BC)
RET P
.L954C
JR NZ,L957B
.L954E
JR NZ,L959E
LD H,L
LD A,B
LD (HL),H
JR NZ,L95A9
LD (HL),D
LD H,C
LD H,E
LD L,E
DEC C
LD A,(BC)
DI
.L955C
JR NZ,L958B
.L955E
JR NZ,L95AE
LD H,L
LD A,B
.L9562
LD (HL),H
JR NZ,L95B8
LD H,L
.L9566
LD H,E
LD (HL),H
LD L,A
LD (HL),D
DEC C
.L956B
LD A,(BC)
POP AF
JR NZ,L959C
.L9570 EQU $ + 1
JR NZ,L95B3
LD H,C
.L9572
LD H,E
LD L,E
JR NZ,L95CA
LD (HL),D
LD H,C
LD H,E
LD L,E
DEC C
.L957B
LD A,(BC)
.L957C
JP P,&2D20
JR NZ,L95C3
.L9581
LD H,C
LD H,E
LD L,E
JR NZ,L95D9
LD H,L
LD H,E
LD (HL),H
LD L,A
LD (HL),D
.L958B
DEC C
LD A,(BC)
LD B,A
JR NZ,L95BD
JR NZ,L95D9
.L9592
LD L,A
LD (HL),H
LD L,A
JR NZ,L95EA
LD H,L
LD H,E
.L9599
LD (HL),H
LD L,A
LD (HL),D
.L959C
DEC C
LD A,(BC)
.L959E
LD B,C
JR NZ,L95CE
JR NZ,L95E4
LD (HL),E
LD H,E
LD L,C
LD L,C
JR NZ,L95F2
.L95A9
LD L,(HL)
LD (HL),B
LD (HL),L
LD (HL),H
DEC C
.L95AE
LD A,(BC)
LD D,A
JR NZ,L95DF
.L95B3 EQU $ + 1
JR NZ,L960B
LD (HL),D
LD L,C
LD (HL),H
LD H,L
.L95B8
JR NZ,L960D
LD H,L
LD H,E
LD (HL),H
.L95BD
LD L,A
LD (HL),D
DEC C
LD A,(BC)
LD D,E
.L95C3 EQU $ + 1
JR NZ,L95F1
JR NZ,L9619
LD (HL),H
LD L,A
LD (HL),D
LD H,L
.L95CA
JR NZ,L961F
LD H,L
LD H,E
.L95CE
LD (HL),H
LD L,A
LD (HL),D
DEC C
LD A,(BC)
LD D,D
JR NZ,L9603
JR NZ,L962A
LD H,L
.L95D9
LD H,E
LD L,A
HALT
LD H,L
LD (HL),D
.L95DF EQU $ + 1
JR NZ,L9633
LD H,L
LD H,E
LD (HL),H
LD L,A
.L95E4
LD (HL),D
DEC C
LD A,(BC)
NOP
.L95E8
RLCA
.L95EA EQU $ + 1
JR L9615
LD HL,(&5720)
LD (HL),D
LD L,C
LD (HL),H
.L95F1
LD H,L
.L95F2
JR NZ,&9658
LD L,C
LD (HL),E
LD H,E
JR NZ,L9621
LD E,C
CPL
LD C,(HL)
ADD HL,HL
JR NZ,L9629
LD HL,(&0018)
.L9602
RLCA
.L9603
JR L962F
LD HL,(&4520)
LD A,B
LD L,C
LD (HL),H
.L960B
JR NZ,&9651
.L960D
LD C,C
LD D,E
LD B,E
LD B,L
LD B,H
JR NZ,L963C
LD E,C
.L9615
CPL
LD C,(HL)
ADD HL,HL
.L9619 EQU $ + 1
JR NZ,L9644
LD HL,(&0018)
.L961D
ADD HL,BC
ADD HL,BC
.L961F
ADD HL,BC
ADD HL,BC
.L9621
ADD HL,BC
NOP
.L9623
POP BC
.L9624
NOP
.L9625
NOP
.L9626
DEC B
.L9628 EQU $ + 1
.L9627
LD B,&0084
.L9629
INC A
.L962A
RET NZ
.L962B
RLCA
.L962C
NOP
ADC B
.L962E
NOP
.L962F
NOP
NOP
NOP
NOP
.L9633
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
.L963C
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
.L9644
NOP
NOP
NOP
