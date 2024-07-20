import 'package:filmler_uygulamasi/Kategoriler.dart';
import 'package:filmler_uygulamasi/Yonetmenler.dart';

class Filmler{
  late int filmId;
  late String filmAd;
  late int filmYil;
  late String filmResim;
  late Kategoriler kategori;
  late Yonetmenler yonetmen;

  Filmler(this.filmId,this.filmAd,this.filmYil,this.filmResim,this.kategori,this.yonetmen);
}