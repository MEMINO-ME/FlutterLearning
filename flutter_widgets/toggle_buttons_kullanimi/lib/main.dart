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

  var toggleDurumlar = [false,true,false];
  int secilenToggleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Toggle Buttons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
                children: [
                  Icon(Icons.looks_one),
                  Icon(Icons.looks_two),
                  Icon(Icons.looks_3),
                ],
                isSelected: toggleDurumlar,
                color: Colors.pink,
                selectedColor: Colors.deepPurple,
                fillColor: Colors.yellow,
                onPressed: (int secilenIndex){
                  secilenToggleIndex = secilenIndex;
                  print("${secilenIndex+1}. toggle seçildi");

                  setState(() {
                    toggleDurumlar[secilenIndex] = !toggleDurumlar[secilenIndex];
                  });

                },
            ),
            ElevatedButton(
                onPressed: (){
                  print("En son ${secilenToggleIndex+1}. toggle seçildi");
                },
                child: Text("Göster"),),
          ],
        ),
      ),
    );
  }
}
