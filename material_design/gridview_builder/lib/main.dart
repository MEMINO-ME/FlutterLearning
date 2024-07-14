import 'package:flutter/material.dart';
import 'package:gridview_builder/DetaySayfa.dart';

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

  var ulkeler = <String>["Türkiye","Almanya","Rusya","Çin","Amerika"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2/1,
          ),
          itemCount: ulkeler.length,
          itemBuilder: (context, indeks){
            return GestureDetector(
              onTap: (){
                print("${ulkeler[indeks]} seçildi.");
              },
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Detaysayfa(ulkeAdi: ulkeler[indeks])));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: (){
                              print("${ulkeler[indeks]} text ile seçildi.");
                            },
                            child: Text(ulkeler[indeks])),
                        Spacer(),
                        /* TextButton(
                            onPressed: (){
                              print("${ulkeler[indeks]} button ile seçildi.");
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Text("Ülkeyi seç",style: TextStyle(color: Colors.white),)
                        ) */
                        PopupMenuButton(
                          child: Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(child: Text("Sil"), value: 1,),
                            PopupMenuItem(child: Text("Güncelle"), value: 2,)
                          ],
                          onSelected: (menuItemValue){
                            if(menuItemValue==1){
                              print("${ulkeler[indeks]} silindi.");
                            }
                            if(menuItemValue==2){
                            print("${ulkeler[indeks]} güncellendi.");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
      ),
    );
  }
}
