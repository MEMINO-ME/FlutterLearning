import 'package:nesne_tabanli_programlama/Matematik.dart';

void main(){
  var m = Matematik();
  m.topla(10, 20);
  double c = m.cikar(300.0,50.0);
  print("Çıkarma: $c");

  m.carpma(20, 5, "Muhammed Emin");

  String veri = m.bol(100.0,2.0);
  print(veri);
}