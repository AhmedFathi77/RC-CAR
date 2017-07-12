#line 1 "C:/Users/leenovoz510/Desktop/Folders/Codes1/PIC/Scode.c"
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;
void main() {
int distance = 0;
 int time = 0;

int y,v,t,c,d,s=0,i=0,j=1,u=0,lol=0,qq=0,msafa=0;
float y1;
char H;
char R[4];
char z[7];
char e[7];
char Dis[7];
char password[4];
trisa = 0b00000011;
porta=0;
T1CON = 0B00000001;
TMR1L = 0; TMR1H = 0;
TRISC=0B10111000;
portc=0;
trisd=0b11110000;
portd=0;
UART1_Init(9600);
delay_ms(300);
delay_ms(100);
lcd_init();
lcd_cmd(_lcd_cursor_off);
while(j){
lcd_out(1,1,"Enter Password");
if(UART1_Data_Ready()==1)
{
R[u]=UART1_Read();
u++;
}
if(u==1){lcd_out(2,1,"*");}
if(u==2){lcd_out(2,2,"*");}
if(u==3){lcd_out(2,3,"*");}
if(u==4){
if(R[0]=='F'&&R[1]=='F'&&R[2]=='R'&&R[3]=='L'){
lcd_cmd(_lcd_clear);
lcd_out(1,5,"RUN ENGINE");
delay_ms(400);
lcd_cmd(_lcd_clear);
i=1;
j=0;
}
if(i==0&&j==1){
lcd_out(2,1,"wrong");
delay_ms(100);
lcd_cmd(_lcd_clear);
u=0;
}
}
}
while(i){
if(UART1_Data_Ready()==1)
{
H=UART1_Read();
}

if (H=='D'){
 lcd_cmd(_lcd_clear);
 RC0_BIT = 1;
 DELAY_US(10);
 RC0_BIT = 0;

 TMR1L = 0; TMR1H = 0;
 while( RC3_BIT == 0);

 TMR1ON_BIT = 1;
 while( RC3_BIT == 1);
 TMR1ON_BIT =0;
 TIME = TMR1H ;
 TIME = TIME << 8 ;
 TIME = TIME | TMR1L ;
 DISTANCE = 0.01655 * TIME ;
 if(DISTANCE<0){
 DISTANCE=0;
 }
 inttostr(DISTANCE , Dis);
 lcd_out(2,1,Dis);
 delay_ms(2000);
 lcd_cmd(_lcd_clear);
 }

 y1=adc_read(1);
 if(y1>=300){
 rc2_bit=1;
 }
 if(y1<300){
 rc2_bit=0;
 }


 y=adc_read(0);
 t=(y*0.488758);
 inttostr(t,z);
 lcd_out(1,1,"Temp=");
 lcd_out(1,6,z);

 while(rd4_bit==0){
 lcd_cmd(_lcd_clear);
 delay_ms(500);
 lcd_out(1,1,"Warning");
 delay_ms(500);
 }

 if(rd5_bit==1){
 lcd_out(2,1,"Human Detected");
 }
 if(rd5_bit==0){
 lcd_out(2,1,"No Human Found");
 }


 if(rd6_bit==0){
 rc1_bit=0;
 }
 if(rd6_bit==1){
 rc1_bit=1;
 }

 if(H=='S'){
 portd=0;
 qq=0;
 }

if(H=='F'){
 portd=0b00000101;
 }
 if(H=='B'){
 portd=0b00001010;
 }

 if(H=='R'){
 portd=0b00001001;
 }
 if(H=='L'){
 portd=0b00000110;
 }

 if(H=='J'){
 qq=1;
 }
 if(qq==1){
 if(rc4_bit==0&&rc5_bit==0)
 {
 portd=0b00000000;
 }
 if(rc4_bit==1&&rc5_bit==0)
 {
 portd=0b00000110;
 }
 if(rc4_bit==0&&rc5_bit==1)
 {
 portd=0b00001001;
 }
 if(rc4_bit==1&&rc5_bit==1)
 {
 portd=0b00000101;
 }
 }




}
}
