import 'package:flutter/material.dart';
import 'package:sqlite_foreign_kullanimi/Filmler.dart';
import 'package:sqlite_foreign_kullanimi/Filmlerdao.dart';

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

  Future<void> tumFilmler() async{
    var liste = await Filmlerdao().tumFilmler();

    for(Filmler f in liste){
      print("***********");
      print("Film ID: ${f.filmId}");
      print("Film Ad: ${f.filmAd}");
      print("Film Yıl: ${f.filmYil}");
      print("Film Resim: ${f.filmResim}");
      print("Film Yönetmen: ${f.yonetmen.yonetmenAd}");
      print("Film Kategori: ${f.kategori.kategoriAd}");
    }
  }

  @override
  void initState() {
    super.initState();

    tumFilmler();
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
