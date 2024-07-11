import 'package:flutter/material.dart';
import 'package:yasam_dongusu_calismasi/SayfaA.dart';

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

class _AnasayfaState extends State<Anasayfa> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    print("initState() çalıştı");
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.inactive){
      print("İnactive çalıştı");
    }
    if(state == AppLifecycleState.paused){
      print("İnactive çalıştı");
    }
    if(state == AppLifecycleState.resumed){
      print("İnactive çalıştı");
    }
    if(state == AppLifecycleState.detached){
      print("İnactive çalıştı");
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);

  }

  @override
  Widget build(BuildContext context) {

    print("build() çalıştı");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Yaşam Döngüsü"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SayfaA()));
                },
                child: Text("Tıkla"),
            ),
          ],
        ),
      ),

    );
  }
}
