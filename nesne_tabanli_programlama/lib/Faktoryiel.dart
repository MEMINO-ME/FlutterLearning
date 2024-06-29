void main(){
  var f = Faktoriyel();
  int faktoriyel = f.hesapla(5);
  print("Fakötriyel hesabı: $faktoriyel");
}

class Faktoriyel{
  int hesapla(int sayi){
    int sonuc = 1;
    for(int i=1;i<=sayi;i++){
      sonuc = sonuc * i;
    }
    return sonuc;
  }
}