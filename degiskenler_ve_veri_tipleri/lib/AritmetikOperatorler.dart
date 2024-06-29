void main(){
  //Daire Alanı
  final pi = 3.14;
  var yariCap = 2.0;
  var alan = pi * yariCap;
  print("Daire Alanı: $alan");

  //F = m * a
  double m = 12.5;
  var a = 10.0;
  var f = m * a;
  print("F: $f");

  //Ax
  double v = 12.7;
  double v0 = 23.56;
  double t = 3.5;

  double x1 = ((v+v0)/2)*t;
  print("X1: $x1");

  double x2 = (v0*t)+((a*t*t)/2);
  print("X2: $x2");

  //Kısaltma
  int y = 10;
  y = y + 2;
  y+=2; //Her aritmetik işlem için yapılabilir çarpma bölme gibi
  print(y);

}