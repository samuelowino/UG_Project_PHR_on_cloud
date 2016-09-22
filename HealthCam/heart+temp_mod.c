#include<reg51.h>
#include<stdio.h>

sbit ds1620_dq = P3^0;				 

/*ds1620 data pin*/
sbit ds1620_clk = P3^1;				 

/*ds1620 clock pin*/
sbit ds1620_rst = P3^2;				 

/*ds1620 reset pin*/
sbit RS = P3^7;
sbit RW = P3^6;
sbit EN = P3^5;
sbit heart=P1^6;

#define read_temp 0xAA
#define start_conv 0xEE
#define write_config 0x0C
#define DATABUS P2

void heart_beat();
void int_conversion(int);
void lcd_init(char);
void lcd_write(char);
void serial_init(void);
void delay(int);
void send_char(char);

unsigned char m1[]="Heartbeat:";
int count=0;

/*Function to delay abount a second*/

unsigned char temp[]="Temperature:";

void wait_a_second()
{
unsigned int x;
for(x=0;x<33000;x++);
}

/*function to display data on Three til311 displays. 

negative temperature is displayed with a leading E 

character. Display range is-55to +125 */
int display_temperature(unsigned int x)
 
 {
// unsigned int s;
 int i=0;
 int r1,r2;
 lcd_init(0x38);	  // initialising
	lcd_init(0x01);		// clear
	lcd_init(0x0E);		  // blinking cursor
	lcd_init(0x80);		   // first line

 if (x>255)
 {
 x= ~x;				   /*complement temperature*/
 x++;				  /*add 1 or 2s comp*/
 x= x & 0xFF;			 /*extract lower */
 x= x/2;			/*get real temperature*/

/*first =14;
second = x/10;
third = x-10 *second;*/
}
else 
{
x = x/2;  //temp is positive
r1=x%10;
r2=x/10;
}		

//r1=r1+'0';
//r2=r2+'0';

	   
lcd_init(0x01);	 
send_char('\n');
while(temp[i])
{
lcd_write(temp[i]);
send_char(temp[i++]);
if(i==16)
{
lcd_init(0xC0);
}
}

/* lcd_write(r2);
 send_char(r2);

 lcd_write(r1);
 send_char(r1);

 lcd_write('C');
 send_char('C');

 send_char('\n');*/

 if((r2<=9)&&(r2>=0))
{
r2=r2+'0';
lcd_write(r2);
send_char(r2);
}

if((r1<=9)&&(r1>=0))
{
r1=r1+'0';
lcd_write(r1);
send_char(r1);
}
lcd_write('C');
send_char('C');
delay(15);
send_char('\n');

 	delay(350);	
	return x;
 }

/*this function sends a data bit to DS1620 

thermometer ic*/
void write_ds1620_bit(unsigned char b)
{
ds1620_dq=b;		  /*send bit*/
ds1620_clk=0;		    /*set clock 0*/
ds1620_clk=1;			 /*set clock 1*/
ds1620_dq=1;			 /*set data 1*/
}

/* this function reads a data bit from DS1620*/
unsigned char read_ds1620_bit()
{
unsigned char b;
ds1620_clk=0;			/*set clock 0 */
b=ds1620_dq;				//read a bit
ds1620_clk=1;			// setclock 1
return(b);
}

