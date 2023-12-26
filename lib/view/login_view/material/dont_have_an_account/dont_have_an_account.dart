import 'package:clone_app/view/login_view/login_view.dart';
import 'package:flutter/material.dart';

class dont_have_an_account extends StatelessWidget {
  const dont_have_an_account({
    super.key,
    required this.widget,
  });

  final Login_View widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hesabınız var mı?',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          child: Text(
            'Kayıt Ol',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          onTap: widget.showRegisterdBack,
        ),
      ],
    );
  }
}
