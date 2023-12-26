import 'package:clone_app/view/login_view/material/dont_have_an_account/dont_have_an_account.dart';
import 'package:clone_app/view/login_view/material/field/email_text_field/email_text_field.dart';
import 'package:clone_app/view/login_view/material/field/passwrod_text_field/passwrod_text_field.dart';
import 'package:clone_app/view/login_view/material/title/login_title.dart';
import 'package:clone_app/view/sifremi_Unuttum/sifremi_Unuttum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login_View extends StatefulWidget {
  final VoidCallback showRegisterdBack;
  const Login_View({super.key, required this.showRegisterdBack});

  @override
  State<Login_View> createState() => _Login_ViewState();
}

class _Login_ViewState extends State<Login_View> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // ignore: non_constant_identifier_names
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Login Title
                login_title(),
                //Email TextField
                email_text_field(emailController: emailController),
                SizedBox(
                  height: 10,
                ),
                //Password TextField
                password_text_field(passwordController: passwordController),
                SizedBox(
                  height: 10,
                ),
                //Şifremi unuttum
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return sifremi_Unuttum();
                              }));
                            },
                            child: Text(
                              'Şifre mi unuttum?',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )),
                //Giris Buttonu
                login_button(),
                SizedBox(
                  height: 20,
                ),
                //Hesabınız yok mu
                //dont_have_an_account()
                dont_have_an_account(widget: widget)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container login_button() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: GestureDetector(
          onTap: signIn,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                'Giriş Yap',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
