import 'dart:collection';

void main(){
  var o1 = Ogrenciler(100, "Ahmet", "10F");
  var o2 = Ogrenciler(200, "Mehmet", "12A");
  var o3 = Ogrenciler(300, "Zeynep", "9A");
  var o4 = Ogrenciler(300, "Ece", "9C");


  var ogrenciler = HashSet<Ogrenciler>();
  ogrenciler.add(o1);
  ogrenciler.add(o2);
  ogrenciler.add(o3);
  ogrenciler.add(o4);

  for(var o in ogrenciler){
    print(("******"));
    print("Öğrenci no: ${o.no}");
    print("Öğrenci adı: ${o.ad}");
    print("Öğrenci sınıf: ${o.sinif}");
  }
}

class Ogrenciler{
  late int no;
  late String ad;
  late String sinif;

  Ogrenciler(this.no,this.ad,this.sinif);

  int get hashCode => this.no;
  @override
  bool operator ==(Object other) {
    if(no==(other as Ogrenciler).no){
      return true;
    }else{
      return false;
    }
  }
}