import 'package:flutter/material.dart';
import 'package:listview_yemek_uygulamasi/Yemekler.dart';

class Detaysayfa extends StatefulWidget {

  late Yemekler yemek;

  Detaysayfa({required this.yemek});

  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.yemek.yemekAdi),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("yemekResimleri/${widget.yemek.yemekResimAdi}"),
            Text("${widget.yemek.yemekFiyat} \u{20BA}",style: TextStyle(color: Colors.lightBlueAccent, fontSize: 48),),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  onPressed: (){
                    print("${widget.yemek.yemekAdi} sipraiş edildi.");
                  },
                  child: Text("Sipariş Ver")),
            ),
          ],
        ),
      ),

    );
  }
}
