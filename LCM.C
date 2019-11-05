#include<stdio.h>

int main()
{
int a,b,lcm,gcd,ca,cb;
clrscr();
printf("Enter the first number");
scanf("%d",&a);
ca=a;
printf("\nEnter the second number");
scanf("%d",&b);
cb=b;
asm mov ax,a;
asm mov bx,b;
while(b!=0)
{
asm mov ah,00h;
asm mov cl,bl;

asm div bl;
asm mov bl,ah;

asm mov al,cl;
asm mov b,bx;

}

asm mov gcd,ax;
printf("\nGCD=%d",gcd);
lcm=(ca*cb)/gcd;
printf("\nLCM=%d",lcm);
getch();
return 0;
}