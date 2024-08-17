ORG &9000	; Disced 1.31 (c) Niall Brady 1988, for CPC 6128
			; Z80 source recreated starting 2020/09/11
			; last edit 2022/02/22
			; firmware functions used in Disced

scr_set_mode		equ &bc0e
txt_output			equ &bb5a
txt_set_cursor		equ &bb75
txt_cur_on			equ &bb81
txt_cur_off			equ &bb84
km_wait_char		equ &bb06

			
CALL change_screen_mode 	; change screen to mode 2
CALL SET_CURSOR_POSITION	; sets the cursor position, then sets disc retries and turn off disc error messages
CALL CHECK_SHIFT			; some type of key translation loop, not clear what it does yet...
.L9009
CALL Process_Disc_Activities
.L900C
CALL SET_CURSOR_POSITION
.L900F
CALL Draw_Rectangle_Frames
CALL Fill_text_in_rectangles
.L9015
LD A,(L962E)
CP &0001
JP Z,L90CA
LD HL,(INITIAL_CURSOR_POSITION)
CALL txt_cur_on
CALL txt_set_cursor
CALL km_wait_char
CALL txt_cur_off
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
CALL km_wait_char
CP &0047
JR NC,L9095
CP &0030
JR C,L9095
CALL L93BD
ADD B
LD HL,(DISC_CACHE_ADDRESS)
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
LD (INITIAL_CURSOR_POSITION),HL
POP HL
LD (DISC_CACHE_ADDRESS),HL
JP L9015
.L90CA
XOR A
LD (L962E),A
LD A,&06
LD (L9627),A
LD A,(INITIAL_CURSOR_POSITION)
CP &14
JR NC,L90E1
INC A
LD (INITIAL_CURSOR_POSITION),A
.L90DE
JP L9015
.L90E1
LD HL,&0605
LD (INITIAL_CURSOR_POSITION),HL
LD A,(DISC_RETRY_VALUE)
CP &01
JP Z,L900C
CALL L9287
JP L900F
.L90F5
LD A,&0007
CALL txt_output
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
LD (INITIAL_CURSOR_POSITION),HL
LD DE,&FFF0
LD HL,(DISC_CACHE_ADDRESS)
ADD HL,DE
LD (DISC_CACHE_ADDRESS),HL
JR L90DE
.L912D
CALL &BB78
LD A,L
CP &14
JR Z,L90DE
INC L
LD (INITIAL_CURSOR_POSITION),HL
LD DE,&0010
LD HL,(DISC_CACHE_ADDRESS)
ADD HL,DE
LD (DISC_CACHE_ADDRESS),HL
JR L90DE
.L9145
CALL &BB78
LD A,H
CP &07
JR C,L90DE
DEC H
DEC H
DEC H
LD (INITIAL_CURSOR_POSITION),HL
LD DE,&FFFF
LD HL,(DISC_CACHE_ADDRESS)
ADD HL,DE
LD (DISC_CACHE_ADDRESS),HL
.L915D
JP L9015
.L9160
CALL &BB78
LD A,H
CP &33
JR NC,L915D
INC H
INC H
INC H
LD (INITIAL_CURSOR_POSITION),HL
LD DE,&0001
LD HL,(DISC_CACHE_ADDRESS)
ADD HL,DE
LD (DISC_CACHE_ADDRESS),HL
JR L915D
.L917A
LD A,(Current_Track)
CP &00
JR Z,L915D
DEC A
JR L9188
.L9184
LD A,(Current_Track)
INC A
.L9188
LD (Current_Track),A
JP L9009
.L918E
LD A,(Current_Sector)
DEC A
JR L9198
.L9194
LD A,(Current_Sector)
INC A
.L9198
LD (Current_Sector),A
JP L9009
.L919E
CALL L9347
LD DE,&8000
CALL &BC9B
JR L91B2
.L91A9
CALL L9347
LD HL,L9503
CALL Print_Text_String
.L91B2
CALL km_wait_char
.L91B5
CALL change_screen_mode
JR L915D
.L91BA
LD H,&001C
CALL L93CB
LD (Current_Sector),A
JP L9009
.L91C5
LD H,&000E
CALL L93CB
LD (Current_Track),A
JP L9009
.L91D0
CALL L9439
LD HL,L95E8
CALL Print_Text_String
CALL km_wait_char
CP &0059
JR NZ,L91E8
LD A,&0085
LD (DISC_RELATED_FUNCTION),A
CALL Process_Disc_Activities
.L91E8
CALL DISC_INIT
CALL change_screen_mode
JP L900C
.L91F1
CALL L9347
LD HL,L9602
CALL Print_Text_String
CALL km_wait_char
CP &59
JR NZ,L91B5
CALL change_screen_mode
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
LD (INITIAL_CURSOR_POSITION),HL
LD A,H
CP &36
JR NC,L9251
CALL L940A
.L921D
CALL txt_cur_on
CALL km_wait_char
CALL txt_cur_off
CP &FC
JR Z,L927D
CP &7E
JR NC,L921D
CP &20
JR C,L921D
CALL txt_output
LD HL,(DISC_CACHE_ADDRESS)
LD (HL),A
INC HL
LD (DISC_CACHE_ADDRESS),HL
POP HL
PUSH AF
CALL txt_set_cursor
POP AF
CALL process_text_in_left_rectangle
LD HL,(INITIAL_CURSOR_POSITION)
INC H
.L924A
PUSH HL
CALL txt_set_cursor
POP HL
JR L920F
.L9251
POP DE
LD H,&06
INC L
LD A,L
CP &15
JR NC,L925F
LD (INITIAL_CURSOR_POSITION),HL
JR L924A
.L925F
LD A,(DISC_RETRY_VALUE)
CP &01
JR Z,L9274
CALL L9287
CALL Fill_text_in_rectangles
LD HL,&3404
LD (INITIAL_CURSOR_POSITION),HL
JR L924A
.L9274
CALL SET_CURSOR_POSITION
CALL CHECK_SHIFT
JP L900C
.L927D
POP HL
LD (INITIAL_CURSOR_POSITION),HL
CALL CHECK_SHIFT
JP L915D
.L9287
LD HL,&8900
LD (DISC_CACHE_ADDRESS),HL
LD A,&01
LD (DISC_RETRY_VALUE),A
RET
Draw_Rectangle_Frames:
	LD DE,&001B ; start drawing left pane, (top line) X co-ord
	LD HL,&0156 ; Y co-ord
	CALL &BBC0 ; set drawing position to start here
	LD HL,&0000
	PUSH HL
	LD DE,&0190
	CALL &BBF9 ; draw line (horizontal)
	LD HL,&FEF2
	POP DE
	PUSH DE
	CALL &BBF9 ; draw line (vertical)
	POP HL
	PUSH HL
	LD DE,&FE70
	CALL &BBF9
	LD HL,&010E
	POP DE
	PUSH DE
	CALL &BBF9
	LD DE,&01C2 ; start with the right rectangle, X co-ord
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
	
