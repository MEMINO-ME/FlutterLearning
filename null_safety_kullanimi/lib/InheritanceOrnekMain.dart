import 'package:null_safety_kullanimi/Saray.dart';
import 'package:null_safety_kullanimi/Villa.dart';

void main(){
  var topkapiSarayi = Saray(10, 100);
  print(topkapiSarayi.pencereSayisi);
  print(topkapiSarayi.kuleSayisi);

  var villa = Villa(true, 20);
  print(villa.garajVarmi);
  print(villa.pencereSayisi);
}