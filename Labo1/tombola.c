#include <pic14/pic12f675.h>

typedef unsigned int word;
word __at 0x2007 __CONFIG = (_BODEN_OFF &_WDT_OFF & _MCLRE_OFF);
void delay (unsigned int tiempo);

void main(void){


    TRISIO = 0b00101000; //GPIO3 y GPIO5 como entradas
	GPIO = 0b00000000; //todos los GPIOS comienzan en bajo

	//definicion de variables
    unsigned int time = 10;
	unsigned int random;
	unsigned int counter;
	unsigned int bolas;

	//ciclo infinito
    while (1){

		counter ++;
		random = counter % 10;


		if (GPIO3 == 1){

			bolas++;

			for (unsigned int num = 0; num < 10; num++){
				
				if(random == num){
				GPIO = num;
				delay(time);}

			}
		}


		if (bolas == 16)
		{
			GPIO = 9;
		}
	

	}	
}

void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}
