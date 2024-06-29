import 'package:null_safety_kullanimi/Filmler.dart';
import 'package:null_safety_kullanimi/Kategoriler.dart';
import 'package:null_safety_kullanimi/Yonetmenler.dart';

void main(){

  var k1 = Kategoriler(1, "Dram");
  var k2 = Kategoriler(2, "Komedi");

  var y1 = Yonetmenler(1,"Nuri Bilge Ceylan");
  var y2 = Yonetmenler(2, "Quentin Tarantino");

  var f1 = Filmler(1, "Django", 2013, k1, y2);

  print("Film Id: ${f1.filmId}");
  print("Film ad: ${f1.filmAd}");
  print("Film yıl: ${f1.filmYil}");
  print("Film kategori: ${f1.kategori.kategoriAd}");
  print("Film yönetmeni: ${f1.yonetmen.yonetmenAd}");

}