     INCLUDE Irvine32.inc



      GetKeyState PROTO, nVirtkey:DWORD ; Get keyboard inputs
      
      VK_LEFT		EQU		000000025h
      VK_UP		EQU		000000026h
      VK_RIGHT	EQU		000000027h
      VK_DOWN		EQU		000000028h
      VK_W		EQU		000000057h
      VK_A		EQU		000000041h
      VK_S		EQU		000000053h
      VK_D		EQU		000000044h
      VK_ENTER	EQU		00000000Dh
      VK_SPACEBAR	EQU		000000020h
      
      mCursorMoveTo MACRO axisX:REQ, axisY:REQ	 ; the cursor moves to the position of axisX and axisY
      	PUSH edx
      	MOV dl, axisX
      	MOV dh, axisY
      	call Gotoxy
      	POP edx
      ENDM
      

      .data

	  
	  next_2_point DWORD 0
	  s_0 byte " v",0
	  w_0 byte " ^",0
	  a_0 byte " <",0
	  d_0 byte " >",0
	 row DWORD    0,0,0,0,
					0,0,0,0,
					0,0,0,0,
					0,0,0,0
	 score DWORD 0
	
	

					
	  step Dword 0
space byte "                          ", 0
yoursocre byte "score:",0
yourstep byte "   step:",0

is_not_full Dword 1
is_moved Dword 0

last_op dword 0
      	cursor_X byte 0
      	cursor_Y byte 0	
		
		tube_line      BYTE "|", 0
		horizontal_line BYTE " +---------+---------+---------+---------+", 0
		vertical_line   BYTE " |         |         |         |         |", 0


         win_1 byte                        "        ##             !!!   " ,0
         win_11 byte                       " ################     !!:!!  " ,0
         win_111 byte                      "  ##                  !:::!  " ,0
         win_1111 byte                     "   #############      !:::!  " ,0      
         win_11111 byte                    "                      !:::!  " ,0
         win_111111 byte                   "   #############      !:::!  " ,0
         win_1111111 byte                  "   ##        ##       !:::!  " ,0
         win_11111111 byte                 "   ############       !:::!  " ,0
         win_111111111 byte                "                      !:::!  " ,0
         win_1111111111 byte               "  ###  ##### ####     !:::!  " ,0
         win_11111111111 byte              "  # #  #   #  # #     !!:!!  " ,0
         win_111111111111 byte             "  ###  #####  # #      !!!   " ,0
         win_1111111111111 byte            "  # #  ##### ####            " ,0
         win_11111111111111 byte           "  ###  #   #  # #      !!!   " ,0
         win_111111111111111 byte          "  # #  #####  # #     !!:!!  " ,0
         win_1111111111111111 byte         " # ##   # #  #   #     !!!   " ,0


w_1 byte " .----------------. ",0
w_11 byte "| .--------------. |" ,0
w_111 byte "| | _____  _____ | |" ,0
w_1111 byte "| ||_   _||_   _|| |" ,0
w_11111 byte "| |  | | /\ | |  | |" ,0
w_111111 byte "| |  | |/  \| |  | |" ,0
w_1111111 byte "| |  |   /\   |  | |" ,0
w_11111111 byte "| |  |__/  \__|  | |" ,0
w_111111111 byte "| |              | |" ,0
w_1111111111 byte "| '--------------' |" ,0
w_11111111111 byte " '----------------' " ,0


a_1 byte " .----------------. ",0
a_11 byte "| .--------------. |",0
a_111 byte "| |      __      | | ",0
a_1111 byte "| |     /  \     | | ",0
a_11111 byte "| |    / /\ \    | | ",0
a_111111 byte "| |   / ____ \   | | ",0
a_1111111 byte "| | _/ /    \ \_ | | ",0
a_11111111 byte "| ||____|  |____|| |",0
a_111111111 byte "| |              | | ",0
a_1111111111 byte "| '--------------' | ",0
a_11111111111 byte " '----------------'  ",0


s_1 byte " .----------------. ",0
s_11 byte "| .--------------. |",0
s_111 byte "| |    _______   | |",0
s_1111 byte "| |   /  ___  |  | |",0
s_11111 byte "| |  |  (__ \_|  | |",0
s_111111 byte "| |   '.___`-.   | |",0
s_1111111 byte "| |  |`\____) |  | |",0
s_11111111 byte "| |  |_______.'  | |",0
s_111111111 byte "| |              | |",0
s_1111111111 byte "| '--------------' |",0
s_11111111111 byte " '----------------' ",0


d_1 byte " .----------------. ",0
d_11 byte "| .--------------. |",0
d_111 byte "| |  ________    | |",0
d_1111 byte "| | |_   ___ `.  | |",0
d_11111 byte "| |   | |   `. \ | |",0
d_111111 byte "| |   | |    | | | |",0
d_1111111 byte "| |  _| |___.' / | |",0
d_11111111 byte "| | |________.'  | |",0
d_111111111 byte "| |              | |",0
d_1111111111 byte "| '--------------' |",0
d_11111111111 byte " '----------------' ",0







unkown_1 byte"   .-''''-..     " ,0
unkown_11 byte" .' .'''.   `.   " ,0
unkown_111 byte"/    \   \    `. " ,0
unkown_1111 byte"\    '   |     | " ,0
unkown_11111 byte" `--'   /     /  " ,0
unkown_111111 byte"      .'  ,-''   " ,0
unkown_1111111 byte"      |  /       " ,0
unkown_11111111 byte"      | '        " ,0
unkown_111111111 byte"      '-'        " ,0
unkown_1111111111 byte"     .--.        " ,0
unkown_11111111111 byte"    /    \       " ,0
unkown_111111111111 byte"    \    /       " ,0
unkown_1111111111111 byte"     `--'        " ,0



gg_1       byte"  ________   ________ ",0
gg_11      byte" /  _____/  /  _____/ ",0
gg_111     byte"/   \  ___ /   \  ___ ",0
gg_1111    byte"\    \_\  \\    \_\  \",0
gg_11111   byte" \______  / \______  /",0
gg_111111  byte"        \/         \/ ",0
		
		high_score    DWORD   0
		high_score_message BYTE "Highest Score: ", 0
		restart_message BYTE "Press ENTER to restart...", 0
yourop byte "Your operation:",0
      .code
	  
	UpdateScore PROC
    mov eax, score
    cmp eax, high_score
    jl skip_update_high_score
    mov high_score, eax
	skip_update_high_score:
    ret
	UpdateScore ENDP

;--------------------------------------------------------------
; 用空格填滿遊戲畫面右上方
ClearRightAbove PROC
;
;--------------------------------------------------------------
push edx
push ecx

mov cursor_Y,0
 mov ecx ,20
 
 lp_cl_with_space:
 mCursorMoveTo 42,cursor_Y
 mov edx,OFFSET space
 call WriteString 
inc cursor_Y
loop lp_cl_with_space
 
pop ecx
pop eax
ret 
ClearRightAbove endp



;--------------------------------------------------------------
 ResetGame PROC
; 重置遊戲狀態，但保留最高分數
mov score, 0
mov step, 0
; 重置棋盤 (row 陣列)
mov ecx, 16
lea edi, row
xor eax, eax
rep stosd
; 添加其他需要的重置邏輯

	mov last_op,7   ;;reset last key input
	
	call ClearRightAbove

    call GetNew2XYPoint  ; 生成新的起始方塊

    call DrawMain        ; 重新繪製遊戲畫面
    ret
ResetGame ENDP

;--------------------------------------------------------------
		  UpdateHighScoreOnGameEnd PROC
    mov eax, score
    cmp eax, high_score
    jle no_update_high_score
    mov high_score, eax
no_update_high_score:
    ret
UpdateHighScoreOnGameEnd ENDP



;--------------------------------------------------------------
; 遊戲棋盤內方塊向d移
	  MoveDown PROC
