import 'package:null_safety_kullanimi/Arac.dart';

class Araba extends Arac{
  late String kasaTipi;

  Araba(this.kasaTipi,String renk, String vites) : super(renk,vites);
}