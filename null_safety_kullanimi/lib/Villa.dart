import 'package:null_safety_kullanimi/Ev.dart';

class Villa extends Ev{
  late bool garajVarmi;

  Villa(this.garajVarmi,int pencereSayisi) : super(pencereSayisi);
}