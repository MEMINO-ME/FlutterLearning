import 'package:null_safety_kullanimi/Adres.dart';
import 'package:null_safety_kullanimi/Musteriler.dart';

void main(){

  var adres = Adres("ANkara", "Keçiören");
  var musteri = Musteriler("Muhammed Emin", 23, adres);

  print("Müşteri adı: ${musteri.ad}");
  print("Müşteri yaş: ${musteri.yas}");
  print("Müşteri il: ${musteri.adres.il}");
  print("Müşteri ilçe: ${musteri.adres.ilce}");

}