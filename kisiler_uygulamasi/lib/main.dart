import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/DetaySayfa.dart';
import 'package:kisiler_uygulamasi/KayitSayfa.dart';
import 'package:kisiler_uygulamasi/Kisiler.dart';
import 'package:kisiler_uygulamasi/Kisilerdao.dart';

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

  bool aramaYapiliyorMu = false;
  String aramaKelimesi = "";

  Future<List<Kisiler>> tumKisileriGoster() async{
    var kisiListesi = await Kisilerdao().tumKisiler();

    return kisiListesi;
  }

  Future<List<Kisiler>> aramaYap(String aramaKelimesi) async{
    var kisiListesi = await Kisilerdao().kisiArama(aramaKelimesi);

    return kisiListesi;
  }

  Future<void> sil(int kisiId) async{
    await Kisilerdao().kisiSil(kisiId);
    setState(() {

    });
  }

  Future<bool> uygulamayiKapat() async{
    await exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            uygulamayiKapat();
          },
        ),
        title: aramaYapiliyorMu ?
            TextField(
              decoration: InputDecoration(
                hintText: "Arama için bir şey yazınız.",
              ),
              onChanged: (aramaSonucu){
                print("Arama sonucu: $aramaSonucu");
                setState(() {
                  aramaKelimesi = aramaSonucu;
                });
              },
            )
            : Text("Kişiler Uygulaması"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){
              setState(() {
                aramaYapiliyorMu = false;
                aramaKelimesi = "";
              });
            },
          )
              :IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              setState(() {
                aramaYapiliyorMu = true;
              });
            },
          )
        ],
      ),
      body:PopScope(
        canPop: false,
        onPopInvoked: (didPop){
          uygulamayiKapat();
        },
        child: FutureBuilder<List<Kisiler>>(
          future: aramaYapiliyorMu ? aramaYap(aramaKelimesi) : tumKisileriGoster(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              var kisiListesi = snapshot.data;

              return ListView.builder(
                itemCount: kisiListesi!.length,
                itemBuilder: (context,indeks){
                  var kisi = kisiListesi[indeks];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kisi: kisi,)));
                    },
                    child: Card(
                      child: SizedBox(height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(kisi.kisiAd,style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(kisi.kisiTel,),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: (){
                                sil(kisi.kisiId);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }else{
              return Center();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Kayitsayfa()));
        },
        tooltip: '',
        child: const Icon(Icons.add),
      ),
    );
  }
}
