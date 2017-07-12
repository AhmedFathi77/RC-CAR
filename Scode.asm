
_main:

;Scode.c,14 :: 		void main() {
;Scode.c,15 :: 		int distance = 0;
	CLRF       main_distance_L0+0
	CLRF       main_distance_L0+1
	CLRF       main_time_L0+0
	CLRF       main_time_L0+1
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
	MOVLW      1
	MOVWF      main_j_L0+0
	MOVLW      0
	MOVWF      main_j_L0+1
	CLRF       main_u_L0+0
	CLRF       main_u_L0+1
	CLRF       main_qq_L0+0
	CLRF       main_qq_L0+1
;Scode.c,26 :: 		trisa = 0b00000011;
	MOVLW      3
	MOVWF      TRISA+0
;Scode.c,27 :: 		porta=0;
	CLRF       PORTA+0
;Scode.c,28 :: 		T1CON = 0B00000001;  // COUNT EVERY 1 uS..
	MOVLW      1
	MOVWF      T1CON+0
;Scode.c,29 :: 		TMR1L = 0;   TMR1H = 0;
	CLRF       TMR1L+0
	CLRF       TMR1H+0
;Scode.c,30 :: 		TRISC=0B10111000;
	MOVLW      184
	MOVWF      TRISC+0
;Scode.c,31 :: 		portc=0;
	CLRF       PORTC+0
;Scode.c,32 :: 		trisd=0b11110000;
	MOVLW      240
	MOVWF      TRISD+0
;Scode.c,33 :: 		portd=0;
	CLRF       PORTD+0
;Scode.c,34 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Scode.c,35 :: 		delay_ms(300);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      134
	MOVWF      R12+0
	MOVLW      153
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
;Scode.c,36 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	NOP
	NOP
;Scode.c,37 :: 		lcd_init();
	CALL       _Lcd_Init+0
;Scode.c,38 :: 		lcd_cmd(_lcd_cursor_off);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Scode.c,39 :: 		while(j){
L_main2:
	MOVF       main_j_L0+0, 0
	IORWF      main_j_L0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;Scode.c,40 :: 		lcd_out(1,1,"Enter Password");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Scode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Scode.c,41 :: 		if(UART1_Data_Ready()==1)
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;Scode.c,43 :: 		R[u]=UART1_Read();
	MOVF       main_u_L0+0, 0
	ADDLW      main_R_L0+0
	MOVWF      FLOC__main+0
	CALL       _UART1_Read+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Scode.c,44 :: 		u++;
	INCF       main_u_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_u_L0+1, 1
;Scode.c,45 :: 		}
L_main4:
;Scode.c,46 :: 		if(u==1){lcd_out(2,1,"*");}
	MOVLW      0
	XORWF      main_u_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main64
	MOVLW      1
	XORWF      main_u_L0+0, 0
L__main64:
	BTFSS      STATUS+0, 2
	GOTO       L_main5
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Scode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main5:
;Scode.c,47 :: 		if(u==2){lcd_out(2,2,"*");}
	MOVLW      0
	XORWF      main_u_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main65
	MOVLW      2
	XORWF      main_u_L0+0, 0
L__main65:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Scode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main6:
;Scode.c,48 :: 		if(u==3){lcd_out(2,3,"*");}
	MOVLW      0
	XORWF      main_u_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main66
	MOVLW      3
	XORWF      main_u_L0+0, 0
L__main66:
	BTFSS      STATUS+0, 2
	GOTO       L_main7
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Scode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main7:
;Scode.c,49 :: 		if(u==4){
	MOVLW      0
	XORWF      main_u_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main67
	MOVLW      4
	XORWF      main_u_L0+0, 0
L__main67:
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;Scode.c,50 :: 		if(R[0]=='F'&&R[1]=='F'&&R[2]=='R'&&R[3]=='L'){
	MOVF       main_R_L0+0, 0
	XORLW      70
	BTFSS      STATUS+0, 2
	GOTO       L_main11
	MOVF       main_R_L0+1, 0
	XORLW      70
	BTFSS      STATUS+0, 2
	GOTO       L_main11
	MOVF       main_R_L0+2, 0
	XORLW      82
	BTFSS      STATUS+0, 2
	GOTO       L_main11
	MOVF       main_R_L0+3, 0
	XORLW      76
	BTFSS      STATUS+0, 2
	GOTO       L_main11
L__main62:
;Scode.c,51 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Scode.c,52 :: 		lcd_out(1,5,"RUN ENGINE");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_Scode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Scode.c,53 :: 		delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
;Scode.c,54 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Scode.c,55 :: 		i=1;
	MOVLW      1
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
;Scode.c,56 :: 		j=0;
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
;Scode.c,57 :: 		}
L_main11:
;Scode.c,58 :: 		if(i==0&&j==1){
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVLW      0
	XORWF      main_i_L0+0, 0
L__main68:
	BTFSS      STATUS+0, 2
	GOTO       L_main15
	MOVLW      0
	XORWF      main_j_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVLW      1
	XORWF      main_j_L0+0, 0
L__main69:
	BTFSS      STATUS+0, 2
	GOTO       L_main15
L__main61:
;Scode.c,59 :: 		lcd_out(2,1,"wrong");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_Scode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Scode.c,60 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	NOP
	NOP
;Scode.c,61 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Scode.c,62 :: 		u=0;
	CLRF       main_u_L0+0
	CLRF       main_u_L0+1
;Scode.c,63 :: 		}
L_main15:
;Scode.c,64 :: 		}
L_main8:
;Scode.c,65 :: 		}
	GOTO       L_main2
