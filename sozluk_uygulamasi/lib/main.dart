import 'package:flutter/material.dart';
import 'package:sozluk_uygulamasi/DetaySayfa.dart';
import 'package:sozluk_uygulamasi/Kelimeler.dart';
import 'package:sozluk_uygulamasi/Kelimelerdao.dart';

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
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool aramaYapiliyorMu = false;
  String aramaKeliesi = "";

  Future<List<Kelimeler>> tumKelimeleriGoster() async{
    var kelimelerListesi = await Kelimelerdao().tumKelimeler();

    return kelimelerListesi;
  }

  Future<List<Kelimeler>> aramaYap(String aramaKelimesi) async{
    var kelimelerListesi = await Kelimelerdao().kelimeAra(aramaKelimesi);

    return kelimelerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: aramaYapiliyorMu ?
            TextField(
              decoration: InputDecoration(
                hintText: "Arama için bir şey yazınız.",),
              onChanged: (aramaSonucu){
                print("Arama sonucu: $aramaSonucu");
                setState(() {
                  aramaKeliesi = aramaSonucu;
                });
              },
            )
            : Text("Sözlük Uygulaması"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){
              setState(() {
                aramaYapiliyorMu = false;
                aramaKeliesi = "";
              });
            },
          )
          : IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              setState(() {
                aramaYapiliyorMu = true;
              });
            },
          )
        ],
      ),
      body: FutureBuilder<List<Kelimeler>>(
        future: aramaYapiliyorMu ? aramaYap(aramaKeliesi) : tumKelimeleriGoster(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var kelimelerListesi = snapshot.data;
            return ListView.builder(
              itemCount: kelimelerListesi!.length,
              itemBuilder: (context,indeks){
                var kelime = kelimelerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kelime: kelime,)));
                  },
                  child: SizedBox(height: 50,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(kelime.ingilizce,style: TextStyle(fontWeight: FontWeight.bold),),
                          Text(kelime.turkce),
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
