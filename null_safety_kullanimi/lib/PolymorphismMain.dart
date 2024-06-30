import 'package:null_safety_kullanimi/%C4%B0sci.dart';
import 'package:null_safety_kullanimi/Mudur.dart';
import 'package:null_safety_kullanimi/Ogretmen.dart';

import 'Personel.dart';

void main(){

  var mudur = Mudur();

  Personel ogretmen = Ogretmen();

  Personel isci = Isci();

  mudur.iseAl(ogretmen);
  mudur.iseAl(isci);

}