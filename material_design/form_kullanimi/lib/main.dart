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

  var formKey = GlobalKey<FormState>();
  var tfKullaniciAdi = TextEditingController();
  var tfSifre = TextEditingController();

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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: tfKullaniciAdi,
                      decoration: InputDecoration(
                        hintText: "Kullanıcı Adı"),
                        validator: (tfGirdisi){
                          if(tfGirdisi!.isEmpty){
                            return "Kullanıcı adı giriniz";
                          }
                          return null;
                        },
                      ),
                    TextFormField(
                      controller: tfSifre,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Şifre"
                      ),
                        validator: (tfGirdisi){

                          if(tfGirdisi!.isEmpty){
                            return "Kullanıcı adı giriniz";
                          }
                          
                          if(tfGirdisi!.length<6){
                            return "Şifreniz en az 6 haneli olmalı";
                          }
                          return null;

                        },
                      ),
                    ElevatedButton(
                        onPressed: (){
                          bool kontrolSonucu = formKey.currentState!.validate();
                          if(kontrolSonucu){
                            String ka = tfKullaniciAdi.text;
                            String s = tfSifre.text;
                            print("Kullanıcı adı: $ka, Şifre: $s");
                          }
                        },
                        child: Text("Giriş"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