;這個funtion下面的註釋的座標是錯的，要看註釋的話參考moveleft的
;--------------------------------------------------------------
	  	  mov last_op,3
		  push edx
		push eax
		mov is_moved,0			

	  		;;;;;;;;;;;;;;;;;;
		;_________________________________________________
		;remove 0 in middle
		    .IF [row+16]==0&& [row+0]!=0 

		mov is_moved,2352
        mov eax,[row+0]
        mov [row+16],eax
        mov [row+0],0
			.ENDIF
						
	
		
			.IF [row+32]==0&&( [row+16]!=0|| [row+0]!=0)
		mov is_moved,2332
        mov eax,[row+16]
        mov [row+32],eax
        mov eax,[row+0]
        mov [row+16],eax
        mov [row+0],0
			.ENDIF
				.IF [row+48]==0&&( [row+32]!=0|| [row+16]!=0|| [row+0]!=0)
		mov is_moved,232
		mov eax,[row+32]
		mov [row+48],eax
        mov eax,[row+16]
        mov [row+32],eax
        mov eax,[row+0]
        mov [row+16],eax
        mov [row+0],0
			.ENDIF
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					
		.IF [row+20]==0&& [row+4]!=0 
		mov is_moved,209

        mov eax,[row+4]
        mov [row+20],eax
        mov [row+4],0
			.ENDIF	
			.IF [row+36]==0&&( [row+20]!=0|| [row+4]!=0)
		mov is_moved,255
        mov eax,[row+20]
        mov [row+36],eax
        mov eax,[row+4]
        mov [row+20],eax
        mov [row+4],0
			.ENDIF
		.IF [row+52]==0&&( [row+20]!=0|| [row+36]!=0|| [row+4]!=0)
		
		mov is_moved,25
		mov eax,[row+36]
		mov [row+52],eax
        mov eax,[row+20]
        mov [row+36],eax
        mov eax,[row+4]
        mov [row+20],eax
        mov [row+4],0
		
		.ENDIF
		
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.IF [row+24]==0&& [row+8]!=0 
		mov is_moved,209

        mov eax,[row+8]
        mov [row+24],eax
        mov [row+8],0
			.ENDIF	
			.IF [row+40]==0&&( [row+24]!=0|| [row+8]!=0)
		mov is_moved,255
        mov eax,[row+24]
        mov [row+40],eax
        mov eax,[row+8]
        mov [row+24],eax
        mov [row+8],0
			.ENDIF
		.IF [row+56]==0&&( [row+40]!=0|| [row+24]!=0|| [row+8]!=0)
		
		mov is_moved,25
		mov eax,[row+40]
		mov [row+56],eax
        mov eax,[row+24]
        mov [row+40],eax
        mov eax,[row+8]
        mov [row+24],eax
        mov [row+8],0
		
		.ENDIF
		
			;;;;;;;;;;;;;;;;;;;;;;;;
	.IF [row+28]==0&& [row+12]!=0 

		mov is_moved,245
        mov eax,[row+12]
        mov [row+28],eax
        mov [row+12],0
			.ENDIF			
			
			.IF [row+44]==0&&( [row+28]!=0|| [row+12]!=0)
		mov is_moved,2564
        mov eax,[row+28]
        mov [row+44],eax
        mov eax,[row+12]
        mov [row+28],eax
        mov [row+12],0
			.ENDIF			
			.IF [row+60]==0&&( [row+44]!=0|| [row+28]!=0|| [row+12]!=0)
		mov is_moved,233
		mov eax,[row+44]
		mov [row+60],eax
        mov eax,[row+28]
        mov [row+44],eax
        mov eax,[row+12]
        mov [row+28],eax
        mov [row+12],0
			.ENDIF
		
				
			
		
		
	
		;remove 0 in middle
		;_________________________________________________
		;;;;;;;;;;;;;;;;;;;;;
		
		
		
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測00 & 01
		mov eax,[row+48]
		cmp eax,0		
		je            not_same_dn_00_01
		cmp eax,[row+32]
		jne not_same_dn_00_01
		;;;;  if 00 & 01 same :
 mov is_moved,10001
        shl [row+48],1
			mov eax,[row+48]
		add score,eax
        mov eax,[row+16]
        mov [row+32],eax
        mov eax,[row+0]
        mov [row+16],eax
        mov [row+0],0
		;;;;檢測00 & 01
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_dn_00_01: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測01 & 02
		mov eax,[row+16] 
		cmp eax,0		
		je            not_same_dn_01_02
		cmp eax,[row+32] 
		jne not_same_dn_01_02
		;;;;  if 01 & 02 same :
 mov is_moved,10102
        shl [row+32] ,1
			mov eax,[row+32]
		add score,eax
        mov eax,[row+0]
        mov [row+16],eax
        mov [row+0],0
		;;;;檢測01 & 02
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_dn_01_02: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測02 & 03
		mov eax,[row+16] 
		cmp eax,0		
		je            not_same_dn_02_03
		cmp eax,[row+0] 
		jne not_same_dn_02_03
		;;;;  if 02 & 03 same :
 mov is_moved,10203
        shl [row+16] ,1
			mov eax,[row+16]
		add score,eax
        mov [row+0],0
		;;;;檢測02 & 03
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_dn_02_03:		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測10 & 11
		mov eax,[row+52]
		cmp eax,0		
		je            not_same_dn_10_11
		cmp eax,[row+36]
		jne not_same_dn_10_11
		;;;;  if same :
 mov is_moved,11011
        shl [row+52],1
			mov eax,[row+52]
		add score,eax
        mov eax,[row+20]
        mov [row+36],eax
        mov eax,[row+4]
        mov [row+20],eax
        mov [row+4],0
		;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_dn_10_11: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測11 & 12
		mov eax,[row+20] 
		cmp eax,0		
		je            not_same_dn_11_12
		cmp eax,[row+36] 
		jne not_same_dn_11_12
		;;;;  if same :
 mov is_moved,11112
        shl [row+36] ,1
			mov eax,[row+36]
		add score,eax
        mov eax,[row+4]
        mov [row+20],eax
        mov [row+4],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_dn_11_12:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測12 & 13
		mov eax,[row+20] 
		cmp eax,0		
		je            not_same_dn_12_13
		cmp eax,[row+4] 
		jne not_same_dn_12_13
		;;;;  if  same :
 mov is_moved,11213
        shl [row+20] ,1
			mov eax,[row+20]
		add score,eax
        mov [row+4],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;			
not_same_dn_12_13		:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測20 & 21
		mov eax,[row+56]
		cmp eax,0		
		je            not_same_dn_20_21
		cmp eax,[row+40]
		jne not_same_dn_20_21
		;;;;  if same :
 mov is_moved,12021
        shl [row+56],1
			mov eax,[row+56]
		add score,eax
        mov eax,[row+24]
        mov [row+40],eax
        mov eax,[row+8]
        mov [row+24],eax
        mov [row+8],0
		;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_dn_20_21: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測21 & 22
		mov eax,[row+24] 
		cmp eax,0		
		je            not_same_dn_21_22
		cmp eax,[row+40] 
		jne not_same_dn_21_22
		;;;;  if same :
 mov is_moved,12122
        shl [row+40] ,1
			mov eax,[row+40]
		add score,eax
        mov eax,[row+8]
        mov [row+24],eax
        mov [row+8],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_dn_21_22:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測12 & 13
		mov eax,[row+24] 
		cmp eax,0		
		je            not_same_dn_22_23
		cmp eax,[row+8] 
		jne not_same_dn_22_23
		;;;;  if  same :
 mov is_moved,12223
        shl [row+24] ,1
			mov eax,[row+24]
		add score,eax
        mov [row+8],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;			
not_same_dn_22_23:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測30 & 31
		mov eax,[row+60]
		cmp eax,0		
		je            not_same_dn_30_31
		cmp eax,[row+44]
		jne not_same_dn_30_31
		;;;;  if same :
 mov is_moved,13031
        shl [row+60],1
			mov eax,[row+60]
		add score,eax
		mov eax,[row+28]
        mov [row+44],eax
        mov eax,[row+12]
        mov [row+28],eax
        mov [row+12],0
		;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_dn_30_31: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測31 & 32
		mov eax,[row+28] 
		cmp eax,0		
		je            not_same_dn_31_32
		cmp eax,[row+44] 
		jne not_same_dn_31_32
		;;;;  if same :
 mov is_moved,13132
        shl [row+44] ,1
			mov eax,[row+44]
		add score,eax
        mov eax,[row+12]
        mov [row+28],eax
        mov [row+12],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_dn_31_32:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測32 & 33
		mov eax,[row+28]
		cmp eax,0		
		je             not_same_dn_32_33
		cmp eax,[row+12] 
		jne not_same_dn_32_33
		;;;;  if  same :
 mov is_moved,13233
 	
        shl [row+28] ,1
		mov eax,[row+28]
		add score,eax
        mov [row+12],0

		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;			
not_same_dn_32_33:
		
		
		
		
			;;;;;;;;;;;;;;;;;;
		;_________________________________________________
		;remove 0 in middle
		    .IF [row+16]==0&& [row+0]!=0 

		mov is_moved,2352
        mov eax,[row+0]
        mov [row+16],eax
        mov [row+0],0
			.ENDIF
						
	
		
			.IF [row+32]==0&&( [row+16]!=0|| [row+0]!=0)
		mov is_moved,2332
        mov eax,[row+16]
        mov [row+32],eax
        mov eax,[row+0]
        mov [row+16],eax
        mov [row+0],0
			.ENDIF
				.IF [row+48]==0&&( [row+32]!=0|| [row+16]!=0|| [row+0]!=0)
		mov is_moved,232
		mov eax,[row+32]
		mov [row+48],eax
        mov eax,[row+16]
        mov [row+32],eax
        mov eax,[row+0]
        mov [row+16],eax
        mov [row+0],0
			.ENDIF
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					
		.IF [row+20]==0&& [row+4]!=0 
		mov is_moved,209

        mov eax,[row+4]
        mov [row+20],eax
        mov [row+4],0
			.ENDIF	
			.IF [row+36]==0&&( [row+20]!=0|| [row+4]!=0)
		mov is_moved,255
        mov eax,[row+20]
        mov [row+36],eax
        mov eax,[row+4]
        mov [row+20],eax
        mov [row+4],0
			.ENDIF
		.IF [row+52]==0&&( [row+20]!=0|| [row+36]!=0|| [row+4]!=0)
		
		mov is_moved,25
		mov eax,[row+36]
		mov [row+52],eax
        mov eax,[row+20]
        mov [row+36],eax
        mov eax,[row+4]
        mov [row+20],eax
        mov [row+4],0
		
		.ENDIF
		
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.IF [row+24]==0&& [row+8]!=0 
		mov is_moved,209

        mov eax,[row+8]
        mov [row+24],eax
        mov [row+8],0
			.ENDIF	
			.IF [row+40]==0&&( [row+24]!=0|| [row+8]!=0)
		mov is_moved,255
        mov eax,[row+24]
        mov [row+40],eax
        mov eax,[row+8]
        mov [row+24],eax
        mov [row+8],0
			.ENDIF
		.IF [row+56]==0&&( [row+40]!=0|| [row+24]!=0|| [row+8]!=0)
		
		mov is_moved,25
		mov eax,[row+40]
		mov [row+56],eax
        mov eax,[row+24]
        mov [row+40],eax
        mov eax,[row+8]
        mov [row+24],eax
        mov [row+8],0
		
		.ENDIF
		
			;;;;;;;;;;;;;;;;;;;;;;;;
	.IF [row+28]==0&& [row+12]!=0 

		mov is_moved,245
        mov eax,[row+12]
        mov [row+28],eax
        mov [row+12],0
			.ENDIF			
			
			.IF [row+44]==0&&( [row+28]!=0|| [row+12]!=0)
		mov is_moved,2564
        mov eax,[row+28]
        mov [row+44],eax
        mov eax,[row+12]
        mov [row+28],eax
        mov [row+12],0
			.ENDIF			
			.IF [row+60]==0&&( [row+44]!=0|| [row+28]!=0|| [row+12]!=0)
		mov is_moved,233
		mov eax,[row+44]
		mov [row+60],eax
        mov eax,[row+28]
        mov [row+44],eax
        mov eax,[row+12]
        mov [row+28],eax
        mov [row+12],0
			.ENDIF
		
				
			
		
		
	
		;remove 0 in middle
		;_________________________________________________
		;;;;;;;;;;;;;;;;;;;;;
		
		
		
		
		
		
		
		
		.IF is_moved
		inc step

		call GetNew2XYPoint
	  

