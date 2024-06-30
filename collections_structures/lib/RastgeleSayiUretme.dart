import 'dart:math';

void main(){
  var sayilar = <int>[];

  var r = Random();

  for(int i=0;i<100;i++){
    int rastgeleSayi = r.nextInt(51); //Buradaki sayının 1 eksiği kadar yapar.
    sayilar.add(rastgeleSayi);
  }

  sayilar.sort(); //Bunu kaldırırsak üretme sırasına göre görürüz.

  for(var s in sayilar){
    print(s);
  }
}