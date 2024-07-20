import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;


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
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  var flp = FlutterLocalNotificationsPlugin();

  Future<void> kurulum() async{
    var androidSettings = const AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosSettings = const DarwinInitializationSettings();
    var setupSettings = InitializationSettings(android: androidSettings,iOS: iosSettings);
    await flp.initialize(setupSettings,onDidReceiveNotificationResponse: bildirimSecilme);
  }

  Future<void> bildirimSecilme(NotificationResponse notificationResponse) async{
    var payload = notificationResponse;
    if(payload!=null){
      print("Bildirim seçildi");
    }
  }

  @override
  void initState() {
    super.initState();
    kurulum();
  }

  Future<void> bildirimGoster() async{
    var androidBildirimDetay = const AndroidNotificationDetails(
      "kanalAdi",
      "kanalBaslik",
      channelDescription: "Kanal açıklama",
      priority: Priority.high,
      importance: Importance.max,
    );
    var iosBildirimDetay = const DarwinNotificationDetails();
    var bildirimDetay = NotificationDetails(android: androidBildirimDetay,iOS: iosBildirimDetay);
    await flp.show(0, "Başlık", "içerik", bildirimDetay,payload: "Payload içerik");
  }

  Future<void> gecikmeliGoster() async{
    var androidBildirimDetay = const AndroidNotificationDetails(
      "kanalAdi",
      "kanalBaslik",
      channelDescription: "Kanal açıklama",
      priority: Priority.high,
      importance: Importance.max,
    );
    var iosBildirimDetay = const DarwinNotificationDetails();
    var bildirimDetay = NotificationDetails(android: androidBildirimDetay,iOS: iosBildirimDetay);
    tz.initializeTimeZones();

    var gecikme = tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));

    await flp.zonedSchedule(0, "Başlık gecikmeli", "içerik gecikmeli", gecikme, bildirimDetay, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,androidAllowWhileIdle: true,payload: "İçerik gecikmeli");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bldirim kullanımı"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){

            }, child: const Text("Bildirim oluştur")),
            ElevatedButton(onPressed: (){
              gecikmeliGoster();
            }, child: const Text("Gecikmeli bildirim oluştur"))
          ],
        ),
      ),
    );
  }
}
