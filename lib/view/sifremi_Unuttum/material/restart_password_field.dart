import 'package:flutter/material.dart';

class restart_password_field extends StatelessWidget {
  const restart_password_field({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

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
              controller: emailController,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Email'),
            ),
          )),
    );
  }
}
