import 'dart:io';

import 'package:collections_structures/Adres.dart';
import 'package:collections_structures/Personel.dart';

void main(){

  var personeller = <Personel>[];

  for(int i=1;i<4;i++){
    print("$i. personelin adını girinz.");
    String isim = stdin.readLineSync()!;
    print("$i. personelin ilini giriniz.");
    String il = stdin.readLineSync()!;
    print("$i. personelin ilçesini giriniz.");
    String ilce = stdin.readLineSync()!;

    var adres = Adres(il, ilce);
    var personel = Personel(i, isim, adres);

    personeller.add(personel);
  }

  for(var p in personeller){
    print("**********");
    print("Personel no: ${p.no}");
    print("Personel adı: ${p.isim}");
    print("Personel adres il: ${p.adres.il}");
    print("Personel adres ilçe: ${p.adres.ilce}");
  }

}