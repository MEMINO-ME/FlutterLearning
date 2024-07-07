import 'dart:io';

void main(){

  print("Mesaj giriniz");
  String kelime = stdin.readLineSync()!;
  //ahmet a-0,h-1,m-2,e-3,t-4
  print(kelime[1]);

  String tersKelime = "";

  for(int i=kelime.length-1;i>-1;i--){
    print(kelime[i]);
  }

  for(int i=kelime.length-1;i>-1;i--){
    tersKelime = tersKelime + kelime[i];
  }
  print(tersKelime);

}