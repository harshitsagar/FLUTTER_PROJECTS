import 'package:flutter/material.dart';
import 'package:snake_game/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {

  WidgetsFlutterBinding.ensureInitialized() ;
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyD4-fOfJ-5PHV4Zp_ZftrDlRTO9JmvK8Cs",
        authDomain: "snakegame-911c8.firebaseapp.com",
        projectId: "snakegame-911c8",
        storageBucket: "snakegame-911c8.appspot.com",
        messagingSenderId: "436445555569",
        appId: "1:436445555569:web:246cf1b82bb436ff0224d0",
        measurementId: "G-88ZKTPL2Z4"
    )
  ) ;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}
