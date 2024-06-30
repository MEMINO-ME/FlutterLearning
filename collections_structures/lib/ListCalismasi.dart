void main(){
  // var sayilar = List(); --- kaldırıldı
  // var sonuclar = new List(); --- kaldırıldı
  // Null safety güncellemesi sonucu kaldırıldılar

  var iller = <String>[];

  var plakalar = [16,34,6];
  
  var meyveler = <String>[];
  meyveler.add("Çilek"); //0
  meyveler.add("Muz"); //1
  meyveler.add("Elma"); //2
  meyveler.add("Karpuz"); //3
  meyveler.add("Kiraz"); //4

  print(meyveler);

  meyveler.add("Mandalina");

  print(meyveler);

  meyveler[2]="Ananas";

  print(meyveler);

  meyveler.insert(3, "Portakal");

  print(meyveler);

  String str = meyveler[0];
  print(str);
  print(meyveler[2]);

}