import 'dart:io';

void main(){
  var isimler = <String>[];
  isimler.add("Ahmet");
  isimler.add("Mehmet");
  isimler.add("Zeynep");
  isimler.add("Onur");
  isimler.add("Burçak");

  print("Aratmak iin isim giriniz.");

  String isim = stdin.readLineSync()!;

  for(var i in isimler){
    if(i == isim){
      print("İsim mevcut.");
      break;
    }
  }
}