import 'dart:io';

void main(){
  print("Toplama işlemi (1)");
  print("Çıkarma işlemi (2)");
  print("Çarpma işlemi (3)");
  print("Bölme işlemi (4)");

  print("Yapmak istediğiniz işlemi seçin");
  int secim = int.parse(stdin.readLineSync()!);
  print("Seçiminiz: $secim");

  print("Birinci sayıyı giriniz");
  int sayi1 = int.parse(stdin.readLineSync()!);
  print("İkinci sayıyı giriniz.");
  int sayi2 = int.parse(stdin.readLineSync()!);

  switch(secim){
    case 1 : {
      print("Toplama: ${sayi1+sayi2}");
    }
    break;

    case 2 : {
      print("Çıkarma: ${sayi1-sayi2}");
    }
    break;

    case 3 : {
      print("Çarpma: ${sayi1*sayi2}");
    }
    break;

    case 4 : {
      print("Bölme: ${sayi1/sayi2}");
    }

    default : {
      print("Böyle bir işlem yok.");
    }
    break;
  }

}