// this function writes data/configuration to DS1620
void write_to_ds1620(unsigned char 

ds1620_function,unsigned int ds1620_data,unsigned 

int bit_count)
{
  unsigned char i,this_bit;
  ds1620_rst=1;				//set reset to 1
  for(i=0;i<8;i++)			// send function....
  {
  this_bit=ds1620_function>>i;
  this_bit=this_bit & 0x01;
  write_ds1620_bit(this_bit);
  }

  for(i=0;i<bit_count;i++)	// send data
  {
  this_bit=ds1620_data >> i;
  this_bit=this_bit & 0x01;
  write_ds1620_bit(this_bit);
  }
   
  ds1620_rst=0;		// set reset to 0
}
   /* this function reads data/configuration from 

the DS1620 */
   unsigned int read_from_ds1620(unsigned char 

ds1620_function, unsigned char bit_count)
   {
   unsigned char i,this_bit;
   unsigned int ds1620_data;

   ds1620_data=0;			// initialize data
   ds1620_rst=1;			// set reset to 1

   for(i=0;i<8;i++)
   {							

 //send function...
     this_bit=ds1620_function >>i;
     this_bit=this_bit & 0x01;
     write_ds1620_bit(this_bit);
   }							

  // read data

	for(i=0;i<bit_count;i++)
	{
		ds1620_data=ds1620_data | 

read_ds1620_bit()<<i;
	}
	ds1620_rst=0;
	return(ds1620_data);
   }


	// this fn configures the DS1620 for continuous operation

	void configure_ds1620()
	{
		write_to_ds1620(write_config,2,8);
		wait_a_second();
	}

	// this function starts the conversion
  	void start_temp_conv()
	{
		write_to_ds1620(start_conv,0,0);
	}

	// this fn reads the temperature
  	unsigned int read_temperature()
	{
		unsigned int t;
		t=read_from_ds1620(read_temp,9);	

// read temp
		return(t);				

			// return temp
	}

	// start a main program
	main()
	{
unsigned int TEMP,x=0,a=0,x1=0,sub=0,i=0;
unsigned char m1[]="Welcome";

	lcd_init(0x38);	  // initialising
	lcd_init(0x01);		// clear
	lcd_init(0x0E);		  // blinking cursor
	lcd_init(0x80);		   // first line
	
	i=0;
	send_char('\n');
	while(m1[i])
	{
	//send_char(m1[i]);
	lcd_write(m1[i]);
	send_char(m1[i++]);
	}
	delay(15);
	send_char('\n');
	delay(15);
 		configure_ds1620();			// configure DS1620
		start_temp_conv();			// start conversion
 		
		for(;;)					 	// endless loop
		{
		heart_beat();
		  wait_a_second();			

// wait a second
	   	  TEMP=read_temperature();	// read temperature
		  x=display_temperature(TEMP); 	// OUTPUT to TIL311		  
		  wait_a_second();			
	  	}
	}

void lcd_init(char cmd)
{
DATABUS = cmd;
RS = 0;
RW = 0;
EN = 1;
delay(10);
EN = 0;
}

void lcd_write(char dat)
{
DATABUS = dat;
RS = 1;
RW = 0;
EN = 1;
delay(10);
EN = 0;
}


void serial_init(void)
{
   SCON = 0x50;                       
   TMOD = 0x22;              
   TH1   = 0xFD;     //9600         
   TR1   = 1;                
   TI   = 1;                
}


void heart_beat(void)
{
int i=0,x=0,a=0;
unsigned char l1[]="checking heartbeat...";
i=0;
lcd_init(0x01);
while(l1[i])
	{
	send_char(l1[i]);
	lcd_write(l1[i++]);
	if(i==16)
	{
	lcd_init(0xc0);
	}
	delay(15);
	}
	delay(15);

count=0;
for(i=0;i<30;i++)
{
x=0;
while(x!=(500))
{
TMOD=0x01;  //16-bit timer0 selected
TH0=0xF8;   // Loading high byte in TH
TL0=0xCC;   // Loaded low byte in TL
TR0=1;      // Running the timer
  //count=85;
while(!TF0)
{
//while(!heart);
if(heart==1)
{
a=1;
}
if(a==1)
{
a=0;
count++;
//int_conversion(count);
delay(15);
}
} 
TR0 = 0;      // If TF0=1 stop the timer
TF0 = 0;      // Clear the Timer Flag bit for next calculation
x++;
}
}
//count=77;
count=count/2;
//count=count/32;
int_conversion(count);
delay(20);
}

void int_conversion(int x)
{
int r1=0,r2=0,r3=0,i=0,q1=0,q2=0,q3=0;
lcd_init(0x01);		// clear

r1=x%10;
q1=x/10;
r2=q1%10;
q2=q1/10;
r3=q2%10;
//lcd_init(0x01);

while(m1[i])
{
lcd_write(m1[i++]);
}

if((r3<=9)&&(r3>0))
{
r3=r3+'0';
lcd_write(r3);
send_char(r3);
}

if((r2<=9)&&(r2>=0))
{
r2=r2+'0';
lcd_write(r2);
send_char(r2);
}

if((r1<=9)&&(r1>=0))
{
r1=r1+'0';
lcd_write(r1);
send_char(r1);
delay(15);
send_char('\n');
}
}

void delay(int k)
{
int l=0;
//k++;
while(k--)
{
for(l=0;l<500;l++);
}
}

void send_char(char c)
{
     int i=0;
	 serial_init();
     
TI=1;
SBUF=c;
TI=0;
}