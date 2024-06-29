void main(){

var maas = Maas();
int deger = maas.maasHesapla(25);
print("Maaşınız: $deger");

}

class Maas{
  int maasHesapla(int gunSayisi){
    int calismaSaati = gunSayisi*8;
    print("Çalışma saati: $calismaSaati");

    int maas = 0;

    if(calismaSaati<=160){
      maas = calismaSaati*10;
    }else{
      int mesaiFazlasi = calismaSaati - 160;
      maas = 160*10 + mesaiFazlasi;
    }
    return maas;
  }
}