.endif

		call DrawMain
mov eax,166
call delay

	  pop eax
	  pop edx
	  ret
	  MoveDown endp
	  
 
	  	   
		  
		  
;--------------------------------------------------------------
; 遊戲棋盤內方塊向up移
	  MoveUp PROC
;這個funtion下面的註釋的座標是錯的，要看註釋的話參考moveleft的
;--------------------------------------------------------------
	  mov last_op,1
	  push edx
	  push eax
		mov is_moved,0			

	  		;;;;;;;;;;;;;;;;;;
		;_________________________________________________
		;remove 0 in middle
		    .IF [row+32]==0&&  [row+48]!=0

		mov is_moved,2352
        mov eax,[row+48]
        mov [row+32],eax
        mov [row+48],0
			.ENDIF
						
	
		
			.IF [row+16]==0&& [row+32]!=0 &&( [row+48]!=0  )
		mov is_moved,2332
        mov eax,[row+32]
        mov [row+16],eax
        mov eax,[row+48]
        mov [row+32],eax
        mov [row+48],0
			.ENDIF
				.IF [row+0]==0&&( [row+16]!=0|| [row+32]!=0|| [row+48]!=0)
		mov is_moved,232
		mov eax,[row+16]
		mov [row+0],eax
        mov eax,[row+32]
        mov [row+16],eax
        mov eax,[row+48]
        mov [row+32],eax
        mov [row+48],0
			.ENDIF
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					
		.IF [row+36]==0&& [row+52]!=0 
		mov is_moved,209

        mov eax,[row+52]
        mov [row+36],eax
        mov [row+52],0
			.ENDIF	
			.IF [row+20]==0&&( [row+52]!=0 || [row+36]!=0)
		mov is_moved,255
        mov eax,[row+36]
        mov [row+20],eax
        mov eax,[row+52]
        mov [row+36],eax
        mov [row+52],0
			.ENDIF
		.IF [row+4]==0&&( [row+52]!=0|| [row+36]!=0|| [row+20]!=0)
		
		mov is_moved,25
		mov eax,[row+20]
		mov [row+4],eax
        mov eax,[row+36]
        mov [row+20],eax
        mov eax,[row+52]
        mov [row+36],eax
        mov [row+52],0
		
		.ENDIF
		
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.IF [row+40]==0&& [row+56]!=0 
		mov is_moved,209

        mov eax,[row+56]
        mov [row+40],eax
        mov [row+56],0
			.ENDIF	
			.IF [row+24]==0&&( [row+56]!=0 || [row+40]!=0)
		mov is_moved,255
        mov eax,[row+40]
        mov [row+24],eax
        mov eax,[row+56]
        mov [row+40],eax
        mov [row+56],0
			.ENDIF
		.IF [row+8]==0&&( [row+56]!=0|| [row+40]!=0|| [row+24]!=0)
		
		mov is_moved,25
		mov eax,[row+24]
		mov [row+8],eax
        mov eax,[row+40]
        mov [row+24],eax
        mov eax,[row+56]
        mov [row+40],eax
        mov [row+56],0
		
		.ENDIF
		
			;;;;;;;;;;;;;;;;;;;;;;;;
		.IF [row+44]==0&& [row+60]!=0 
		mov is_moved,245
        mov eax,[row+60]
        mov [row+44],eax
        mov [row+60],0
			.ENDIF			
			
			.IF [row+28]==0&&( [row+44]!=0 || [row+60]!=0)
		mov is_moved,2604
        mov eax,[row+44]
        mov [row+28],eax
        mov eax,[row+60]
        mov [row+44],eax
        mov [row+60],0
			.ENDIF			
			.IF [row+12]==0&&( [row+28]!=0|| [row+44]!=0|| [row+60]!=0)
		mov is_moved,233
		mov eax,[row+28]
		mov [row+12],eax
        mov eax,[row+44]
        mov [row+28],eax
        mov eax,[row+60]
        mov [row+44],eax
        mov [row+60],0
			.ENDIF
		
				
			
		
		
	
		;remove 0 in middle
		;_________________________________________________
		;;;;;;;;;;;;;;;;;;;;;

		
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測00 & 01
		mov eax,[row+0]
		cmp eax,0		
		je            not_same_dn_00_01
		cmp eax,[row+16]
		jne not_same_dn_00_01
		;;;;  if 00 & 01 same :
 mov is_moved,10001
        shl [row+0],1
			mov eax,[row+0]
		add score,eax
        mov eax,[row+32]
        mov [row+16],eax
        mov eax,[row+48]
        mov [row+32],eax
        mov [row+48],0
		;;;;檢測00 & 01
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_dn_00_01: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測01 & 02
		mov eax,[row+32]
		cmp eax,0		
		je             not_same_dn_01_02
		cmp eax,[row+16] 
		jne not_same_dn_01_02
		;;;;  if 01 & 02 same :
 mov is_moved,10102
        shl [row+16] ,1
			mov eax,[row+16]
		add score,eax
        mov eax,[row+48]
        mov [row+32],eax
        mov [row+48],0
		;;;;檢測01 & 02
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_dn_01_02: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測02 & 03
		mov eax,[row+32] 
		cmp eax,0		
		je            not_same_dn_02_03
		cmp eax,[row+48] 
		jne not_same_dn_02_03
		;;;;  if 02 & 03 same :
 mov is_moved,10203
        shl [row+32] ,1
			mov eax,[row+32]
		add score,eax
        mov [row+48],0
		;;;;檢測02 & 03
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_dn_02_03:		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測10 & 11
		mov eax,[row+4]
		cmp eax,0		
		je            not_same_dn_10_11
		cmp eax,[row+20]
		jne not_same_dn_10_11
		;;;;  if same :
 mov is_moved,11011
        shl [row+4],1
			mov eax,[row+4]
		add score,eax
        mov eax,[row+36]
        mov [row+20],eax
        mov eax,[row+52]
        mov [row+36],eax
        mov [row+52],0
		;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_dn_10_11: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測11 & 12
		mov eax,[row+36] 
		cmp eax,0		
		je            not_same_dn_11_12
		cmp eax,[row+20] 
		jne not_same_dn_11_12
		;;;;  if same :
 mov is_moved,11112
        shl [row+20] ,1
			mov eax,[row+20]
		add score,eax
        mov eax,[row+52]
        mov [row+36],eax
        mov [row+52],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_dn_11_12:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測12 & 13
		mov eax,[row+36] 
		cmp eax,0		
		je            not_same_dn_12_13
		cmp eax,[row+52] 
		jne not_same_dn_12_13
		;;;;  if  same :
 mov is_moved,11213
        shl [row+36] ,1
			mov eax,[row+36]
		add score,eax
        mov [row+52],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;			
not_same_dn_12_13		:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測20 & 21
		mov eax,[row+8]
		cmp eax,0		
		je            not_same_dn_20_21
		cmp eax,[row+24]
		jne not_same_dn_20_21
		;;;;  if same :
 mov is_moved,12021
        shl [row+8],1
			mov eax,[row+8]
		add score,eax
        mov eax,[row+40]
        mov [row+24],eax
        mov eax,[row+56]
        mov [row+40],eax
        mov [row+56],0
		;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_dn_20_21: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測21 & 22
		mov eax,[row+40] 
		cmp eax,0		
		je            not_same_dn_21_22
		cmp eax,[row+24] 
		jne not_same_dn_21_22
		;;;;  if same :
 mov is_moved,12122
        shl [row+24] ,1
			mov eax,[row+24]
		add score,eax
        mov eax,[row+56]
        mov [row+40],eax
        mov [row+56],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_dn_21_22:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測12 & 13
		mov eax,[row+40] 
		cmp eax,0		
		je            not_same_dn_22_23
		cmp eax,[row+56] 
		jne not_same_dn_22_23
		;;;;  if  same :
 mov is_moved,12223
        shl [row+40] ,1
			mov eax,[row+40]
		add score,eax
        mov [row+56],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;			
not_same_dn_22_23:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測30 & 31
		mov eax,[row+12]
		cmp eax,0		
		je            not_same_dn_30_31
		cmp eax,[row+28]
		jne not_same_dn_30_31
		;;;;  if same :
		mov is_moved,13031
        shl [row+12],1
			mov eax,[row+12]
		add score,eax
		mov eax,[row+44]
        mov [row+28],eax
        mov eax,[row+60]
        mov [row+44],eax
        mov [row+60],0
		;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_dn_30_31: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測31 & 32
		mov eax,[row+44] 
		cmp eax,0		
		je            not_same_dn_31_32
		cmp eax,[row+28] 
		jne not_same_dn_31_32
		;;;;  if same :
 mov is_moved,13132
        shl [row+28] ,1
			mov eax,[row+28]
		add score,eax
        mov eax,[row+60]
        mov [row+44],eax
        mov [row+60],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_dn_31_32:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測32 & 33
		mov eax,[row+44] 
		cmp eax,0		
		je            not_same_dn_32_33
		cmp eax,[row+60] 
		jne not_same_dn_32_33
		;;;;  if  same :
 mov is_moved,13233
 	
        shl [row+44] ,1
		mov eax,[row+44]
		add score,eax
        mov [row+60],0

		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;			
