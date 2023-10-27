import"dart:math";
void isArmstrong(int number)
{
  int n=number;
  int sum=0;
  int digit=0;
  int len=n.toString().length;

  while(n!=0)
  {
    digit=n%10;
    sum+=pow(digit, len).toInt();
    n ~/= 10;
  }
  if(sum==number)
    print("This is ARMSTRONG number");
  else
    print("This is not ARMSTRONG number");
}
void main() 
{
  isArmstrong(407); 
  isArmstrong(1634);
  isArmstrong(15);
  isArmstrong(47);
}