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

  Future<int> faktoriyelHesapla(int sayi) async{
    int sonuc = 1;
    for(int i=1;i<=sayi;i++){
      sonuc = sonuc * i;
    }
    return sonuc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Future Build"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<int>(
              future: faktoriyelHesapla(5),
              builder: (context,snapshot){
                if(snapshot.hasError){
                  print("Hata sonucu: ${snapshot.error}");
                }
                if(snapshot.hasData){
                  return Text("Sonuç: ${snapshot.data}");
                }else{
                  return Text("Gösterilecek veri yok");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
