bool isPrime(int n) 
{
  var i = 2;
  while (i < n) 
  {
    if (n % i == 0)
      return false;
    i++;
  }
  return true;
}

void allPrime(int n) 
{
  var i = 2;
  while (i <= n) {
    if (isPrime(i)) 
    {
      print(i);
    }
    i++;
  }
}

void main() {
  var n = 5;
  allPrime(n);
}