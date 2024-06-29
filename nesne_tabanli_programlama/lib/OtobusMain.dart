import 'package:nesne_tabanli_programlama/Otobus.dart';

void main(){

  //Değer atama
  var kamilKoc = Otobus();
  kamilKoc.kapasite = 50;
  kamilKoc.nereden = "Bursa";
  kamilKoc.nereye = "Ankara";
  kamilKoc.mevcutYolcu = 10;

  //Değer okuma
  int gelenKapasite = kamilKoc.kapasite;

  print(gelenKapasite);
  print(kamilKoc.nereden);
  print(kamilKoc.nereye);
  print(kamilKoc.mevcutYolcu);

  kamilKoc.bilgiAl();

  kamilKoc.yolcuAl(5);
  kamilKoc.bilgiAl();

  kamilKoc.yolcuIndir(3);
  kamilKoc.bilgiAl();

  var otobusFirmasi = Otobus();
  otobusFirmasi.kapasite = 10;
  otobusFirmasi.nereden="Bursa";
  otobusFirmasi.nereye = "Balıkesir";
  otobusFirmasi.mevcutYolcu = 2;
  otobusFirmasi.bilgiAl();

}