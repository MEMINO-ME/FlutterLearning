import 'package:flutter/material.dart';
import 'package:listview_builder_dinamik_liste/DetaySayfa.dart';

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

  var ulkeler =<String>["Almanya","Hollanda","Avusturya","Fransa","Türkiye"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ulkeler.length,
          itemBuilder: (context, indeks){
            return GestureDetector(
              onTap: (){
                //print("${ulkeler[indeks]} seçildi");
                Navigator.push(context,MaterialPageRoute(builder: (context) => Detaysayfa(ulkeAdi: ulkeler[indeks],)));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: (){
                              print("${ulkeler[indeks]} text ile seçildi.");
                            },
                            child: Text(ulkeler[indeks])
                        ),
                        Spacer(),
                        /* TextButton(
                            onPressed: (){
                              print("Buton ile ${ulkeler[indeks]} seçildi.");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Text("Göster",style: TextStyle(color: Colors.white),),
                        ), */
                        PopupMenuButton(
                          child: Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            PopupMenuItem(value: 1, child: Text("Sil"),),
                            PopupMenuItem(value: 2, child: Text("Güncelle"),),
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
      ),
    );
  }
}
