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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      /*body: Row(
        children: [
          Container(width: 80,height: 80,color: Colors.red),
          SizedBox(width: 100,height: 100,),
          SizedBox(
              width: 200,
              height: 400,
              child: Container(width: 50,height: 50,color: Colors.blue)
          ),
          //SizedBox(width: 100,height: 100,);
          Container(width: 100,height: 100,color: Colors.green),
        ],
      ),*/

      /*body: Column(
        children: [
          Container(width: 80,height: 80,color: Colors.red),
          Spacer(flex: 30,),
          Container(width: 50,height: 50,color: Colors.blue),
          Spacer(flex: 30,),
          Container(width: 100,height: 100,color: Colors.green),
        ],
      ),*/

      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0), //all yerine only dersek kenarları belirtmemiz gerekir
            child: Container(width: 100,height: 100,color: Colors.red),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(width: 100,height: 100,color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(width: 100,height: 100,color: Colors.green),
          ),
        ],
      ),

    );
  }
}
