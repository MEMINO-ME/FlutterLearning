import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {

  late bool sonuc;

  SonucEkrani({required this.sonuc});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
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
            widget.sonuc ? Image.asset("resimler/mutlu_resim") : Image.asset("resimler/uzgun_resim"),

            Text(widget.sonuc ? "Kazandınız " : "Kaybettiniz",style: TextStyle(color: Colors.purple,fontSize: 30),),

            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Tekrar Dene"),
              ),
            ),
          ],
        ),
      ),
    );  }
}
