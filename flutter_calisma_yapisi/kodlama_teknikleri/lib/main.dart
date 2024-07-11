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

  bool kontrol = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Kodlama teknikleri"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Text( kontrol? "Doğru" : "Yanlış",
              style: TextStyle(
                color: kontrol? Colors.blue : Colors.red,
              ),),*/

            //if kontrolleriyle de yani düz dart kodlamasıyla da aynı işlem yapılabilir
            ((){

              if(kontrol){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.done),
                    Text("Doğru"),
                  ],
                );
              }else{
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cancel),
                    Text("Yanlış"),
                  ],
                );
              }

            }()),

            ElevatedButton(
                onPressed: (){
                  setState(() {
                    kontrol = true;
                  });
                },
                child: Text("Durum 1"),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  kontrol = false;
                });
              },
              child: Text("Durum 2"),
            ),

          ],
        ),
      ),

    );
  }
}
