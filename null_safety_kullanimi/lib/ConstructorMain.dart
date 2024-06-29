import 'package:null_safety_kullanimi/Ogrenciler.dart';

void main() {
  var ogrenci = Ogrenciler(no:100,ad:"Ahmet");
  //ogrenci.no = 100;
  //ogrenci.ad = "Ahmet";

  print(ogrenci.ad);
  print(ogrenci.no);
}