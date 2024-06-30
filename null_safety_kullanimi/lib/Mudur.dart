import 'package:null_safety_kullanimi/%C4%B0sci.dart';
import 'package:null_safety_kullanimi/Ogretmen.dart';
import 'package:null_safety_kullanimi/Personel.dart';

class Mudur extends Personel{
  void iseAl(Personel p){
    p.iseAlindi();
  }

  void terfiEttir(Personel p){
    if(p is Ogretmen){
      p.maasArttir();
    }
    if(p is Isci){
      print("İşçiler terfi alamaz.");
    }
  }
}