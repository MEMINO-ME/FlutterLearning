import 'package:flutter/material.dart';
import 'package:sqlite_kullanimi/Kisiler.dart';
import 'package:sqlite_kullanimi/Kisilerdao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> kisileriGoster() async{
    var liste = await Kisilerdao().tumKisiler();

    for(Kisiler k in liste){
      print("***********");
      print("Kişi ad: ${k.kisiAd}");
      print("Kişi ID: ${k.kisiID}");
      print("Kişi yaş: ${k.kisiYas}");
    }
  }

  Future<void> kisiGetir() async{
    var kisi = await Kisilerdao().kisiGetir(4);

      print("***********");
      print("Kişi ad: ${kisi.kisiAd}");
      print("Kişi ID: ${kisi.kisiID}");
      print("Kişi yaş: ${kisi.kisiYas}");
  }

  Future<void> kisiArama() async{
    var liste = await Kisilerdao().kisiArama("a");

    for(Kisiler k in liste){
      print("***********");
      print("Kişi ad: ${k.kisiAd}");
      print("Kişi ID: ${k.kisiID}");
      print("Kişi yaş: ${k.kisiYas}");
    }
  }

  Future<void> rastgele2KisiGetir() async{
    var liste = await Kisilerdao().rastgele2KisiGetir();

    for(Kisiler k in liste){
      print("***********");
      print("Kişi ad: ${k.kisiAd}");
      print("Kişi ID: ${k.kisiID}");
      print("Kişi yaş: ${k.kisiYas}");
    }
  }

  Future<void> kisileriEkle() async{
    await Kisilerdao().kisiEkle("Onur", 47);
    await Kisilerdao().kisiEkle("Burçak", 45);
  }

  Future<void> kisileriSil() async{
    await Kisilerdao().kisiSil(1);
  }

  Future<void> kisileriGuncelle() async{
    await Kisilerdao().kisiGuncelle(3, "Yeni Onur", 47);
  }

  Future<void> kayitKontrol() async{
    int sonuc = await Kisilerdao().kayitKontrol("Onur");
    print("Veritabanında Onur sayısı: $sonuc");
  }

  @override
  void initState() {
    super.initState();
    //kisileriEkle();
    //kisileriSil();
    //kisileriGoster();
    //kayitKontrol();
    //kisiGetir();
    //kisiArama();
    //rastgele2KisiGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
