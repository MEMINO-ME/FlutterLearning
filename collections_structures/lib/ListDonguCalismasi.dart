void main(){
  var meyveler = <String>[];
  meyveler.add("Çilek");
  meyveler.add("Muz");
  meyveler.add("Elma");
  meyveler.add("Kivi");
  meyveler.add("Kiraz");

  for(var m in meyveler){
    print("Sonuç: $m");
  }

  for(int i=0; i<meyveler.length;i++){
    print("Index: $i, Meyve: ${meyveler[i]}");
  }
}