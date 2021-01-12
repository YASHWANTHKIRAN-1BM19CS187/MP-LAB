#include<stdio.h>
#include<reg51.h>

char xdata CommW _at_ 0xe803;
char xdata portB _at_ 0xe801;
char xdata portC _at_ 0xe802;
char port[20] = {0x8e,0xf9,0xde,0x86,0xff,0xff,0xff,0xff,0x89,0x86,0xc7,0x8c},i;
delay()
{
long u;
for(u=0;u<8000;u++);

}
void main()
{
int d,b,j,m;
unsigned char k;
CommW = 0x80;
do
{
i=0;
for(d=0;d<3;d++)
{
for(b=0;b<4;b++)
{
k = port[i++];
for(j=0;j<8;j++)
{
m=k;
k=k&0x80;
{
if(k==00)
portB = 0x00;
else
portB = 0x01;
}
portC = 0x01;
portC = 0x00;
k=m;
k<<=1;
}
}
delay();
}
}
while(1);
}