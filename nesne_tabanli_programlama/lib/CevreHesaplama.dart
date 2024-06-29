void main(){

var dikdortgen = Cevrehesaplama();
dikdortgen.hesapla(3, 5);

}

class Cevrehesaplama{
  void hesapla(int kenar1,int kenar2){
    print("Dikdörtgenin çevresi: ${2*(kenar1+kenar2)}");
  }
}
