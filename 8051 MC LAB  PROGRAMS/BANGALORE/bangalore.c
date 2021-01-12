#include<stdio.h>
#include<reg51.h>
char xdata CommW _at_ 0xe803;
char xdata portB _at_ 0xe801;
char xdata portC _at_ 0xe802;
char port[20] = { 0xff, 0xff, 0xff, 0xff ,0x83,0x88,0xC8,0x82,
0x88,0xC7,0xC0,0xAF,0x86},i;
delay()
{
long u;
for(u=0;u<4000;u++);
}
void main()
{
int d,b,j,m;
unsigned char k;
CommW = 0x80;
do
{
i=0;
for(d=0;d<1;d++)
{
for(b=13;b>0;b--)
{
delay();
k = port[i++];
for(j=0;j<8;j++)
{
m=k;
k=k&0x80;
{
if(k==00)
portB=0x00;
else

portB=0x01;
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