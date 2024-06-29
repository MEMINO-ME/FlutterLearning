void main(){

  selamla();

  String gelenSonuc = selamla1();
  print(gelenSonuc);

  selamla2("Muhammed Emin");

  toplama();

  int t1 = toplama1();
  print("Toplama 1: $t1");

  int t2 = toplama2(25, 20);
  print("Toplama 2: $t2");

}

void selamla(){
  String sonuc = "Merhaba Ahmet";
  print(sonuc);
}

String selamla1(){
  String sonuc = "Merhaba Ahmet";
  return sonuc;
}

void selamla2(String isim){
  String sonuc = "Merhaba $isim";
  print(sonuc);
}

void toplama(){
  int toplam = 30 +40;
  print("Toplama: $toplam");
}

int toplama1(){
  int toplam = 30+90;
  return toplam;
}

int toplama2(int sayi1, int sayi2){
  int toplam = sayi1 + sayi2;
  return toplam;
}
