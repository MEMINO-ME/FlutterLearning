import 'dart:collection';

import 'package:bayrak_quiz_uygulamasi/Bayraklar.dart';
import 'package:bayrak_quiz_uygulamasi/Bayraklardao.dart';
import 'package:bayrak_quiz_uygulamasi/SonucEkrani.dart';
import 'package:flutter/material.dart';

class QuizEkrani extends StatefulWidget {
  const QuizEkrani({super.key});

  @override
  State<QuizEkrani> createState() => _QuizEkraniState();
}

class _QuizEkraniState extends State<QuizEkrani> {

  var sorular = <Bayraklar>[];
  var yanlisSecenekler = <Bayraklar>[];
  late Bayraklar dogruSoru;
  var tumSecenekler = HashSet<Bayraklar> ();

  late int soruSayaci;
  late int dogruSayac;
  late int yanlisSayac;

  String bayrakResimAdi = "placeholder.png";
  String buttonAyazi = "";
  String buttonByazi = "";
  String buttonCyazi = "";
  String buttonDyazi = "";

  @override
  void initState() {
    super.initState();

    sorulariAl();
  }

  Future<void> sorulariAl() async{
    sorular = await Bayraklardao().rastgele5Getir();
    sorulariYukle();
  }

  Future<void> sorulariYukle() async{
    dogruSoru = sorular[soruSayaci];

    bayrakResimAdi = dogruSoru.bayrakResim;

    yanlisSecenekler = await Bayraklardao().rastgele3YanlisGetir(dogruSoru.bayrakId);

    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlisSecenekler[0]);
    tumSecenekler.add(yanlisSecenekler[1]);
    tumSecenekler.add(yanlisSecenekler[2]);

    buttonAyazi = tumSecenekler.elementAt(0).bayrakAd;
    buttonByazi = tumSecenekler.elementAt(1).bayrakAd;
    buttonCyazi = tumSecenekler.elementAt(2).bayrakAd;
    buttonDyazi = tumSecenekler.elementAt(3).bayrakAd;

    setState(() {
      //Boş çalıştığı zaman arayüz güncellenir.
    });
  }

  void soruSayacKontrol() {
    soruSayaci = soruSayaci + 1;
    if(soruSayaci!=5){
      sorulariYukle();
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani(dogruSayisi: dogruSayac,)));
    }
  }

  void dogruKontrol(String buttonYazi){
    if(dogruSoru.bayrakAd==buttonYazi){
      dogruSayac = dogruSayac + 1;
    }else{
      yanlisSayac = yanlisSayac + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Quiz Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Doğru: $dogruSayac",style: TextStyle(fontSize: 18),),
                Text("Yanlış: $yanlisSayac",style: TextStyle(fontSize: 18),),
              ],
            ),
            soruSayaci != 5 ? Text("${soruSayaci+1}. Soru",style: TextStyle(fontSize: 30),):
            Text("5. Soru",style: TextStyle(fontSize: 30),),
            Image.asset("bayraklar/$bayrakResimAdi"),
            SizedBox(width: 250, height: 50,
              child: ElevatedButton(
                child: Text(buttonAyazi),
                onPressed: (){
                  dogruKontrol(buttonAyazi);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(width: 250, height: 50,
              child: ElevatedButton(
                child: Text(buttonByazi),
                onPressed: (){
                  dogruKontrol(buttonByazi);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(width: 250, height: 50,
              child: ElevatedButton(
                child: Text(buttonCyazi),
                onPressed: (){
                  dogruKontrol(buttonCyazi);
                  soruSayacKontrol();
                },
              ),
            ),
            SizedBox(width: 250, height: 50,
              child: ElevatedButton(
                child: Text(buttonDyazi),
                onPressed: (){
                  dogruKontrol(buttonDyazi);
                  soruSayacKontrol();
                },
              ),
            ),
          ],
        ),
      ),
    );  }
}
