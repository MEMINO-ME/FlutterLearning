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

  var tfController = TextEditingController();
  String alinanVeri = "";

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfController,
                obscureText: true,
                keyboardType: TextInputType.datetime,
                textAlign: TextAlign.center,
                maxLength: 50,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Yazınız",
                  hintStyle: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                  ),
                  labelText: "Email",
                  labelStyle:TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                  filled: true,
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Icon(Icons.print),
                ),
              ),
            ),

            ElevatedButton(
                onPressed: (){
                  setState(() {
                    alinanVeri = tfController.text;
                  });
                },
                child: Text("Veriyi al")),

            Text("Gelen veri: $alinanVeri",
              style: TextStyle(
                color: Colors.green,
                backgroundColor: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold,

              ),
            ),

          ],
        ),
      ),
    );
  }
}
