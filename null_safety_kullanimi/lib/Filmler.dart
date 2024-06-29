import 'package:null_safety_kullanimi/Kategoriler.dart';
import 'package:null_safety_kullanimi/Yonetmenler.dart';

class Filmler{
  late int filmId;
  late String filmAd;
  late int filmYil;
  late Kategoriler kategori;
  late Yonetmenler yonetmen;

  Filmler(this.filmId,this.filmAd,this.filmYil,this.kategori,this.yonetmen);
}