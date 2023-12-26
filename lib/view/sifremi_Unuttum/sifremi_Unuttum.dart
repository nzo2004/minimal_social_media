import 'package:clone_app/view/sifremi_Unuttum/material/restart_password_field.dart';
import 'package:clone_app/view/sifremi_Unuttum/material/restrat_password_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class sifremi_Unuttum extends StatefulWidget {
  const sifremi_Unuttum({super.key});

  @override
  State<sifremi_Unuttum> createState() => _sifremi_UnuttumState();
}

class _sifremi_UnuttumState extends State<sifremi_Unuttum> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    //bir nesnenin bellekten kaldırılmadan önce temizlenmesini sağlayan

    emailController.dispose();
    super.dispose();
  }

  Future password_sifirla() async {
    //E mail adresinize şifre sıfırlama mail gönderir
    try {
      await FirebaseAuth.instance
          //mail adresinize mail gönderir.
          .sendPasswordResetEmail(email: emailController.text);
    } on FirebaseAuthException catch (e) {
      print(e);
      showAboutDialog(
        context: context,
        children: [
          Text(e.message
              .toString()), // Placeholder content, replace with your desired text
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.grey[300],
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  restrat_password_title(),
                  SizedBox(height: 10),
                  restart_password_field(emailController: emailController),
                  SizedBox(height: 10),
                  restart_password_button()
                ]),
          ),
        ),
      ),
    );
  }

  Container restart_password_button() {
    return Container(
      child: OutlinedButton(
        child: Text('Şifreyi sıfırla'),
        onPressed: password_sifirla,
      ),
    );
  }
}
