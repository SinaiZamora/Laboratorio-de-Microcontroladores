#include <pic14/pic12f675.h>
 

typedef unsigned int word;
word __at 0x2007 __CONFIG = (_WDTE_OFF & _WDT_OFF & _MCLRE_OFF);
void delay (unsigned int tiempo);
void main(void)
{
	TRISIO = 0b00001000;
	GPIO = 0x00;
	unsigned int time = 100;
	unsigned int counter = 0;
	unsigned int random;
	while (1)
	{	
		GPIO5 = 0;
		if (counter <= 9){
			if (GPIO3 == 1){
				GPIO5 = 1;
				random = counter;
				
				switch (random)
				{
					case 0:
					GPIO0 = 0; 
					GPIO1 = 0;
					GPIO2 = 0;
					GPIO4 = 0;
					delay(time);
					break;
					case 1:
					GPIO0 = 0;
					GPIO1 = 0;
					GPIO2 = 0;
					GPIO4 = 1;
					delay(time);
					break;
					case 2:
					GPIO0 = 0;
					GPIO1 = 0;
					GPIO2 = 1;
					GPIO4 = 0;
					delay(time);
					break;
					case 3:
					GPIO0 = 0;
					GPIO1 = 0;
					GPIO2 = 1;
					GPIO4 = 1;
					delay(time);
					break;
					case 4:
					GPIO0 = 0;
					GPIO1 = 1;
					GPIO2 = 0;
					GPIO4 = 0;
					delay(time);
					break;
					case 5:
					GPIO0 = 0;
					GPIO1 = 1;
					GPIO2 = 0;
					GPIO4 = 1;
					delay(time);
					break;
					case 6:
					GPIO0 = 0;
					GPIO1 = 1;
					GPIO2 = 1;
					GPIO4 = 0;
					delay(time);
					break;
					case 7:
					GPIO0 = 0;
					GPIO1 = 1;
					GPIO2 = 1;
					GPIO4 = 1;
					delay(time);
					break;
					case 8:
					GPIO0 = 1;
					GPIO1 = 0;
					GPIO2 = 0;
					GPIO4 = 0;
					delay(time);
					break;
					case 9:
					GPIO0 = 1;
					GPIO1 = 0;
					GPIO2 = 0;
					GPIO4 = 1;
					delay(time);
					break;
				}
				
				
				}
			counter += 1;
		
		}
		else if (counter > 9){
			counter = 0;
		}
		
	}
	
}

void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned j;
	for (i=0; i < tiempo; i++)
		for (j = 0; i < 1275; j++);
	
}