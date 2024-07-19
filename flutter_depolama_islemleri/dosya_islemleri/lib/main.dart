import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

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

  var tfGirdi = TextEditingController();

  Future<void> VeriYaz() async{
    var ad = await getApplicationDocumentsDirectory();
    var uygulamaDosyalamaYolu = ad.path;
    var dosya = File("$uygulamaDosyalamaYolu/dosyam.txt");
    dosya.writeAsString(tfGirdi.text);
    tfGirdi.text = "";
  }

  Future<void> VeriOku() async{
    try{
      var ad = await getApplicationDocumentsDirectory();
      var uygulamaDosyalamaYolu = ad.path;
      var dosya = File("$uygulamaDosyalamaYolu/dosyam.txt");

      String okunanVeri = await dosya.readAsString();

      tfGirdi.text = okunanVeri;
    }catch(e){
      e.toString();
    }
  }

  Future<void> VeriSil() async{
      var ad = await getApplicationDocumentsDirectory();
      var uygulamaDosyalamaYolu = ad.path;
      var dosya = File("$uygulamaDosyalamaYolu/dosyam.txt");

      if(dosya.existsSync()){
        dosya.delete();
      }
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfGirdi,
                decoration: InputDecoration(
                  hintText: "Veri giriniz"
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text("Yaz"),
                  onPressed: (){
                    VeriYaz();
                  },
                ),
                ElevatedButton(
                  child: Text("Oku"),
                  onPressed: (){
                    VeriOku();
                  },
                ),
                ElevatedButton(
                  child: Text("Sil"),
                  onPressed: (){
                    VeriSil();
                  },
                )
              ],
            ),
          ],
        ),
      ),

    );
  }
}
