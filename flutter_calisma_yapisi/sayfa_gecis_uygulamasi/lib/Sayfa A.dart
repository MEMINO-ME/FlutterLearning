import 'package:flutter/material.dart';

import 'Kisiler.dart';
import 'Sayfa B.dart';

class SayfaA extends StatefulWidget {

  late Kisiler kisi;

  SayfaA({required this.kisi});

  @override
  State<SayfaA> createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sayfa A"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SayfaB()));
                },
                child: Text("Sayfa B'ye git")),

            Text("İsim: ${widget.kisi.isim}"),
            Text("İsim: ${widget.kisi.yasi}"),
            Text("İsim: ${widget.kisi.boy}"),
            Text("İsim: ${widget.kisi.bekarMi}"),

          ],
        ),
      ),
    );
  }
}
