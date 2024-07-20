import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/KayitSayfa.dart';
import 'package:kisiler_uygulamasi/Kisiler.dart';
import 'package:kisiler_uygulamasi/Kisilerdao.dart';
import 'package:kisiler_uygulamasi/main.dart';

class DetaySayfa extends StatefulWidget {

  late Kisiler kisi;

  DetaySayfa({required this.kisi});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {

  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();

  Future<void> guncelle(int kisiId,String kisiAd,String kisiTel) async{
    await Kisilerdao().kisiGuncelle(kisiId, kisiAd, kisiTel);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }
  @override
  void initState() {
    super.initState();

    var kisi = widget.kisi;
    tfKisiAdi.text = kisi.kisiAd;
    tfKisiTel.text = kisi.kisiTel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Kişi Detay"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left:50.0, right:50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                controller: tfKisiAdi,
                decoration: InputDecoration(
                  hintText: "Kişi Ad",
                ),
              ),
              TextField(
                controller: tfKisiTel,
                decoration: InputDecoration(
                  hintText: "Kişi Telefon",
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          guncelle(widget.kisi.kisiId, tfKisiAdi.text, tfKisiTel.text);
          Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
        },
        tooltip: '',
        icon:  Icon(Icons.update),
        label: Text("Güncelle"),
      ),
    );  }
}
