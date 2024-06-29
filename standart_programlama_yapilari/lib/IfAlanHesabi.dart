import 'dart:io';

void main(){
  print("Dikdörtgen alanı (1)");
  print("Çember Alanı (2)");

  int secim = int.parse(stdin.readLineSync()!);
  print("Seçiminiz: $secim");

  if(secim == 1){
    print("Kısa kenar giriniz.");
    int kisaKenar = int.parse(stdin.readLineSync()!);

    print ("Uzun kenar giriniz");
    int uzunKenar = int.parse(stdin.readLineSync()!);

    int dikdortgenAlani = kisaKenar * uzunKenar;
    print("Dikdörtgen alanı: $dikdortgenAlani");

  }else if(secim == 2){
    print("Yarı çap giriniz.");
    int yariCap = int.parse(stdin.readLineSync()!);

    double cemberAlani = 3.14 * yariCap;
    print("Çember alanı: $cemberAlani");
  }

}