not_same_dn_32_33:


		
			;;;;;;;;;;;;;;;;;;
		;_________________________________________________
		;remove 0 in middle
		    .IF [row+32]==0&&  [row+48]!=0

		mov is_moved,2352
        mov eax,[row+48]
        mov [row+32],eax
        mov [row+48],0
			.ENDIF
						
	
		
			.IF [row+16]==0&& [row+32]!=0 &&( [row+48]!=0  )
		mov is_moved,2332
        mov eax,[row+32]
        mov [row+16],eax
        mov eax,[row+48]
        mov [row+32],eax
        mov [row+48],0
			.ENDIF
				.IF [row+0]==0&&( [row+16]!=0|| [row+32]!=0|| [row+48]!=0)
		mov is_moved,232
		mov eax,[row+16]
		mov [row+0],eax
        mov eax,[row+32]
        mov [row+16],eax
        mov eax,[row+48]
        mov [row+32],eax
        mov [row+48],0
			.ENDIF
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					
		.IF [row+36]==0&& [row+52]!=0 
		mov is_moved,209

        mov eax,[row+52]
        mov [row+36],eax
        mov [row+52],0
			.ENDIF	
			.IF [row+20]==0&&( [row+52]!=0 || [row+36]!=0)
		mov is_moved,255
        mov eax,[row+36]
        mov [row+20],eax
        mov eax,[row+52]
        mov [row+36],eax
        mov [row+52],0
			.ENDIF
		.IF [row+4]==0&&( [row+52]!=0|| [row+36]!=0|| [row+20]!=0)
		
		mov is_moved,25
		mov eax,[row+20]
		mov [row+4],eax
        mov eax,[row+36]
        mov [row+20],eax
        mov eax,[row+52]
        mov [row+36],eax
        mov [row+52],0
		
		.ENDIF
		
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.IF [row+40]==0&& [row+56]!=0 
		mov is_moved,209

        mov eax,[row+56]
        mov [row+40],eax
        mov [row+56],0
			.ENDIF	
			.IF [row+24]==0&&( [row+56]!=0 || [row+40]!=0)
		mov is_moved,255
        mov eax,[row+40]
        mov [row+24],eax
        mov eax,[row+56]
        mov [row+40],eax
        mov [row+56],0
			.ENDIF
		.IF [row+8]==0&&( [row+56]!=0|| [row+40]!=0|| [row+24]!=0)
		
		mov is_moved,25
		mov eax,[row+24]
		mov [row+8],eax
        mov eax,[row+40]
        mov [row+24],eax
        mov eax,[row+56]
        mov [row+40],eax
        mov [row+56],0
		
		.ENDIF
		
			;;;;;;;;;;;;;;;;;;;;;;;;
				.IF [row+44]==0&& [row+60]!=0 
		mov is_moved,245
        mov eax,[row+60]
        mov [row+44],eax
        mov [row+60],0
			.ENDIF			
			
			.IF [row+28]==0&&( [row+44]!=0 || [row+60]!=0)
		mov is_moved,2604
        mov eax,[row+44]
        mov [row+28],eax
        mov eax,[row+60]
        mov [row+44],eax
        mov [row+60],0
			.ENDIF			
			.IF [row+12]==0&&( [row+28]!=0|| [row+44]!=0|| [row+60]!=0)
		mov is_moved,233
		mov eax,[row+28]
		mov [row+12],eax
        mov eax,[row+44]
        mov [row+28],eax
        mov eax,[row+60]
        mov [row+44],eax
        mov [row+60],0
			.ENDIF
		
				
			
		
		
	
		;remove 0 in middle
		;_________________________________________________
		;;;;;;;;;;;;;;;;;;;;;
		
	;	mov eax,is_moved
	;	call Writeint
	;	call Writeint
	;	call Writeint
	;	call Writeint
	;	call Writeint
	;	call crlf

		.IF is_moved
		inc step
		call GetNew2XYPoint
		
		.ENDIF
		
		call DrawMain
mov eax,166
call delay
		
		
		
		

	  pop eax
	  pop edx
	  ret
	  MoveUp endp
	   
		  
;--------------------------------------------------------------
; 遊戲棋盤內方塊向right移
	  MoveRight PROC
;這個funtion下面的註釋的座標是錯的，要看註釋的話參考moveleft的
;--------------------------------------------------------------
		  mov last_op,4
		  push edx
	  push eax
		mov is_moved,0			

	  		;;;;;;;;;;;;;;;;;;     &&( [row+]!=0|| [row+]!=0|| [row+]!=0)
		;_________________________________________________
		;remove 0 in middle
		    .IF [row+4]==0&& [row+0]!=0

		mov is_moved,2352
        mov eax,[row+0]
        mov [row+4],eax
        mov [row+0],0
			.ENDIF
						
	
		
			.IF [row+8]==0&&( [row+0]!=0|| [row+4]!=0)
		mov is_moved,2332
        mov eax,[row+4]
        mov [row+8],eax
        mov eax,[row+0]
        mov [row+4],eax
        mov [row+0],0
			.ENDIF
				.IF [row+12]==0&&( [row+0]!=0|| [row+4]!=0|| [row+8]!=0)
		mov is_moved,232
		mov eax,[row+8]
		mov [row+12],eax
        mov eax,[row+4]
        mov [row+8],eax
        mov eax,[row+0]
        mov [row+4],eax
        mov [row+0],0
			.ENDIF
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					
		.IF [row+20]==0&& [row+16]!=0
		mov is_moved,209

        mov eax,[row+16]
        mov [row+20],eax
        mov [row+16],0
			.ENDIF	
			.IF [row+24]==0&&( [row+16]!=0|| [row+20]!=0)
		mov is_moved,255
        mov eax,[row+20]
        mov [row+24],eax
        mov eax,[row+16]
        mov [row+20],eax
        mov [row+16],0
			.ENDIF
		.IF [row+28]==0&&( [row+16]!=0|| [row+20]!=0|| [row+24]!=0)
		
		mov is_moved,25
		mov eax,[row+24]
		mov [row+28],eax
        mov eax,[row+20]
        mov [row+24],eax
        mov eax,[row+16]
        mov [row+20],eax
        mov [row+16],0
		
		.ENDIF
		
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF [row+36]==0&& [row+32]!=0

		mov is_moved,245
        mov eax,[row+32]
        mov [row+36],eax
        mov [row+32],0
			.ENDIF		
			
		
			.IF [row+40]==0&&( [row+32]!=0|| [row+36]!=0)
		mov is_moved,2564
        mov eax,[row+36]
        mov [row+40],eax
        mov eax,[row+32]
        mov [row+36],eax
        mov [row+32],0
			.ENDIF
				
			
			.IF [row+44]==0&&( [row+32]!=0|| [row+36]!=0|| [row+40]!=0)
		mov is_moved,233
		mov eax,[row+40]
		mov [row+44],eax
        mov eax,[row+36]
        mov [row+40],eax
        mov eax,[row+32]
        mov [row+36],eax
        mov [row+32],0
			.ENDIF
		
			;;;;;;;;;;;;;;;;;;;;;;;;
	.IF [row+52]==0&& [row+48]!=0

		mov is_moved,245
        mov eax,[row+48]
        mov [row+52],eax
        mov [row+48],0
			.ENDIF			
			
			.IF [row+56]==0&&( [row+52]!=0|| [row+48]!=0)
		mov is_moved,2564
        mov eax,[row+52]
        mov [row+56],eax
        mov eax,[row+48]
        mov [row+52],eax
        mov [row+48],0
			.ENDIF			
			.IF [row+60]==0&&( [row+48]!=0|| [row+52]!=0|| [row+56]!=0)
		mov is_moved,233
		mov eax,[row+56]
		mov [row+60],eax
        mov eax,[row+52]
        mov [row+56],eax
        mov eax,[row+48]
        mov [row+52],eax
        mov [row+48],0
			.ENDIF
		
				
			
		
		
	
		;remove 0 in middle
		;_________________________________________________
		;;;;;;;;;;;;;;;;;;;;;
		
		
		
		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測00 & 01
		mov eax,[row+12]
		cmp eax,0		
		je            not_same_r__00_01
		cmp eax,[row+8]
		jne not_same_r__00_01
		;;;;  if 00 & 01 same :
 mov is_moved,10001
        shl [row+12],1
			mov eax,[row+12]
		add score,eax
        mov eax,[row+4]
        mov [row+8],eax
        mov eax,[row+0]
        mov [row+4],eax
        mov [row+0],0
		;;;;檢測00 & 01
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_r__00_01: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測01 & 02
		mov eax,[row+4] 
		cmp eax,0		
		je           not_same_r__01_02 
		cmp eax,[row+8] 
		jne not_same_r__01_02
		;;;;  if 01 & 02 same :
 mov is_moved,10102
        shl [row+8] ,1
			mov eax,[row+8]
		add score,eax
        mov eax,[row+0]
        mov [row+4],eax
        mov [row+0],0
		;;;;檢測01 & 02
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_r__01_02: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測02 & 03
		mov eax,[row+4] 
		cmp eax,0		
		je            not_same_r__02_03
		cmp eax,[row+0] 
		jne not_same_r__02_03
		;;;;  if 02 & 03 same :
 mov is_moved,10203
        shl [row+4] ,1
			mov eax,[row+4]
		add score,eax
        mov [row+0],0
		;;;;檢測02 & 03
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_r__02_03:		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測10 & 11
		mov eax,[row+28]
		cmp eax,0		
		je            not_same_r__10_11
		cmp eax,[row+24]
		jne not_same_r__10_11
		;;;;  if same :
 mov is_moved,11011
        shl [row+28],1
			mov eax,[row+28]
		add score,eax
        mov eax,[row+20]
        mov [row+24],eax
        mov eax,[row+16]
        mov [row+20],eax
        mov [row+16],0
		;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_r__10_11: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測11 & 12
		mov eax,[row+20] 
		cmp eax,0		
		je            not_same_r__11_12
		cmp eax,[row+24] 
		jne not_same_r__11_12
		;;;;  if same :
 mov is_moved,11112
        shl [row+24] ,1
			mov eax,[row+24]
		add score,eax
        mov eax,[row+16]
        mov [row+20],eax
        mov [row+16],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_r__11_12:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測12 & 13
		mov eax,[row+20] 
		cmp eax,0		
		je            not_same_r__12_13
		cmp eax,[row+16] 
		jne not_same_r__12_13
		;;;;  if  same :
 mov is_moved,11213
        shl [row+20] ,1
			mov eax,[row+20]
		add score,eax 
        mov [row+16],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;			
