import 'package:flutter/material.dart';

//tekrarpasswordController
class register_password_text_field extends StatelessWidget {
  const register_password_text_field({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Password'),
            ),
          )),
    );
  }
}

class register_tekar_password_text_field extends StatelessWidget {
  const register_tekar_password_text_field({
    super.key,
    required this.tekrarpasswordController,
  });

  final TextEditingController tekrarpasswordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextField(
              controller: tekrarpasswordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Tekrar Password'),
            ),
          )),
    );
  }
}
