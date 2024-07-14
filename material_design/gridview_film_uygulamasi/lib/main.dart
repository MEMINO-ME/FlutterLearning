import 'package:flutter/material.dart';
import 'package:gridview_film_uygulamasi/DetaySayfa.dart';
import 'package:gridview_film_uygulamasi/Filmler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film Uygulaması',
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

  Future<List<Filmler>> filmleriGetir() async{
    var filmListesi = <Filmler>[];

    var f1 = Filmler(1, "Django", "django.png", 15.99);
    var f2 = Filmler(2, "Anadoluda", "anadoluda.png", 10.0);
    var f3 = Filmler(3, "Inception", "inception.png", 11.0);
    var f4 = Filmler(4, "Interstaller", "interstellar.png", 14.99);
    var f5 = Filmler(5, "The Hateful Eight", "thehatefuleight.png", 8.50);
    var f6 = Filmler(6, "The Pianist", "thepianist.png", 15.99);

    filmListesi.add(f1);
    filmListesi.add(f2);
    filmListesi.add(f3);
    filmListesi.add(f4);
    filmListesi.add(f5);
    filmListesi.add(f6);

    return filmListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Filmler"),
      ),
      body:FutureBuilder<List<Filmler>>(
        future: filmleriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var filmListesi = snapshot.data;

            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2/3.5,
                ),
                itemCount: filmListesi!.length,
                itemBuilder: (context,indeks){
                  var film = filmListesi[indeks];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Detaysayfa(film: film)));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("filmResimleri/${film.filmResimAdi}"),
                          ),
                          Text(film.filmAdi,style: TextStyle(color: Colors.black, fontSize: 16),),
                          Text("${film.filmFiyat} \u{20BA}",style: TextStyle(color: Colors.lightBlueAccent, fontSize: 16),),
                        ],
                      ),
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