not_same_r__12_13		:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測20 & 21
		mov eax,[row+44]
		cmp eax,0		
		je            not_same_r__20_21
		cmp eax,[row+40]
		jne not_same_r__20_21
		;;;;  if same :
 mov is_moved,12021
        shl [row+44],1
			mov eax,[row+44]
		add score,eax 
        mov eax,[row+36]
        mov [row+40],eax
        mov eax,[row+32]
        mov [row+36],eax
        mov [row+32],0
		;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_r__20_21: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測21 & 22
		mov eax,[row+36] 
		cmp eax,0		
		je            not_same_r__21_22
		cmp eax,[row+40] 
		jne not_same_r__21_22
		;;;;  if same :
 mov is_moved,12122
        shl [row+40] ,1
			mov eax,[row+40]
		add score,eax
        mov eax,[row+32]
        mov [row+36],eax
        mov [row+32],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_r__21_22:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測12 & 13
		mov eax,[row+36] 
		cmp eax,0		
		je            not_same_r__22_23
		cmp eax,[row+32] 
		jne not_same_r__22_23
		;;;;  if  same :
 mov is_moved,12223
        shl [row+36] ,1
			mov eax,[row+36]
		add score,eax   
        mov [row+32],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;			
not_same_r__22_23:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測30 & 31
		mov eax,[row+60]
		cmp eax,0		
		je            not_same_r__30_31
		cmp eax,[row+56]
		jne not_same_r__30_31
		;;;;  if same :
 mov is_moved,13031
        shl [row+60],1
			mov eax,[row+60]
		add score,eax 
		mov eax,[row+52]
        mov [row+56],eax
        mov eax,[row+48]
        mov [row+52],eax
        mov [row+48],0
		;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_r__30_31: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測31 & 32
		mov eax,[row+52] 
		cmp eax,0		
		je            not_same_r__31_32
		cmp eax,[row+56] 
		jne not_same_r__31_32
		;;;;  if same :
 mov is_moved,13132
        shl [row+56] ,1
			mov eax,[row+56]
		add score,eax
        mov eax,[row+48]
        mov [row+52],eax
        mov [row+48],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_r__31_32:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測32 & 33
		mov eax,[row+52] 
		cmp eax,0		
		je            not_same_r__32_33
		cmp eax,[row+48] 
		jne not_same_r__32_33
		;;;;  if  same :
 mov is_moved,13233
 	
        shl [row+52] ,1
		mov eax,[row+52]
		add score,eax
        mov [row+48],0

		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;			
not_same_r__32_33:
				;;;;;;;;;;;;;;;;;;     &&( [row+]!=0|| [row+]!=0|| [row+]!=0)
		;_________________________________________________
		;remove 0 in middle
		    .IF [row+4]==0&& [row+0]!=0

		mov is_moved,2352
        mov eax,[row+0]
        mov [row+4],eax
        mov [row+0],0
			.ENDIF
						
	
		
			.IF [row+8]==0&&( [row+0]!=0|| [row+4]!=0)
		mov is_moved,2332
        mov eax,[row+4]
        mov [row+8],eax
        mov eax,[row+0]
        mov [row+4],eax
        mov [row+0],0
			.ENDIF
				.IF [row+12]==0&&( [row+0]!=0|| [row+4]!=0|| [row+8]!=0)
		mov is_moved,232
		mov eax,[row+8]
		mov [row+12],eax
        mov eax,[row+4]
        mov [row+8],eax
        mov eax,[row+0]
        mov [row+4],eax
        mov [row+0],0
			.ENDIF
		;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
					
		.IF [row+20]==0&& [row+16]!=0
		mov is_moved,209

        mov eax,[row+16]
        mov [row+20],eax
        mov [row+16],0
			.ENDIF	
			.IF [row+24]==0&&( [row+16]!=0|| [row+20]!=0)
		mov is_moved,255
        mov eax,[row+20]
        mov [row+24],eax
        mov eax,[row+16]
        mov [row+20],eax
        mov [row+16],0
			.ENDIF
		.IF [row+28]==0&&( [row+16]!=0|| [row+20]!=0|| [row+24]!=0)
		
		mov is_moved,25
		mov eax,[row+24]
		mov [row+28],eax
        mov eax,[row+20]
        mov [row+24],eax
        mov eax,[row+16]
        mov [row+20],eax
        mov [row+16],0
		
		.ENDIF
		
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	.IF [row+36]==0&& [row+32]!=0

		mov is_moved,245
        mov eax,[row+32]
        mov [row+36],eax
        mov [row+32],0
			.ENDIF		
			
		
			.IF [row+40]==0&&( [row+32]!=0|| [row+36]!=0)
		mov is_moved,2564
        mov eax,[row+36]
        mov [row+40],eax
        mov eax,[row+32]
        mov [row+36],eax
        mov [row+32],0
			.ENDIF
				
			
			.IF [row+44]==0&&( [row+32]!=0|| [row+36]!=0|| [row+40]!=0)
		mov is_moved,233
		mov eax,[row+40]
		mov [row+44],eax
        mov eax,[row+36]
        mov [row+40],eax
        mov eax,[row+32]
        mov [row+36],eax
        mov [row+32],0
			.ENDIF
		
			;;;;;;;;;;;;;;;;;;;;;;;;
	.IF [row+52]==0&& [row+48]!=0

		mov is_moved,245
        mov eax,[row+48]
        mov [row+52],eax
        mov [row+48],0
			.ENDIF			
			
			.IF [row+56]==0&&( [row+52]!=0|| [row+48]!=0)
		mov is_moved,2564
        mov eax,[row+52]
        mov [row+56],eax
        mov eax,[row+48]
        mov [row+52],eax
        mov [row+48],0
			.ENDIF			
			.IF [row+60]==0&&( [row+48]!=0|| [row+52]!=0|| [row+56]!=0)
		mov is_moved,233
		mov eax,[row+56]
		mov [row+60],eax
        mov eax,[row+52]
        mov [row+56],eax
        mov eax,[row+48]
        mov [row+52],eax
        mov [row+48],0
			.ENDIF
		
				
			
		
		
	
		;remove 0 in middle
		;_________________________________________________
		;;;;;;;;;;;;;;;;;;;;;
		
		
		
	;	mov eax,is_moved
	;	call Writeint
	;	call Writeint
	;	call Writeint
	;	call Writeint
	;	call Writeint
	;	call crlf

		.IF is_moved
		inc step
		
		call GetNew2XYPoint

				  
		.ENDIF
		
		call DrawMain
mov eax,166
call delay

	  pop eax
	  pop edx
	  ret
	  MoveRight endp
	  
	  	  
  
;--------------------------------------------------------------
; 遊戲棋盤內方塊向左移
	  MoveLeft PROC
;
;--------------------------------------------------------------
	 	  mov last_op,2
		  push edx
		  push eax
		  mov is_moved,0			

jmp skiponly



	  		;;;;;;;;;;;;;;;;;;
		;_________________________________________________
		;remove 0 in middle				
	    .IF [row+8]==0&& [row+12]!=0
		mov is_moved,2324

        mov eax,[row+12]
        mov [row+8],eax
        mov [row+12],0
			.ENDIF
			.IF [row+4]==0&&( [row+8]!=0|| [row+12]!=0)
		mov is_moved,242
        mov eax,[row+8]
        mov [row+4],eax
        mov eax,[row+12]
        mov [row+8],eax
        mov [row+12],0
			.ENDIF
				.IF [row]==0&&( [row+4]!=0|| [row+8]!=0|| [row+12]!=0)
		mov is_moved,242
		mov eax,[row+4]
		mov row,eax
        mov eax,[row+8]
        mov [row+4],eax
        mov eax,[row+12]
        mov [row+8],eax
        mov [row+12],0
			.ENDIF
		

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;			
		
		.IF [row+24]==0&& [row+28]!=0

		mov is_moved,235
        mov eax,[row+28]
        mov [row+24],eax
        mov [row+28],0
			.ENDIF
		
		
			.IF [row+20]==0&& ([row+28]!=0|| [row+24]!=0)
		mov is_moved,267
        mov eax,[row+24]
        mov [row+20],eax
        mov eax,[row+28]
        mov [row+24],eax
        mov [row+28],0
			.ENDIF
				
		.IF [row+16]==0&& ([row+28]!=0|| [row+24]!=0|| [row+20]!=0)
		
		mov is_moved,234
		mov eax,[row+20]
		mov [row+16],eax
        mov eax,[row+24]
        mov [row+20],eax
        mov eax,[row+28]
        mov [row+24],eax
        mov [row+28],0
		
		.ENDIF
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			
			.IF [row+40]==0&& [row+44]!=0
		mov is_moved,264

        mov eax,[row+44]
        mov [row+40],eax
        mov [row+44],0
			.ENDIF	
			.IF [row+36]==0&& ([row+44]!=0|| [row+40]!=0)
		mov is_moved,263
        mov eax,[row+40]
        mov [row+36],eax
        mov eax,[row+44]
        mov [row+40],eax
        mov [row+44],0
			.ENDIF
			.IF [row+32]==0&& ([row+44]!=0|| [row+40]!=0|| [row+36]!=0)
		mov is_moved,2745
		mov eax,[row+36]
		mov [row+32],eax
        mov eax,[row+40]
        mov [row+36],eax
        mov eax,[row+44]
        mov [row+40],eax
        mov [row+60],0
			.ENDIF
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			.IF [row+56]==0&& [row+60]!=0
		mov is_moved,264

        mov eax,[row+60]
        mov [row+56],eax
        mov [row+60],0
			.ENDIF	
			.IF [row+52]==0&& ([row+60]!=0|| [row+56]!=0)
		mov is_moved,263
        mov eax,[row+56]
        mov [row+52],eax
        mov eax,[row+60]
        mov [row+56],eax
        mov [row+60],0
			.ENDIF
			.IF [row+48]==0&& ([row+60]!=0|| [row+56]!=0|| [row+52]!=0)
		mov is_moved,2745
		mov eax,[row+52]
		mov [row+48],eax
        mov eax,[row+56]
        mov [row+52],eax
        mov eax,[row+60]
        mov [row+56],eax
        mov [row+60],0
			.ENDIF
		;remove 0 in middle
		;_________________________________________________
		;;;;;;;;;;;;;;;;;;;;;
		
		skiponly:
		
	jmp	skipuu
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測00 & 01
		mov eax,[row+0]
		cmp eax,0
		je not_same_00_01
		cmp eax,[row+4]
		jne not_same_00_01
		;;;;  if 00 & 01 same :
 mov is_moved,10001
        shl [row+0],1
			mov eax,[row+0]
		add score,eax 
        mov eax,[row+8]
        mov [row+4],eax
        mov eax,[row+12]
        mov [row+8],eax
        mov [row+12],0
		;;;;檢測00 & 01
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_00_01: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測01 & 02
		mov eax,[row+8] 
		cmp eax,0
		je not_same_01_02
		cmp eax,[row+4] 
		jne not_same_01_02
		;;;;  if 01 & 02 same :
 mov is_moved,10102
        shl [row+4] ,1
			mov eax,[row+4]
		add score,eax  
        mov eax,[row+12]
        mov [row+8],eax
        mov [row+12],0
		;;;;檢測01 & 02
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_01_02: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測02 & 03
		mov eax,[row+8] 
		cmp eax,0
		je not_same_02_03
		cmp eax,[row+12] 
		jne not_same_02_03
		;;;;  if 02 & 03 same :
 mov is_moved,10203
        shl [row+8] ,1
			mov eax,[row+8]
		add score,eax  
        mov [row+12],0
		;;;;檢測02 & 03
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_02_03:		
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測10 & 11
		mov eax,[row+16]
		cmp eax,0
		je not_same_10_11
		cmp eax,[row+20]
		jne not_same_10_11
		;;;;  if same :
 mov is_moved,11011
        shl [row+16],1
			mov eax,[row+16]
		add score,eax 
        mov eax,[row+24]
        mov [row+20],eax
        mov eax,[row+28]
        mov [row+24],eax
        mov [row+28],0
		;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_10_11: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測11 & 12
		mov eax,[row+24] 
		cmp eax,0
		je not_same_11_12
		cmp eax,[row+20] 
		jne not_same_11_12
		;;;;  if same :
 mov is_moved,11112
        shl [row+20] ,1
			mov eax,[row+20]
		add score,eax 
        mov eax,[row+28]
        mov [row+24],eax
        mov [row+28],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_11_12:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測12 & 13
		mov eax,[row+24] 
		cmp eax,0
		je not_same_12_13
		cmp eax,[row+28] 
		jne not_same_12_13
		;;;;  if  same :
 mov is_moved,11213
        shl [row+24] ,1
			mov eax,[row+24]
		add score,eax
        mov [row+28],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;			
