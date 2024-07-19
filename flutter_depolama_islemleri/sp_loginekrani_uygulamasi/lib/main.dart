import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_loginekrani_uygulamasi/Anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> oturumKontrol() async{
    var sp = await SharedPreferences.getInstance();

    String spKullaniciAdi = sp.getString("kullaniciAdi") ?? "Kullanıcı adı yok";
    String spSifre = sp.getString("sifre") ?? "Şifre yok";

    if(sp=="admin"){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: oturumKontrol(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            bool gecisIzni = snapshot.data!;
            return gecisIzni ? Anasayfa() : LoginEkrani();
          }else{
            return Container();
          }
        },
      )
    );
  }
}

class LoginEkrani extends StatefulWidget {

  @override
  State<LoginEkrani> createState() => _LoginEkraniState();
}

class _LoginEkraniState extends State<LoginEkrani> {

  var tfKullaniciAdi = TextEditingController();
  var tfSifre = TextEditingController();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> girisKontrol() async{
    var ka = tfKullaniciAdi.text;
    var sf = tfSifre.text;

    if(ka == "admin" && sf == "123"){
      var sp = await SharedPreferences.getInstance();
      sp.setString("kullaniciAdi", ka);
      sp.setString("sifre", sf);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Anasayfa()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Giriş hatalı")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Login Ekranı"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: tfKullaniciAdi,
                decoration: InputDecoration(
                  hintText: "Kullanıcı Adı"
                ),
              ),
              TextField(
                controller: tfSifre,
                decoration: InputDecoration(
                    hintText: "Şifre"
                ),
              ),
              ElevatedButton(
                child: Text("Giriş yap"),
                onPressed: (){
                  girisKontrol();
                },
              )
            ],
          ),
        ),
      ),

    );
  }
}
