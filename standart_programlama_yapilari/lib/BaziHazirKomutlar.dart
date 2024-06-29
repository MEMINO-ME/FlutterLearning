import 'dart:math';

void main(){

  int min = 5;
  int max = 10;

  var r = Random();

  int rastgeleSayi = min + r.nextInt((max-min)-1); // 5 ile 10 arasında

  print(rastgeleSayi);

  double x = 6.5;
  int c = x.ceil();
  print("C: $c");

  int f = x.floor();
  print("F: $f");

  double s = sqrt(x);
  print("S: $s");

  int y = -10;

  int a = y.abs();
  print("A: $a");

  num p = pow(2, 3);
  print("P: $p");

}