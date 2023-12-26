import 'package:flutter/material.dart';

class restrat_password_title extends StatelessWidget {
  const restrat_password_title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        'Hangi mail adresindeki şifresini yenileyelim',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