not_same_12_13		:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測20 & 21
		mov eax,[row+32]
		cmp eax,0
		je not_same_20_21
		cmp eax,[row+36]
		jne not_same_20_21
		;;;;  if same :
 mov is_moved,12021
        shl [row+32],1
			mov eax,[row+32]
		add score,eax   
        mov eax,[row+40]
        mov [row+36],eax
        mov eax,[row+44]
        mov [row+40],eax
        mov [row+44],0
		;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_20_21: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測21 & 22
		mov eax,[row+40] 
		cmp eax,0
		je not_same_21_22
		cmp eax,[row+36] 
		jne not_same_21_22
		;;;;  if same :
 mov is_moved,12122
        shl [row+36] ,1
			mov eax,[row+36]
		add score,eax   
        mov eax,[row+44]
        mov [row+40],eax
        mov [row+44],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_21_22:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測12 & 13
		mov eax,[row+40] 
		cmp eax,0
		je not_same_22_23
		cmp eax,[row+44] 
		jne not_same_22_23
		;;;;  if  same :
 mov is_moved,12223
        shl [row+40] ,1
			mov eax,[row+40]
		add score,eax   
        mov [row+44],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;			
not_same_22_23:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測30 & 31
		mov eax,[row+48]
		cmp eax,0
		je not_same_30_31
		cmp eax,[row+52]
		jne not_same_30_31
		;;;;  if same :
 mov is_moved,13031
        shl [row+48],1
			mov eax,[row+48]
		add score,eax   
		mov eax,[row+56]
       mov [row+52],eax
       mov eax,[row+60]
       mov [row+56],eax
        mov [row+60],0
		;;;;
        ;;;;;;;;;;;;;;;;;;;;;;;;;;;
not_same_30_31: 
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測31 & 32
		mov eax,[row+56] 
		cmp eax,0
		je not_same_31_32
		cmp eax,[row+52] 
		jne not_same_31_32
		;;;;  if same :
                                                    mov is_moved,13132
        shl [row+52] ,1
			mov eax,[row+52]
		add score,eax
    mov eax,[row+60]
    mov [row+56],eax
        mov [row+60],0
		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;		
not_same_31_32:
		;;;;;;;;;;;;;;;;;;;;;;;;;;;
		;;;;檢測32 & 33
		mov eax,[row+56] 
		cmp eax,0
		je not_same_32_33
		cmp eax,[row+60] 
		
		jne not_same_32_33
		;;;;  if  same :
		mov is_moved,4433
 	
        shl [row+56] ,1
		mov eax,[row+56]
		add score,eax
        mov [row+60],0

		;;;;
		;;;;;;;;;;;;;;;;;;;;;;;;;;;			
not_same_32_33:




skipuu:
;jmp skipaaaa

			;_________________________________________________
		;remove 0 in middle				
	    .IF [row+8]==0&& [row+12]!=0
		mov is_moved,2324

        mov eax,[row+12]
        mov [row+8],eax
        mov [row+12],0
			.ENDIF
			.IF [row+4]==0&&( [row+8]!=0|| [row+12]!=0)
		mov is_moved,242
        mov eax,[row+8]
        mov [row+4],eax
        mov eax,[row+12]
        mov [row+8],eax
        mov [row+12],0
			.ENDIF
				.IF [row]==0&&( [row+4]!=0|| [row+8]!=0|| [row+12]!=0)
		mov is_moved,242
		mov eax,[row+4]
		mov row,eax
        mov eax,[row+8]
        mov [row+4],eax
        mov eax,[row+12]
        mov [row+8],eax
        mov [row+12],0
			.ENDIF
		

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;			
		
		.IF [row+24]==0&& [row+28]!=0

		mov is_moved,235
        mov eax,[row+28]
        mov [row+24],eax
        mov [row+28],0
			.ENDIF
		
		
			.IF [row+20]==0&& ([row+28]!=0|| [row+24]!=0)
		mov is_moved,267
        mov eax,[row+24]
        mov [row+20],eax
        mov eax,[row+28]
        mov [row+24],eax
        mov [row+28],0
			.ENDIF
				
		.IF [row+16]==0&& ([row+28]!=0|| [row+24]!=0|| [row+20]!=0)
		
		mov is_moved,234
		mov eax,[row+20]
		mov [row+16],eax
        mov eax,[row+24]
        mov [row+20],eax
        mov eax,[row+28]
        mov [row+24],eax
        mov [row+28],0
		
		.ENDIF
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			
			.IF [row+40]==0&& [row+44]!=0
		mov is_moved,264

        mov eax,[row+44]
        mov [row+40],eax
        mov [row+44],0
			.ENDIF	
			.IF [row+36]==0&& ([row+44]!=0|| [row+40]!=0)
		mov is_moved,263
        mov eax,[row+40]
        mov [row+36],eax
        mov eax,[row+44]
        mov [row+40],eax
        mov [row+44],0
			.ENDIF
			.IF [row+32]==0&& ([row+44]!=0|| [row+40]!=0|| [row+36]!=0)
		mov is_moved,2745
		mov eax,[row+36]
		mov [row+32],eax
        mov eax,[row+40]
        mov [row+36],eax
        mov eax,[row+44]
        mov [row+40],eax
        mov [row+44],0
			.ENDIF
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
				.IF [row+56]==0&& [row+60]!=0
		mov is_moved,264

        mov eax,[row+60]
        mov [row+56],eax
        mov [row+60],0
			.ENDIF	
			.IF [row+52]==0&& ([row+60]!=0|| [row+56]!=0)
		mov is_moved,263
        mov eax,[row+56]
        mov [row+52],eax
        mov eax,[row+60]
        mov [row+56],eax
        mov [row+60],0
			.ENDIF
			.IF [row+48]==0&& ([row+60]!=0|| [row+56]!=0|| [row+52]!=0)
		mov is_moved,2745
		mov eax,[row+52]
		mov [row+48],eax
        mov eax,[row+56]
        mov [row+52],eax
        mov eax,[row+60]
        mov [row+56],eax
        mov [row+60],0
			.ENDIF
	skipaaaa:
		;remove 0 in middle
		;_________________________________________________
		;;;;;;;;;;;;;;;;;;;;;
		

		.IF is_moved
		inc step
		

		call GetNew2XYPoint  
		.ENDIF
		
		
		call DrawMain
		
		
		
	;	mov eax,is_moved
	;	call Writeint
	;	call Writeint
	;	call Writeint
mov eax,166
call delay

	  pop eax
	  pop edx
	  ret
	  MoveLeft endp
	  
	  	  
	
	  
;--------------------------------------------------------------
; 印出隨機數
	  hello PROC
;
;--------------------------------------------------------------
	  push eax
	  
	  
mov eax,9999    
call RandomRange  
	  
	  
	  call Writeint	
	  pop eax
	  
	  
	  ret
	  hello endp
	  
	  
	  
;--------------------------------------------------------------
; 檢查棋盤是否已滿及不可移動
	  CkFull PROC
