import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_kullanimi/SayfaA.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<void> veriKaydi() async{
    var sp = await SharedPreferences.getInstance();
    sp.setString("ad", "Ahmet");
    sp.setInt("yas", 18);
    sp.setDouble("boy", 1.78);
    sp.setBool("bekarMi", true);
    
    var arkadasListe = <String>[];
    arkadasListe.add("Selo");
    arkadasListe.add("Mert abi");
    
    sp.setStringList("arkadasListe", arkadasListe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Geçiş yap"),
              onPressed: (){
                veriKaydi();

                Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaA()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
