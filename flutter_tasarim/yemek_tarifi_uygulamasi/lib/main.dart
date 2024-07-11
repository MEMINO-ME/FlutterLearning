import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Yemek Tarifi'),
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

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: ekranGenisligi,
                child: Image.asset("resimler/kofte.jpg")
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: ekranGenisligi/8,
                    child: TextButton(
                        onPressed:() {
                          print("Beğenildi");
                        },
                        child: Yazi("Beğen", ekranGenisligi/25),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: ekranGenisligi/8,
                    child: TextButton(
                      onPressed:() {
                        print("Yorum yapıldı");
                      },
                      child: Yazi("Yorum yap", ekranGenisligi/25),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(ekranYuksekligi/100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Köfte",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: ekranGenisligi/20,
                    ),
                  ),
                  Row(
                    children: [
                      Yazi("Izgara pişirime uygun", ekranGenisligi/25),
                      Spacer(),
                      Yazi("8 Temmuz", ekranGenisligi/25),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(ekranYuksekligi/100),
                    child: Yazi("Köfte harcini hazirlamak için, soganlari rendeleyin ve maydanozlari ince ince kiyin. isterseniz, bir dis sarimsak da ekleyebilirsiniz."
                      "Sogan, maydanoz, kiyma, yumurta, zeytinyagi ve tuzu bir kaba alip iyice yogurun. Bu sirada istediginiz baharatlari da ekleyerek yogurmaya devam edin."
                      "Hazirladiginiz harcin üzerini strec filmle kapatarak yarim saat"
                      "buzdolabinda dinlendirin."
                      "Ardindan harçtan ceviz büyüklügünde parçalar koparip"
                      "yuvarlayin. 1 cm olacak sekilde üzerine bastirarak yassılaştırın.", ekranGenisligi/25),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Yazi extends StatelessWidget {
  late String icerik;
  late double yaziBoyut;

  Yazi(this.icerik,this.yaziBoyut);

  @override
  Widget build(BuildContext context) {
    return Text(icerik, style: TextStyle(fontSize: yaziBoyut),);
  }
}

