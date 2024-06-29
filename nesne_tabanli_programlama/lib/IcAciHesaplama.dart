void main(){

  var aci = AciBulma();
  int deger = aci.hesapla(3);
  print("İç açılar toplamı: $deger");

}

class AciBulma{
  int hesapla(int kenarSayisi){
    int sonuc = (kenarSayisi-2)*180;
    return sonuc;
  }
}