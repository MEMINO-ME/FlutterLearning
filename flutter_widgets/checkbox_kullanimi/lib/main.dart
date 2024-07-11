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
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool? kotlinDurum = false;
  bool? dartDurum = false;

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
            CheckboxListTile(
              title: Text("Kotlin"),
              value: kotlinDurum,
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.red,
              activeColor: Colors.deepPurple,
              onChanged: (bool? veri){
                print("Kotlin seçildi: $veri");
                setState(() {
                  kotlinDurum = veri;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Dart"),
              value: kotlinDurum,
              controlAffinity: ListTileControlAffinity.leading,
              checkColor: Colors.red,
              activeColor: Colors.deepPurple,
              onChanged: (bool? veri){
                print("Dart seçildi: $veri");
                setState(() {
                  dartDurum = veri;
                });
              },
            ),
            ElevatedButton(
                onPressed: (){
                  print("Dart Durum: $dartDurum");
                  print("Kotlin Durum: $kotlinDurum");
                },
                child: Text("Göster"))
          ],
        ),
      ),
    );
  }
}
