void main(){

  int yas = 17;
  String isim = "Mehmet";

  //Örnek 2

  if(yas >= 18){
    print("Reşitsiniz");
  }

  //Örnek 2
  if(yas >= 18){
    print("Reşitsiniz");
  }else{
    print("Reşit değilsiniz");
  }

  //Örnek 3
  if(isim == "Ahmet"){
    print("Merhaba Ahmet");
  }else{
    print("Tanınmayan kişi");
  }

  //Örnek 4

  if(isim == "Ahmet"){
    print("Merhaba Ahmet");
  }else if(isim == "Mehmet"){
    print("Merhaba Mehmet");
  }else{
    print("Tanınmayan kişi");
  }

  //Örnek 5

  String kullaniciAdi = "admin";
  int sifre = 12345;

  if(sifre == 12345 && kullaniciAdi == "admin"){
    print("Hoşgeldiniz");
  }else{
    print("Hatalı giriş");
  }

  //Örnek 6

  int sinif = 10;

  if(sinif == 9 || sinif == 10 || sinif == 11 || sinif == 12){
    print("AYT sınavına hazırlanabilirsiniz.");
  }else{
    print("Sınav belirlenemedi");
  }

  //Örnek 7
  int a = 10;
  int b = 14;

  if(a == b) print("Eşit"); else print("Eşit değil");

}