#include<stdio.h>
#include<conio.h>
int main()
{
int ch,a;
do
{
printf("Enter the size of cursor");
scanf("%d",&a);
printf("\n1.Increase \n2.Decrease \n3.Disable \n4.Exit");
printf("\nExit");
scanf("%d",&ch);
switch(ch)
{
  case 1:
  asm mov cx,a;
  asm mov ah,01h;
  asm inc cl;
  asm int 10h;
  break;
  case 2:
  asm mov cx,a;
  asm mov ah,01h;
  asm dec cl;
  asm int 10h;
  break;
  case 3:
  asm mov cl,20h;
  asm mov ah,01h;
  asm int 10h;
  break;


}
}while(ch!=4)
}