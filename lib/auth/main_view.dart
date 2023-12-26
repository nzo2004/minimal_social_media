import 'package:clone_app/auth/auth_view.dart';
import 'package:clone_app/view/home_view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Main_View extends StatefulWidget {
  const Main_View({super.key});

  @override
  State<Main_View> createState() => _Main_ViewState();
}

class _Main_ViewState extends State<Main_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        //Uygulamaya hesabınız açık mı diye sorar
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //açıksa
          if (snapshot.hasData) {
            return Home_View();
            //değilse
          } else {
            return Auth_View();
          }
        },
      ),
    );
  }
}
