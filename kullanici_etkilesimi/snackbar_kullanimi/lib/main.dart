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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Merhaba"),
                    ),
                  );
                },
                child: Text("Varsayılan")),
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Merhaba"),
                      action: SnackBarAction(
                        label: "Silmek istiyor musunuz?",
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Silindi"),
                            ),
                          );
                        }
                      ),
                    ),
                  );
                },
                child: Text("Snackbar action")),
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("İnternet bağlantısı yok!", style: TextStyle(color: Colors.indigoAccent),),
                      backgroundColor: Colors.white,
                      duration: Duration(seconds: 5),
                      action: SnackBarAction(
                          label: "Tekrar dene",
                          textColor: Colors.red,
                          onPressed: () {
                            print("Tekrar denendi");
                          }
                      ),
                    ),
                  );
                },
                child: Text("Snackbar özel")),
          ],
        ),
      ),
    );
  }
}