:Fill_text_in_rectangles
	LD HL,&0601 ; set the position of the cursor on top of the screen
	CALL txt_set_cursor
	LD HL,disced_title_text
	CALL Print_Text_String
	LD HL,&0617
	CALL txt_set_cursor
	LD HL,Control_help_text_string
	CALL Print_Text_String
	LD HL,&0E03
	CALL txt_set_cursor
	LD A,(Current_Track)
	CALL process_text_in_left_rectangle
	LD HL,&1C03
	CALL txt_set_cursor
	LD A,(Current_Sector)
	CALL process_text_in_left_rectangle
	LD HL,&2803
	CALL txt_set_cursor
	LD A,(DISC_RETRY_VALUE)
	CALL process_text_in_left_rectangle
	LD DE,(DISC_CACHE_ADDRESS)
	LD B,&10
	LD L,&05
	
.L932A
	PUSH HL
	PUSH BC
	CALL set_left_rect_txt_pos ; set cursor position top left of left rectangle
	CALL data_in_left_pane
	POP BC
	POP HL
	INC L
	DJNZ L932A
	RET
	
:set_left_rect_txt_pos
LD H,&0006
JP txt_set_cursor

change_screen_mode: ; change screen mode
	LD A,&02 		; 2 is for mode 2
	CALL scr_set_mode		; SCR SET MODE
	LD A,&C0 		; using &C000 for screen memory
	JP &BC08		; SCR SET BASE
	
.L9347
	LD A,&40
	JP &BC08

:data_in_left_pane
	PUSH DE
	LD B,&10
	CALL L9370
	LD HL,L961D
	CALL Print_Text_String
	POP DE
	LD B,&10
	.L935B
	LD A,(DE)
	INC DE
	CP &20
	JR C,L9367
	CALL txt_output
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
CALL process_text_in_left_rectangle
LD A,&0020
CALL txt_output
POP BC
DJNZ L9370
RET

:Print_Text_String
	LD A,(HL) ; ld a with the char that HL is pointing to
	OR A ; is it = 0
	RET Z ; ret if true
	INC HL ; add one to the address that HL is pointing to
	CALL txt_output ; print the text character
	JR Print_Text_String
	
CHECK_SHIFT:
	LD C,&1A
TRANSLATE_KEY_LOOP:
	INC C
	LD A,C
	CP &48
	RET Z
	CALL &BB30 ; KM_GET_SHIFT
	LD B,A
	SUB &41
	SUB &1A
	JR NC,TRANSLATE_KEY_LOOP
	LD A,C
	CALL &BB27 ; KM_SET_TRANSLATE
	JR TRANSLATE_KEY_LOOP
