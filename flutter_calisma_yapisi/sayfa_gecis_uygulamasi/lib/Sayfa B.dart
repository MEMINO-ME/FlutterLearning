import 'package:flutter/material.dart';
import 'package:sayfa_gecis_uygulamasi/main.dart';

class SayfaB extends StatefulWidget {
  const SayfaB({super.key});

  @override
  State<SayfaB> createState() => _SayfaBState();
}

class _SayfaBState extends State<SayfaB> {

  Future<bool> geriDonusTusu(BuildContext context) async{
    print("Geri tuşu tıklandı");
    return true;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sayfa B"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            print("Appbar geri dönüş tuşu tıklandı");
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: ()=> geriDonusTusu(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Geldiği sayfaya dön")),
              ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).popUntil((route)=>route.isFirst);
                  },
                  child: Text("Anasayfaya dön")),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AnaSayfa()));
                  },
                  child: Text("Anasayfaya geçiş yap")),
            ],
          ),
        ),
      ),
    );
  }
}
