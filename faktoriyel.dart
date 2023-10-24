int faktoriyel(int n) 
{
  if (n == 0) 
    return 1;
  else if (n > 0) 
    return n * faktoriyel(n - 1);
  else 
    return 0;
}

void main() {
  var num = 5;
  var result = faktoriyel(num);
  print(result);
}
