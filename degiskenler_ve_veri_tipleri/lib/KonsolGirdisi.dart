import 'dart:io';

void main(){

  print("Adınızı giriniz");

  String isim = stdin.readLineSync()!;

  print("Adınız: $isim");

  print("Birinci sayıyı giriniz");
  int sayi1 = int.parse(stdin.readLineSync()!);

  print("İkinci sayıyı giriniz");
  int sayi2 = int.parse(stdin.readLineSync()!);

  print("Toplam: ${sayi1+sayi2}");

}