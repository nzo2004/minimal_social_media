import 'package:flutter/material.dart';
import 'package:clone_app/view/register_view/register_view.dart';

class register_dont_have_an_account extends StatelessWidget {
  const register_dont_have_an_account({
    super.key,
    required this.widget,
  });

  final Register_View widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hesabınız var mı?',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        InkWell(
          child: Text(
            'Giriş Yap',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          onTap: widget.showLogindBack,
        ),
      ],
    );
  }
}
