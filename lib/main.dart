import 'package:clone_app/firebase_options.dart';
import 'package:clone_app/auth/main_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final future = Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Main_View();
            } else {
              return Container();
            }
          },
        ));
  }
}