;
;--------------------------------------------------------------
	  	  mov is_not_full,0
	  push ecx
	 ;查是否滿
	 ;;;;;;;;;;;;;;;;;
	 mov ecx,16
	 lpckf:
	 dec ecx
	 .IF [row+4*ecx]==0	  
	 jmp AbleToMove
	; mov is_not_full,132
	; mov ecx,0
	 .ENDIF
	 inc ecx
		 loop lpckf
	 ;;;;;;;;;;;;;;;;;;

	  ;查是否還能移動
	  ;;;;;;;;;;;;;;;;
	  mov eax,[row+0]
	  cmp eax,[row+16]
	  je AbleToMove
	  cmp eax,[row+4]
	  je AbleToMove
	  
	  
	  mov eax,[row+4]
	  cmp eax,[row+8]
	  je AbleToMove
	  cmp eax,[row+20]
	  je AbleToMove
	  
	  mov eax,[row+8]
	  cmp eax,[row+24]
	  je AbleToMove
	  cmp eax,[row+12]
	  je AbleToMove
	  
	  	  mov eax,[row+16]
	  cmp eax,[row+32]
	  je AbleToMove
	  cmp eax,[row+20]
	  je AbleToMove
	  
	  
	  
	  mov eax,[row+20]
	  cmp eax,[row+24]
	  je AbleToMove
	  cmp eax,[row+36]
	  je AbleToMove
	  
	  
	  mov eax,[row+24]
	  cmp eax,[row+40]
	  je AbleToMove
	  cmp eax,[row+28]
	  je AbleToMove
	  
	  
	  mov eax,[row+32]
	  cmp eax,[row+36]
	  je AbleToMove
	  cmp eax,[row+48]
	  je AbleToMove
	  
	  
	  
	  mov eax,[row+36]
	  cmp eax,[row+52]
	  je AbleToMove
	  cmp eax,[row+40]
	  je AbleToMove
	  
	  
	  mov eax,[row+40]
	  cmp eax,[row+44]
	  je AbleToMove
	  cmp eax,[row+56]
	  je AbleToMove
	  
	  
	  
	  mov eax,[row+12]
	  cmp eax,[row+28]
	  je AbleToMove
	  
	  mov eax,[row+28]
	  cmp eax,[row+44]
	  je AbleToMove
	 
	 mov eax,[row+44]
	 cmp eax,[row+60]
	 je AbleToMove
	
	 
	 mov eax,[row+48]
	 cmp eax,[row+52]
	 je AbleToMove
	 
	 mov eax,[row+52]
	 cmp eax,[row+56]
	 je AbleToMove
	  
	  mov eax,[row+60]
	  cmp eax,[row+56]
	  je AbleToMove
	
	  jmp notAbleToMove
	 AbleToMove:
	  mov is_not_full,2
	  

	
	  ;;;;;;;;;;;;;;;;  
	
	

	  notAbleToMove:

	  
;mov eax,is_not_full
;call Writeint
;call Writeint
;call Writeint
;call Writeint
;call Writeint
;call Writeint
	
	  pop ecx
	  ret 
	  CkFull endp
	  
	  
;--------------------------------------------------------------
; 在空白的地方隨機選擇一格
; 在選擇好的地方放置2
GetNew2XYPoint PROC
;
;--------------------------------------------------------------
push edx		
push eax

call CkFull

.IF is_not_full


rdpt: ;random point must 產生 in 0 exist place
mov eax,16
call RandomRange  
shl eax,2
		
.if [row+eax]
jmp rdpt
.ENDIF
		
mov [row+eax],2

.ENDIF





pop eax
pop edx
	 ret
GetNew2XYPoint ENDP

	  
;;--------------------------------------------------------------
;; 在選擇好的地方放置2////////////已被結合到GetNew2XYPoint內
;Put2 PROC
;;--------------------------------------------------------------
;push eax
;mov eax,next_2_point
;mov [row+eax],2
;
;
;pop eax
;	 ret
;Put2 ENDP
;



;--------------------------------------------------------------
; 重繪遊戲區
DrawMain PROC
;
;--------------------------------------------------------------
push edx
push eax

call UpdateScore


		
;       00:
      	mCursorMoveTo 5, 3
		mov eax,row
		call WriteDEC
		mov edx,OFFSET space
		call WriteString
 ;		01:

      	mCursorMoveTo 15, 3
		mov eax,[row+4]
		call WriteDEC
		mov edx,OFFSET space
		call WriteString
 
      	mov cursor_X, 25
      	mov cursor_Y, 3
      	mCursorMoveTo cursor_X, cursor_Y
		mov eax,[row+8]
		call WriteDEC
		mov edx,OFFSET space
		call WriteString
 
      	mov cursor_X, 35
      	mov cursor_Y, 3
      	mCursorMoveTo cursor_X, cursor_Y
		mov eax,[row+12]
		call WriteDEC
		mov edx,OFFSET space
		call WriteString

			
  
 
      	mov cursor_X, 5
      	mov cursor_Y, 9
      	mCursorMoveTo cursor_X, cursor_Y
		mov eax,[row+16]
		call WriteDEC
		mov edx,OFFSET space
		call WriteString
 
      	mov cursor_X, 15
      	mov cursor_Y, 9
      	mCursorMoveTo cursor_X, cursor_Y
mov eax,[row+20]
				call WriteDEC
		mov edx,OFFSET space
		call WriteString
 
      	mov cursor_X, 25
      	mov cursor_Y, 9
      	mCursorMoveTo cursor_X, cursor_Y
mov eax,[row+24]
				call WriteDEC
		mov edx,OFFSET space
		call WriteString
 
      	mov cursor_X, 35
      	mov cursor_Y, 9
      	mCursorMoveTo cursor_X, cursor_Y
		mov eax,[row+28]
		call WriteDEC
		mov edx,OFFSET space
		call WriteString

	




   
	
  
			
  
 
      	mov cursor_X, 5
      	mov cursor_Y, 15
      	mCursorMoveTo cursor_X, cursor_Y
		mov eax,[row+32]
		call WriteDEC
		mov edx,OFFSET space
		call WriteString
 
      	mov cursor_X, 15
      	mov cursor_Y, 15
      	mCursorMoveTo cursor_X, cursor_Y
		mov eax,[row+36]
		call WriteDEC
		mov edx,OFFSET space
		call WriteString
 
      	mov cursor_X, 25
      	mov cursor_Y, 15
      	mCursorMoveTo cursor_X, cursor_Y
mov eax,[row+40]
				call WriteDEC
		mov edx,OFFSET space
		call WriteString
 
      	mov cursor_X, 35
      	mov cursor_Y, 15
      	mCursorMoveTo cursor_X, cursor_Y
		mov eax,[row+44]
		call WriteDEC
		mov edx,OFFSET space
		call WriteString



       

		mov cursor_X, 5
      	mov cursor_Y, 21
      	mCursorMoveTo cursor_X, cursor_Y
		mov eax,[row+48]
		call WriteDEC
		mov edx,OFFSET space
		call WriteString
 
      	mov cursor_X, 15
      	mov cursor_Y, 21
      	mCursorMoveTo cursor_X, cursor_Y
mov eax,[row+52]
				call WriteDEC
		mov edx,OFFSET space
		call WriteString
 
      	mov cursor_X, 25
      	mov cursor_Y, 21
      	mCursorMoveTo cursor_X, cursor_Y
mov eax,[row+56]
				call WriteDEC
		mov edx,OFFSET space
		call WriteString
 
      	mov cursor_X, 35
      	mov cursor_Y, 21
      	mCursorMoveTo cursor_X, cursor_Y
		mov eax,[row+60]
		call WriteDEC
		mov edx,OFFSET space
		call WriteString
		
		
		
		
		
      	mov cursor_X, 45
      	mov cursor_Y, 21
		      	mCursorMoveTo cursor_X, cursor_Y

	 mov edx, OFFSET high_score_message
    call WriteString

    mov eax, high_score
    call WriteDEC
				mov edx,OFFSET space
	call WriteString
    call crlf


      	mov cursor_X, 45
      	mov cursor_Y, 22
      	mCursorMoveTo cursor_X, cursor_Y


   

	mov edx,OFFSET yoursocre
		call WriteString
		mov eax,score
		call WriteDEC
		mov edx,OFFSET yourstep
		call WriteString
		mov eax,step
		call WriteDEC
mov edx,offset space


call WriteString
call CkFull
		
		

		
	mov ecx,5
	mov  cursor_X, 1

		lp_tube_line:
mCursorMoveTo cursor_X, 15
mov edx, OFFSET tube_line
call WriteString
mCursorMoveTo cursor_X, 21
call WriteString
mCursorMoveTo cursor_X, 9
call WriteString
mCursorMoveTo cursor_X, 3
call WriteString
		
		add cursor_X,10
		loop lp_tube_line

		
mov cursor_X, 0
mov cursor_Y, 0
mov ecx,5
lp_horizontal_line:
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET horizontal_line
call WriteString
add cursor_Y,6
loop  lp_horizontal_line


mov cursor_Y, 1
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString

mov cursor_Y, 2
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString

mov cursor_Y, 4
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString

mov cursor_Y, 5
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString


mov cursor_Y, 7
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString

mov cursor_Y, 8
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString

mov cursor_Y, 10
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString

mov cursor_Y, 11
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString

mov cursor_Y, 13
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString


mov cursor_Y, 14
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString

mov cursor_Y, 16
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString

mov cursor_Y, 17
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString

mov cursor_Y, 19
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString


mov cursor_Y, 20
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString

mov cursor_Y, 22
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString
mov cursor_Y, 23
mCursorMoveTo cursor_X, cursor_Y
mov edx, OFFSET vertical_line
call WriteString





;;;;;;;;;;;
;show last operation

call ClearRightAbove
 mCursorMoveTo 47,1
 mov edx,OFFSET yourop
 call WriteString


;show last operation
;;;;;;;;;;;;;;;;;









.if score>2047; winwin 贏




.if last_op==1
mov edx,OFFSET w_0
call WriteString
.endif

.if last_op==2
mov edx,OFFSET a_0
call WriteString
.endif

.if last_op==3
mov edx,OFFSET s_0
call WriteString
.endif

