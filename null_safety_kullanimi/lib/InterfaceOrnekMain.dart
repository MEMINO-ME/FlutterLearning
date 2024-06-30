import 'package:null_safety_kullanimi/AmasyaElmas%C4%B1.dart';
import 'package:null_safety_kullanimi/Aslan.dart';
import 'package:null_safety_kullanimi/Eatables.dart';
import 'package:null_safety_kullanimi/Elma.dart';
import 'package:null_safety_kullanimi/Tavuk.dart';

void main(){
  var aslan = Aslan();

  Eatables tavuk = Tavuk();
  tavuk.howToEat();

  var elma = Elma();
  elma.howToEat();
  elma.howToSqueeze();

  Elma amasyaElmasi = AmasyaElmasi();
  amasyaElmasi.howToEat();
  amasyaElmasi.howToSqueeze();
}