#include <pic14/pic12f675.h>
 

typedef unsigned int word;
word __at 0x2007 __CONFIG = (_BODEN_OFF & _WDT_OFF & _MCLRE_OFF);
void delay (unsigned int tiempo);


void main(void)
{
	TRISIO = 0x08; //GPIO3 = 1
	GPIO = 0x00; //TODOS EN BAJO AL INICIO
	unsigned int time = 100;
	unsigned int counter = 0;
	unsigned int random;


	//VARIABLES PARA METODO XORSHIFT
	unsigned char x, y, z, a;

	x=0;
	y=0;
	z=0;
	a=1;

	delay(time);

	//LOOP INFINITO
	while (1)
	{	
		GPIO5 = 0; //SE DESABILITA PORQUE EL BCD AUN NO RECIBE ENTRADAS
		
		if (GPIO3 == 1){
			GPIO5 = 1; //SE HABILITA PARA QUE EL BCD RECIBA ENTRADAS

			//METODO XORSHIFT
			for(unsigned long i=0;i<counter;i++)
			{
				unsigned char t = x ^ (x << 4);
				x=y;
				y=z;
				z=a;
				a = z ^ t ^ ( z >> 1) ^ (t << 1);
			}

			//DIVISION ENTERA PARA OBTENER EL DIGITO
			random = a % 10;

			//ENTRADAS A BCD	
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
	
}

void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned j;
	for (i=0; i < tiempo; i++)
		for (j = 0; i < 1275; j++);
	
}