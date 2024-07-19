import 'package:sqlite_kullanimi/Kisiler.dart';
import 'package:sqlite_kullanimi/VeritabaniYardimcisi.dart';

class Kisilerdao{

  Future<List<Kisiler>> tumKisiler() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler");

    return List.generate(maps.length, (i) {
      var satir = maps[i];

      return Kisiler(satir["KisiId"],satir["KisiAd"],satir["KisiYas"]);
    });
  }

  Future<void> kisiEkle(String kisiAd,int kisiYas) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var bilgiler = Map<String,dynamic> ();
    bilgiler["KisiAd"] = kisiAd;
    bilgiler["KisiYas"] = kisiYas;
    await db.insert("kisiler", bilgiler);
  }

  Future<void> kisiSil(int kisiID) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    await db.delete("kisiler", where: "KisiID = ?", whereArgs: [kisiID]);
  }

  Future<void> kisiGuncelle(int kisiID, String kisiAd, int kisiYas) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var bilgiler = Map<String,dynamic> ();
    bilgiler["KisiAd"] = kisiAd;
    bilgiler["KisiYas"] = kisiYas;

    await db.update("kisiler", bilgiler, where: "KisiID = ?",whereArgs: [kisiID]);
  }

  Future<int> kayitKontrol(String kisiAd) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT count(*) AS sonuc FROM kisiler WHERE KisiAd=$kisiAd");

    return maps[0] ["sonuc"];
  }

  Future<Kisiler> kisiGetir(int kisiID) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * AS FROM kisiler WHERE KisiID=$kisiID");

    var satir = maps[0];

    return Kisiler(satir["KisiID"], satir["KisiAd"], satir["KisiYas"]);
  }

  Future<List<Kisiler>> kisiArama(String aramaKelimesi) async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * AS FROM kisiler WHERE KisiAd like '%$aramaKelimesi%'");

    var satir = maps[0];

    return List.generate(maps.length, (i) {
      var satir = maps[i];

      return Kisiler(satir["KisiId"],satir["KisiAd"],satir["KisiYas"]);
    });  }

  Future<List<Kisiler>> rastgele2KisiGetir() async{
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * AS FROM kisiler ORDER BY RANDOM() LIMIT 2");

    var satir = maps[0];

    return List.generate(maps.length, (i) {
      var satir = maps[i];

      return Kisiler(satir["KisiId"],satir["KisiAd"],satir["KisiYas"]);
    });  }
}