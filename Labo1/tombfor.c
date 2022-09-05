#include <pic14/pic12f675.h>

typedef unsigned int word;
word __at 0x2007 __CONFIG = (_BODEN_OFF &_WDT_OFF & _MCLRE_OFF);
void delay (unsigned int tiempo);

void main(void){


    TRISIO = 0b00001000; //GPIO3 como entrada
	GPIO = 0b00000000; //todos los GPIOS comienzan en bajo

	//definicion de variables
    unsigned int time = 10;
	unsigned int random1;
	unsigned int random2;
	unsigned int counter1;
	unsigned int counter2 = 7;
	unsigned int bolas;
	unsigned int value1;
	unsigned int value2;


	//ciclo infinito
    while (1)
    {
		random1 = counter1 % 10;
		random2 = counter2 % 10;

		
		if (GPIO3 == 1){
			bolas++

			for (unsigned int on = 0; on < 50; on++)
			{
			

				if (bolas == 16)
				{
					GPIO = 0b00011001;
					delay(time);
					GPIO = 0b00000000;
					delay(time);
				}

				GP5 = 1;

				for (unsigned int num1 = 0; num1 < 10; num1++)
            	{	
					if(random1 == num1)
            	    {
					value1 = num1 + 8;
					GPIO = value1;
					delay(time);
            	    }
            	}

				GP5 = 0;
			
				for (unsigned int num2 = 0; num2 < 10; num2++)
            	{	
					if(random2 == num2)
            	    {
					value2 = num2 + 40;
					GPIO = value2;
					delay(time);
            	    }
            	}
			}
	
		}

		counter1 ++;
		counter2++;

	}

}


void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}