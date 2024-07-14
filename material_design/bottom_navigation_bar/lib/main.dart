import 'package:bottom_navigation_bar/Sayfa1.dart';
import 'package:bottom_navigation_bar/Sayfa2.dart';
import 'package:bottom_navigation_bar/Sayfa3.dart';
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

  var sayfaListesi = [Sayfa1(),Sayfa2(),Sayfa3()];

  int secilenIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: sayfaListesi[secilenIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: "Bir",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: "İki",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            label: "Üç",
          ),
        ],
        backgroundColor: Colors.deepPurpleAccent,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        currentIndex: secilenIndex,
        onTap: (indeks){
          setState(() {
            secilenIndex = indeks;
          });
        },
      ),
    );
  }
}
