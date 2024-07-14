import 'package:flutter/material.dart';
import 'package:gridview_film_uygulamasi/Filmler.dart';

class Detaysayfa extends StatefulWidget {

  late Filmler film;

  Detaysayfa({required this.film});

  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.film.filmAdi),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("filmResimleri/${widget.film.filmResimAdi}"),
              Text("${widget.film.filmFiyat} \u{20BA}",style: TextStyle(color: Colors.lightBlueAccent, fontSize: 48),),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    onPressed: (){
                      print("${widget.film.filmAdi} kiralandı.");
                    },
                    child: Text("Kirala")),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
