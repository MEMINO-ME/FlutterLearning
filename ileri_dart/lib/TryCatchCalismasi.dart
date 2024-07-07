void main(){
  var sayilar = <int>[];
  sayilar.add(34); //0. indeks
  sayilar.add(67); //1. indeks

  sayilar[1]=89;

  try{
    sayilar[2]=89;
    print("İşlem tamam"); //Hata olmazsa burası çalışacak
  }catch(e){
    print("Listenin boyutunu aştınız."); //Hata olursa burası çalışacak
  }

}