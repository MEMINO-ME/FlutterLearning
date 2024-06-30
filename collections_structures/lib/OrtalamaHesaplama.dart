void main(){

  var sayilar = <int>[];
  sayilar.add(20);
  sayilar.add(100);
  sayilar.add(200);
  sayilar.add(40);
  sayilar.add(90);

  int toplam = 0;

  for(var sayi in sayilar){
    toplam = toplam + sayi;
  }

  print("Ortalama = ${toplam/sayilar.length}");

}