:process_text_in_left_rectangle ; convert to HEX ???
	LD B,&02
	LD C,A
	CALL L93B8
.L93A5
	AND &0F
	CP &0A
	JR NC,L93AF
	ADD &30
	JR L93B1
.L93AF
	ADD &37

.L93B1
	CALL txt_output
	LD A,C
	DJNZ L93A5
	RET
.L93B8
	RRCA ; rotate 8 bits to the right, some sort of conversion
	RRCA
	RRCA
	RRCA
	RET
.L93BD
CALL txt_output
SUB &0030
CP &000A
CALL NC,L93C8
RET
.L93C8
SUB &0007
RET
.L93CB
LD L,&0003
CALL txt_set_cursor
CALL txt_cur_on
LD HL,L962F
LD B,&0002
.L93D8
CALL km_wait_char
CP &0047
JR NC,L93D8
CP &0030
JR C,L93D8
CALL txt_output
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
JP txt_cur_off
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
JP Z,txt_set_cursor
INC B
INC B
INC B
INC C
JR L940F
SET_CURSOR_POSITION:
	LD HL,&0605  ; set cursor position &05 = X, &06 = Y
	LD (INITIAL_CURSOR_POSITION),HL
DISC_INIT:
	LD HL,&8800 ; cache disc data at this address
	LD (DISC_CACHE_ADDRESS),HL
	XOR A
	LD (DISC_RETRY_VALUE),A
	INC A
	LD (&BE66),A ; disc retries (default &10)
	LD A,&0084
	LD (DISC_RELATED_FUNCTION),A
	LD A,&00FF
	LD (&BE78),A ; disc error message flag (&00=on; &FF=off - reversed again) 
	RET
.L9439
	XOR A
	LD (&BE78),A
	JP L9347
.Process_Disc_Activities
	LD HL,&0605
	LD (INITIAL_CURSOR_POSITION),HL
	XOR A ; ld a,0 (faster)
	LD (DISC_RETRY_VALUE),A
	LD HL,DISC_RELATED_FUNCTION
	CALL &BCD4 ; KERNEL FIND COMMAND
	LD (L9629),HL ; HL contains the address of the command name to search for
	LD A,C ; C contains the ROM address (if found)
	LD (L962B),A
.L9457
	CALL &BB1B ; KM_READ_KEY
	CP &FC
	RET Z
	LD HL,&8800
	LD (DISC_CACHE_ADDRESS),HL
	LD A,(Current_Track)
	LD D,A
	LD E,&00
	LD A,(Current_Sector)
	LD C,A
	RST &18
	ADD HL,HL
	SUB (HL)
	JR NC,L9477
	LD A,C
	LD (Current_Sector),A
	RET
.L9477
LD A,&0010
ADD C
LD (Current_Sector),A
JR L9457

disced_title_text:
TEXT "  DISCED  version 1.31 by Niall Brady © 1988",&0D,&0A,&0A
TEXT "  "
TEXT "   Track >",&09,&09
TEXT "   Sector >",&09,&09
TEXT "   Page >",&00 ; NULL code to end TEXT block ?
TEXT "Press Control + H for Help or Press ESC to Exit",&00 
TEXT &02 ; Turn off text cursor
TEXT "Press [CONTROL] + [key]",&0D,&0A,&0A
TEXT "C - Cat Disc",&0D,&0A
TEXT "P - Page Flip",&0D,&0A
TEXT "T - Read Track",&0D,&0A
TEXT &F0," - Next Track",&0D,&0A
TEXT &F3," - Next Sector",&0D,&0A
TEXT &F1," - Back Track",&0D,&0A
TEXT &F2," - Back Sector",&0D,&0A
TEXT "G - Goto Sector",&0D,&0A
TEXT "A - Ascii Input",&0D,&0A
TEXT "W - Write Sector",&0D,&0A
TEXT "S - Store Sector",&0D,&0A
TEXT "R - Recover Sector",&0D,&0A,&00 
TEXT &07 ; beep
TEXT &18 ; Exchange Pen and Paper Inks
TEXT "** Write disc (Y/N) **",&18,&00 
TEXT &07 ; beep
TEXT &18 ; Exchange Pen and Paper Inks
TEXT "** Exit DISCED (Y/N) **",&18,&00 

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
DEFB 00
:Control_help_text_string
TEXT "Press Control + H for Help or press ESC to Exit",&00

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
Current_Sector:
	defb &00
Current_Track:
	defb &00
DISC_RETRY_VALUE:
defb &00
INITIAL_CURSOR_POSITION:
defb &05,&06
DISC_RELATED_FUNCTION:
defb &84 ; READ_SECTOR
defb &3C
.L9627
LD B,&0084
.L9629
INC A
.L962A
RET NZ
.L962B
RLCA
DISC_CACHE_ADDRESS:
defb &00,&88
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