L_main3:
;Scode.c,66 :: 		while(i){
L_main17:
	MOVF       main_i_L0+0, 0
	IORWF      main_i_L0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main18
;Scode.c,67 :: 		if(UART1_Data_Ready()==1)
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main19
;Scode.c,69 :: 		H=UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_H_L0+0
;Scode.c,70 :: 		}
L_main19:
;Scode.c,72 :: 		if (H=='D'){
	MOVF       main_H_L0+0, 0
	XORLW      68
	BTFSS      STATUS+0, 2
	GOTO       L_main20
;Scode.c,73 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Scode.c,74 :: 		RC0_BIT = 1;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;Scode.c,75 :: 		DELAY_US(10);
	MOVLW      3
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
;Scode.c,76 :: 		RC0_BIT = 0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;Scode.c,78 :: 		TMR1L = 0;   TMR1H = 0; //RESET FOR THE TIMER (ALL values = 0 )...
	CLRF       TMR1L+0
	CLRF       TMR1H+0
;Scode.c,79 :: 		while( RC3_BIT == 0);
L_main22:
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_main23
	GOTO       L_main22
L_main23:
;Scode.c,81 :: 		TMR1ON_BIT = 1;   // timer one on!!!
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;Scode.c,82 :: 		while( RC3_BIT == 1);
L_main24:
	BTFSS      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_main25
	GOTO       L_main24
L_main25:
;Scode.c,83 :: 		TMR1ON_BIT =0;
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;Scode.c,84 :: 		TIME = TMR1H ;
	MOVF       TMR1H+0, 0
	MOVWF      main_time_L0+0
	CLRF       main_time_L0+1
;Scode.c,85 :: 		TIME = TIME << 8 ;
	MOVF       main_time_L0+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       R0+0, 0
	MOVWF      main_time_L0+0
	MOVF       R0+1, 0
	MOVWF      main_time_L0+1
;Scode.c,86 :: 		TIME = TIME | TMR1L ;
	MOVF       TMR1L+0, 0
	IORWF      R0+0, 1
	MOVLW      0
	IORWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      main_time_L0+0
	MOVF       R0+1, 0
	MOVWF      main_time_L0+1
;Scode.c,87 :: 		DISTANCE = 0.01655 * TIME ; // DISTANCE =   ([(331)* TIME * 10^-6 * 100] /2 )   IN CM
	CALL       _int2double+0
	MOVLW      222
	MOVWF      R4+0
	MOVLW      147
	MOVWF      R4+1
	MOVLW      7
	MOVWF      R4+2
	MOVLW      121
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      main_distance_L0+0
	MOVF       R0+1, 0
	MOVWF      main_distance_L0+1
;Scode.c,88 :: 		if(DISTANCE<0){
	MOVLW      128
	XORWF      R0+1, 0
	MOVWF      R2+0
	MOVLW      128
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main70
	MOVLW      0
	SUBWF      R0+0, 0
L__main70:
	BTFSC      STATUS+0, 0
	GOTO       L_main26
;Scode.c,89 :: 		DISTANCE=0;
	CLRF       main_distance_L0+0
	CLRF       main_distance_L0+1
;Scode.c,90 :: 		}
L_main26:
;Scode.c,91 :: 		inttostr(DISTANCE , Dis);
	MOVF       main_distance_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       main_distance_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      main_Dis_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Scode.c,92 :: 		lcd_out(2,1,Dis);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_Dis_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Scode.c,93 :: 		delay_ms(2000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
	NOP
	NOP
;Scode.c,94 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Scode.c,95 :: 		}
L_main20:
;Scode.c,97 :: 		y1=adc_read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
	MOVF       R0+0, 0
	MOVWF      main_y1_L0+0
	MOVF       R0+1, 0
	MOVWF      main_y1_L0+1
	MOVF       R0+2, 0
	MOVWF      main_y1_L0+2
	MOVF       R0+3, 0
	MOVWF      main_y1_L0+3
;Scode.c,98 :: 		if(y1>=300){
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      22
	MOVWF      R4+2
	MOVLW      135
	MOVWF      R4+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main28
;Scode.c,99 :: 		rc2_bit=1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;Scode.c,100 :: 		}
L_main28:
;Scode.c,101 :: 		if(y1<300){
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      22
	MOVWF      R4+2
	MOVLW      135
	MOVWF      R4+3
	MOVF       main_y1_L0+0, 0
	MOVWF      R0+0
	MOVF       main_y1_L0+1, 0
	MOVWF      R0+1
	MOVF       main_y1_L0+2, 0
	MOVWF      R0+2
	MOVF       main_y1_L0+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main29
;Scode.c,102 :: 		rc2_bit=0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;Scode.c,103 :: 		}
L_main29:
;Scode.c,106 :: 		y=adc_read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
;Scode.c,107 :: 		t=(y*0.488758);    //  (5/1024)*100
	CALL       _int2double+0
	MOVLW      125
	MOVWF      R4+0
	MOVLW      62
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
;Scode.c,108 :: 		inttostr(t,z);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      main_z_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Scode.c,109 :: 		lcd_out(1,1,"Temp=");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_Scode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Scode.c,110 :: 		lcd_out(1,6,z);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_z_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Scode.c,112 :: 		while(rd4_bit==0){
L_main30:
	BTFSC      RD4_bit+0, BitPos(RD4_bit+0)
	GOTO       L_main31
;Scode.c,113 :: 		lcd_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Scode.c,114 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main32:
	DECFSZ     R13+0, 1
	GOTO       L_main32
	DECFSZ     R12+0, 1
	GOTO       L_main32
	DECFSZ     R11+0, 1
	GOTO       L_main32
	NOP
	NOP
;Scode.c,115 :: 		lcd_out(1,1,"Warning");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_Scode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Scode.c,116 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main33:
	DECFSZ     R13+0, 1
	GOTO       L_main33
	DECFSZ     R12+0, 1
	GOTO       L_main33
	DECFSZ     R11+0, 1
	GOTO       L_main33
	NOP
	NOP
;Scode.c,117 :: 		}
	GOTO       L_main30
L_main31:
;Scode.c,119 :: 		if(rd5_bit==1){
	BTFSS      RD5_bit+0, BitPos(RD5_bit+0)
	GOTO       L_main34
;Scode.c,120 :: 		lcd_out(2,1,"Human Detected");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_Scode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Scode.c,121 :: 		}
L_main34:
;Scode.c,122 :: 		if(rd5_bit==0){
	BTFSC      RD5_bit+0, BitPos(RD5_bit+0)
	GOTO       L_main35
;Scode.c,123 :: 		lcd_out(2,1,"No Human Found");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_Scode+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Scode.c,124 :: 		}
L_main35:
;Scode.c,127 :: 		if(rd6_bit==0){
	BTFSC      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_main36
;Scode.c,128 :: 		rc1_bit=0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;Scode.c,129 :: 		}
L_main36:
;Scode.c,130 :: 		if(rd6_bit==1){
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_main37
;Scode.c,131 :: 		rc1_bit=1;
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
;Scode.c,132 :: 		}
L_main37:
;Scode.c,134 :: 		if(H=='S'){
	MOVF       main_H_L0+0, 0
	XORLW      83
	BTFSS      STATUS+0, 2
	GOTO       L_main38
;Scode.c,135 :: 		portd=0;
	CLRF       PORTD+0
;Scode.c,136 :: 		qq=0;
	CLRF       main_qq_L0+0
	CLRF       main_qq_L0+1
;Scode.c,137 :: 		}
L_main38:
;Scode.c,139 :: 		if(H=='F'){
	MOVF       main_H_L0+0, 0
	XORLW      70
	BTFSS      STATUS+0, 2
	GOTO       L_main39
;Scode.c,140 :: 		portd=0b00000101;
	MOVLW      5
	MOVWF      PORTD+0
;Scode.c,141 :: 		}
L_main39:
;Scode.c,142 :: 		if(H=='B'){
	MOVF       main_H_L0+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L_main40
;Scode.c,143 :: 		portd=0b00001010;
	MOVLW      10
	MOVWF      PORTD+0
;Scode.c,144 :: 		}
L_main40:
;Scode.c,146 :: 		if(H=='R'){
	MOVF       main_H_L0+0, 0
	XORLW      82
	BTFSS      STATUS+0, 2
	GOTO       L_main41
;Scode.c,147 :: 		portd=0b00001001;
	MOVLW      9
	MOVWF      PORTD+0
;Scode.c,148 :: 		}
L_main41:
;Scode.c,149 :: 		if(H=='L'){
	MOVF       main_H_L0+0, 0
	XORLW      76
	BTFSS      STATUS+0, 2
	GOTO       L_main42
;Scode.c,150 :: 		portd=0b00000110;
	MOVLW      6
	MOVWF      PORTD+0
;Scode.c,151 :: 		}
L_main42:
;Scode.c,153 :: 		if(H=='J'){
	MOVF       main_H_L0+0, 0
	XORLW      74
	BTFSS      STATUS+0, 2
	GOTO       L_main43
;Scode.c,154 :: 		qq=1;
	MOVLW      1
	MOVWF      main_qq_L0+0
	MOVLW      0
	MOVWF      main_qq_L0+1
;Scode.c,155 :: 		}
L_main43:
;Scode.c,156 :: 		if(qq==1){
	MOVLW      0
	XORWF      main_qq_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main71
	MOVLW      1
	XORWF      main_qq_L0+0, 0
L__main71:
	BTFSS      STATUS+0, 2
	GOTO       L_main44
;Scode.c,157 :: 		if(rc4_bit==0&&rc5_bit==0)
	BTFSC      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_main47
	BTFSC      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_main47
L__main60:
;Scode.c,159 :: 		portd=0b00000000;
	CLRF       PORTD+0
;Scode.c,160 :: 		}
L_main47:
;Scode.c,161 :: 		if(rc4_bit==1&&rc5_bit==0)
	BTFSS      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_main50
	BTFSC      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_main50
L__main59:
;Scode.c,163 :: 		portd=0b00000110;
	MOVLW      6
	MOVWF      PORTD+0
;Scode.c,164 :: 		}
L_main50:
;Scode.c,165 :: 		if(rc4_bit==0&&rc5_bit==1)
	BTFSC      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_main53
	BTFSS      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_main53
L__main58:
;Scode.c,167 :: 		portd=0b00001001;
	MOVLW      9
	MOVWF      PORTD+0
;Scode.c,168 :: 		}
L_main53:
;Scode.c,169 :: 		if(rc4_bit==1&&rc5_bit==1)
	BTFSS      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_main56
	BTFSS      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_main56
L__main57:
;Scode.c,171 :: 		portd=0b00000101;
	MOVLW      5
	MOVWF      PORTD+0
;Scode.c,172 :: 		}
L_main56:
;Scode.c,173 :: 		}
L_main44:
;Scode.c,178 :: 		}
	GOTO       L_main17
L_main18:
;Scode.c,179 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
