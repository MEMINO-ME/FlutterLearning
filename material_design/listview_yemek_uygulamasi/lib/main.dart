import 'package:flutter/material.dart';
import 'package:listview_yemek_uygulamasi/DetaySayfa.dart';
import 'package:listview_yemek_uygulamasi/Yemekler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yemek Uygulaması',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<List<Yemekler>> yemekleriGetir() async{
    var yemekListesi = <Yemekler>[];

    var y1 = Yemekler(1, "Köfte", "kofte.png", 15.99);
    var y2 = Yemekler(2, "Ayran", "ayran.png", 2.0);
    var y3 = Yemekler(3, "Fanta", "fanta.png", 3.0);
    var y4 = Yemekler(4, "Makarna", "makarna.png", 14.99);
    var y5 = Yemekler(5, "Kadayıf", "kadayif.png", 8.50);
    var y6 = Yemekler(6, "Baklava", "baklava.png", 15.99);

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);

    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Yemekler"),
      ),
      body:FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var yemekListesi = snapshot.data;

            return ListView.builder(
              itemCount: yemekListesi!.length,
              itemBuilder: (context,indeks){
                var yemek = yemekListesi[indeks];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Detaysayfa(yemek: yemek)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Image.asset("yemekResimleri/${yemek.yemekResimAdi}"),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(yemek.yemekAdi,style: TextStyle(color: Colors.black, fontSize: 25),),
                            SizedBox(height: 50,),
                            Text("${yemek.yemekFiyat} \u{20BA}",style: TextStyle(color: Colors.lightBlueAccent, fontSize: 16),),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),
    );
  }
}
