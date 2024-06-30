import 'dart:io';

import 'package:collections_structures/Ogrenciler.dart';

void main(){

  int sayac = 1;

  var ogrenciler = <Ogrenciler>[];

  while(true){

    print("Öğrenci adı giriniz");
    String ad = stdin.readLineSync()!;
    print("Öğrenci sınıfını giriniz");
    String sinif = stdin.readLineSync()!;
    
    var yeniOgrenci = Ogrenciler(sayac, ad, sinif);
    sayac = sayac + 1;

    ogrenciler.add(yeniOgrenci);

    print("Çıkmak için (1) - Devam etmek için diğer sayılar");

    int cikis = int.parse(stdin.readLineSync()!);

    if(cikis == 1){
      print("Çıkış yapıldı.");
      break;
    }
  }

  for(var o in ogrenciler){
    print("********");
    print("Öğrenci no: ${o.no}");
    print("Öğrenci adı: ${o.ad}");
    print("Öğrenci sınıfı: ${o.sinif}");
  }

}