.if last_op==4
mov edx,OFFSET d_0
call WriteString
.endif




 mCursorMoveTo 43,3
 mov edx,OFFSET win_1
 call WriteString 
 call crlf
 mCursorMoveTo 43,4
 mov edx,OFFSET win_11
 call WriteString 
 call crlf
 mCursorMoveTo 43,5
 mov edx,OFFSET win_111
 call WriteString 
 call crlf
 mCursorMoveTo 43,6
 mov edx,OFFSET win_1111
 call WriteString 
 call crlf
 mCursorMoveTo 43,7
 mov edx,OFFSET win_11111
 call WriteString 
 call crlf
 mCursorMoveTo 43,8
 mov edx,OFFSET win_11111
 call WriteString 
 call crlf
 mCursorMoveTo 43,9
 mov edx,OFFSET win_111111
 call WriteString 
 call crlf
 mCursorMoveTo 43,10
 mov edx,OFFSET win_1111111
 call WriteString 
 call crlf
 mCursorMoveTo 43,11
 mov edx,OFFSET win_11111111
 call WriteString 
 call crlf
 mCursorMoveTo 43,12
 mov edx,OFFSET win_111111111
 call WriteString 
 call crlf
 mCursorMoveTo 43,13
 mov edx,OFFSET win_1111111111
 call WriteString 
 call crlf
 mCursorMoveTo 43,14
 mov edx,OFFSET win_11111111111
 call WriteString 
 call crlf
 mCursorMoveTo 43,15
 mov edx,OFFSET win_111111111111
 call WriteString 
 call crlf
 mCursorMoveTo 43,16
 mov edx,OFFSET win_1111111111111
 call WriteString 
 call crlf
 mCursorMoveTo 43,17
 mov edx,OFFSET win_11111111111111
 call WriteString 
 call crlf
 mCursorMoveTo 43,18
 mov edx,OFFSET win_111111111111111
 call WriteString 
 call crlf
 

 mCursorMoveTo 43,19
 mov edx,OFFSET win_1111111111111111
 call WriteString 
 call crlf
.else

.if last_op==7
 mCursorMoveTo 46,5
mov edx, offset unkown_1 
call WriteString
 mCursorMoveTo 46,6
mov edx, offset unkown_11 
call WriteString
 mCursorMoveTo 46,7
mov edx, offset unkown_111 
call WriteString
 mCursorMoveTo 46,8
mov edx, offset unkown_1111 
call WriteString
 mCursorMoveTo 46,9
mov edx, offset unkown_11111 
call WriteString
 mCursorMoveTo 46,10
mov edx, offset unkown_111111 
call WriteString
 mCursorMoveTo 46,11
mov edx, offset unkown_1111111 
call WriteString
 mCursorMoveTo 46,12
mov edx, offset unkown_11111111 
call WriteString
 mCursorMoveTo 46,13
mov edx, offset unkown_111111111 
call WriteString
 mCursorMoveTo 46,14
mov edx, offset unkown_1111111111 
call WriteString
 mCursorMoveTo 46,15
mov edx, offset unkown_11111111111 
call WriteString
 mCursorMoveTo 46,16
mov edx, offset unkown_111111111111 
call WriteString
 mCursorMoveTo 46,17
mov edx, offset unkown_1111111111111
call WriteString
.endif

.if last_op==1 ;Up

 mCursorMoveTo 46,5
mov edx, offset w_1 
call WriteString
 mCursorMoveTo 46,6
mov edx, offset w_11 
call WriteString
 mCursorMoveTo 46,7
mov edx, offset w_111 
call WriteString
 mCursorMoveTo 46,8
mov edx, offset w_1111 
call WriteString
 mCursorMoveTo 46,9
mov edx, offset w_11111 
call WriteString
 mCursorMoveTo 46,10
mov edx, offset w_111111 
call WriteString
 mCursorMoveTo 46,11
mov edx, offset w_1111111 
call WriteString
 mCursorMoveTo 46,12
mov edx, offset w_11111111 
call WriteString
 mCursorMoveTo 46,13
mov edx, offset w_111111111 
call WriteString
 mCursorMoveTo 46,14
mov edx, offset w_1111111111 
call WriteString
 mCursorMoveTo 46,15
mov edx, offset w_11111111111 
call WriteString

.endif

.if last_op==3 ;down

 mCursorMoveTo 46,5
mov edx, offset s_1 
call WriteString
 mCursorMoveTo 46,6
mov edx, offset s_11 
call WriteString
 mCursorMoveTo 46,7
mov edx, offset s_111 
call WriteString
 mCursorMoveTo 46,8
mov edx, offset s_1111 
call WriteString
 mCursorMoveTo 46,9
mov edx, offset s_11111 
call WriteString
 mCursorMoveTo 46,10
mov edx, offset s_111111 
call WriteString
 mCursorMoveTo 46,11
mov edx, offset s_1111111 
call WriteString
 mCursorMoveTo 46,12
mov edx, offset s_11111111 
call WriteString
 mCursorMoveTo 46,13
mov edx, offset s_111111111 
call WriteString
 mCursorMoveTo 46,14
mov edx, offset s_1111111111 
call WriteString
 mCursorMoveTo 46,15
mov edx, offset s_11111111111 
call WriteString

.endif


.if last_op==2 ;left

 mCursorMoveTo 46,5
mov edx, offset a_1 
call WriteString
 mCursorMoveTo 46,6
mov edx, offset a_11 
call WriteString
 mCursorMoveTo 46,7
mov edx, offset a_111 
call WriteString
 mCursorMoveTo 46,8
mov edx, offset a_1111 
call WriteString
 mCursorMoveTo 46,9
mov edx, offset a_11111 
call WriteString
 mCursorMoveTo 46,10
mov edx, offset a_111111 
call WriteString
 mCursorMoveTo 46,11
mov edx, offset a_1111111 
call WriteString
 mCursorMoveTo 46,12
mov edx, offset a_11111111 
call WriteString
 mCursorMoveTo 46,13
mov edx, offset a_111111111 
call WriteString
 mCursorMoveTo 46,14
mov edx, offset a_1111111111 
call WriteString
 mCursorMoveTo 46,15
mov edx, offset a_11111111111 
call WriteString

.endif


.if last_op==4 ;right

 mCursorMoveTo 46,5
mov edx, offset d_1 
call WriteString
 mCursorMoveTo 46,6
mov edx, offset d_11 
call WriteString
 mCursorMoveTo 46,7
mov edx, offset d_111 
call WriteString
 mCursorMoveTo 46,8
mov edx, offset d_1111 
call WriteString
 mCursorMoveTo 46,9
mov edx, offset d_11111 
call WriteString
 mCursorMoveTo 46,10
mov edx, offset d_111111 
call WriteString
 mCursorMoveTo 46,11
mov edx, offset d_1111111 
call WriteString
 mCursorMoveTo 46,12
mov edx, offset d_11111111 
call WriteString
 mCursorMoveTo 46,13
mov edx, offset d_111111111 
call WriteString
 mCursorMoveTo 46,14
mov edx, offset d_1111111111 
call WriteString
 mCursorMoveTo 46,15
mov edx, offset d_11111111111 
call WriteString

.endif




.endif ;;;;;win

.if is_not_full == 0 ;;;;;遊戲結束
call ClearRightAbove
 mCursorMoveTo 43,5
 mov edx,OFFSET gg_1
 call WriteString 
 call crlf
  mCursorMoveTo 43,6
 mov edx,OFFSET gg_11
 call WriteString 
 call crlf
  mCursorMoveTo 43,7
mov edx,OFFSET gg_111
 call WriteString 
 call crlf
  mCursorMoveTo 43,8
mov edx,OFFSET gg_1111
 call WriteString 
 call crlf
  mCursorMoveTo 43,9
mov edx,OFFSET gg_11111
 call WriteString 
 call crlf
  mCursorMoveTo 43,10
mov edx,OFFSET gg_111111
 call WriteString
 call crlf
 
 
		mCursorMoveTo 43, 13
		mov edx, OFFSET restart_message
		call WriteString

			
		mCursorMoveTo 67, 13

		.ENDIF ;;;;;遊戲結束




;;;;
;.if score>2048
;mov edx,OFFSET win
;call WriteString
;mCursorMoveTo 2, 42
;mov edx, OFFSET restart_message
;call WriteString
;call UpdateHighScoreOnGameEnd
;.endif
		pop eax
		pop edx
ret
DrawMain ENDP









;;________________________________________________________
;;________________________________________________________
;;________________________________________________________
;;________________________________________________________
;;________________________________________________________
main proc
      
	
mov last_op,7
call Randomize
call GetNew2XYPoint ;產生新2放置座標
call DrawMain


      check_keyborad:	
	 
	  
      	mov ah, 0
      	INVOKE GetKeyState, VK_LEFT; ah == 1
          .IF ah			

call MoveLeft
	
      	.ENDIF
		
		mov ah, 0
		INVOKE GetKeyState, VK_ENTER; ah == 1
		.IF ah && is_not_full==0

			call ResetGame
		.ENDIF		
		
	
      	mov ah, 0
      	INVOKE GetKeyState, VK_RIGHT; ah == 1
          .IF ah			


call MoveRight
      	.ENDIF	
		

	
      	mov ah, 0
      	INVOKE GetKeyState, VK_DOWN; ah == 1
          .IF ah			


call MoveDown
      	.ENDIF	
		
		
      
      	mov ah, 0
      	INVOKE GetKeyState, VK_UP; ah == 1
          .IF ah				
		  
		  
		  call MoveUp

	
      	.ENDIF
		
		
		
			mov ah, 0
      	INVOKE GetKeyState, VK_W; ah == 1
        .IF ah						
call MoveUp
      	.ENDIF
		
		mov ah, 0
      	INVOKE GetKeyState, VK_A; ah == 1
        .IF ah			
call MoveLeft	
      	.ENDIF

		mov ah, 0
      	INVOKE GetKeyState, VK_D; ah == 1
        .IF ah			
call MoveRight
      	.ENDIF
		
		
		
		mov ah, 0
      	INVOKE GetKeyState, VK_S; ah == 1
          .IF ah			
		
		call MoveDown
      	.ENDIF
		
      jmp check_keyborad
      
	  
      	Invoke ExitProcess,0
      main endp
      end main
