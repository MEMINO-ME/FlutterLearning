import 'package:flutter/material.dart';

class Detaysayfa extends StatefulWidget {
  late var ulkeAdi;

  Detaysayfa({required this.ulkeAdi});

  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("DetaySayfa"),
      ),
      body: Center(
        child: Text(widget.ulkeAdi, style: TextStyle(fontSize: 30),),
      )
    );
  }
}
