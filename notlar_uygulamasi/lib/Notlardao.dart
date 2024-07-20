import 'package:notlar_uygulamasi/Notlar.dart';
import 'package:notlar_uygulamasi/VeritabaniYardimcisi.dart';

class Notlardao{

  Future<List<Notlar>> notlariGetir() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM notlar");

    return List.generate(maps.length, (indeks) {
      var satir = maps[indeks];
      return Notlar(satir["not_id"], satir["ders_adi"], satir["not1"], satir["not2"]);
    });
  }

  Future<void> notEkle(String dersAdi, int not1, int not2) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var bilgiler = Map<String,dynamic>();
    bilgiler["ders_adi"] = dersAdi;
    bilgiler["not1"] = not1;
    bilgiler["not2"] = not2;

    await db.insert("notlar", bilgiler);
  }

  Future<void> notGuncelle(int notId, String dersAdi, int not1, int not2) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var bilgiler = Map<String,dynamic>();
    bilgiler["ders_adi"] = dersAdi;
    bilgiler["not1"] = not1;
    bilgiler["not2"] = not2;

    await db.update("notlar", bilgiler,where: "not_id=?",whereArgs: [notId]);
  }

  Future<void> notSil(int notId) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    await db.delete("notlar", where: "not_id=?",whereArgs: [notId]);
  }

}