import 'package:null_safety_kullanimi/Eatables.dart';
import 'package:null_safety_kullanimi/Squeezables.dart';

class Elma implements Squeezables,Eatables{
  @override
  void howToEat() {
    print("Dilimleyip yiyebilirsin");
  }

  @override
  void howToSqueeze() {
    print("Blender ile sık");
  }

}