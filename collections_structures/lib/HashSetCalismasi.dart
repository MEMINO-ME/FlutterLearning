import 'dart:collection';

void main(){
  var sayilar = HashSet<int>();

  var isimler = HashSet.from(["Ahmet","Mehmet"]);

  var meyveler = HashSet<String>();
  meyveler.add("Çilek");
  meyveler.add("Karpuz");
  meyveler.add("Muz");
  meyveler.add("Elma");
  print(meyveler); // Verileri girilme sırasına göre değil de random karışık kaydeder

  meyveler.add("Elma");
  print(meyveler); //Aynı isimdeki veriyi kaydetmez

  print(meyveler.elementAt(1));
  print(meyveler.length);
  print(meyveler.isEmpty);
  print(meyveler.contains("Muz"));

  for(var m in meyveler){
    print("Sonuç: $m");
  }

  for(int i=0;i<meyveler.length;i++){
    print("$i. indekste ${meyveler.elementAt(i)}");
  }

  meyveler.remove("Muz");
  print(meyveler);
  meyveler.clear();
  print(meyveler);
}