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

  int? radioDeger = 0;

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
          children: [
            RadioListTile(
              title: Text("Galatasaray"),
                value: 1,
                groupValue: radioDeger,
                onChanged: (int? veri){
                  setState(() {
                    radioDeger = veri;
                  });
                  print("Galatasaray seçildi");
                }
            ),
            RadioListTile(
                title: Text("Fenerbahçe"),
                value: 2,
                groupValue: radioDeger,
                onChanged: (int? veri){
                  setState(() {
                    radioDeger = veri;
                  });
                  print("Fenerbahçe seçildi");
                }
            ),
            ElevatedButton(
                onPressed: (){
                  if(radioDeger==2){
                    print("Button: Fenerbahçe seçildi");
                  }
                  if(radioDeger==1){
                    print("Button: Galatasaray seçildi");

                  }
                },
                child: Text("Göster"),),
          ],
        ),
      ),
    );
  }
}
