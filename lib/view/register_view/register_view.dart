import 'package:clone_app/view/register_view/material/do_have_an_account/do_have_an_account.dart';
import 'package:clone_app/view/register_view/material/field/age_text_field/age_text_field.dart';
import 'package:clone_app/view/register_view/material/field/email_text_field/email_text_field.dart';
import 'package:clone_app/view/register_view/material/field/name_text_field/name_text_field.dart';
import 'package:clone_app/view/register_view/material/field/passwrod_text_field/passwrod_text_field.dart';
import 'package:clone_app/view/register_view/material/field/surname_text_field/surname_text_field.dart';
import 'package:clone_app/view/register_view/material/title/register_title.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register_View extends StatefulWidget {
  final VoidCallback showLogindBack;

  const Register_View({super.key, required this.showLogindBack});

  @override
  State<Register_View> createState() => _Register_ViewState();
}

class _Register_ViewState extends State<Register_View> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController tekrarpasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    tekrarpasswordController.dispose();
    nameController.dispose();
    surnameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (tekrarSifre()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());

      kullaniciKayit(nameController.text.trim(), surnameController.text.trim(),
          emailController.text.trim(), int.parse(ageController.text.trim()));
    }
  }

  Future kullaniciKayit(
      String firstname, String lastname, String email, int age) async {
    await FirebaseFirestore.instance.collection('user').doc().set({
      'first name': firstname,
      'last name': lastname,
      'email': email,
      'age': age
    });
  }

  bool tekrarSifre() {
    if (passwordController.text.trim() ==
        tekrarpasswordController.text.trim()) {
      tekrarpasswordController.text.trim();
      return true;
    } else {
      return false;
    }
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
                register_title(),
                //Email TextField
                register_email_text_field(emailController: emailController),
                SizedBox(
                  height: 10,
                ),
                register_name_text_field(nameController: nameController),
                SizedBox(
                  height: 10,
                ),
                register_surname_text_field(
                    surnameController: surnameController),
                SizedBox(
                  height: 10,
                ),
                register_age_text_field(ageController: ageController),
                SizedBox(
                  height: 10,
                ),
                //Password TextField
                register_password_text_field(
                    passwordController: passwordController),
                SizedBox(
                  height: 10,
                ),
                //Tekrar Password TextField

                register_tekar_password_text_field(
                    tekrarpasswordController: tekrarpasswordController),
                SizedBox(
                  height: 10,
                ),
                //Kayıt Buttonu
                register_button(),
                SizedBox(
                  height: 20,
                ),
                //Hesabınız yok mu
                //dont_have_an_account()
                register_dont_have_an_account(widget: widget)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container register_button() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: GestureDetector(
          onTap: () {
            signUp();
          },
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                'Kayıt Ol',
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
