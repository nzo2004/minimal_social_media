import 'package:flutter/material.dart';

class register_age_text_field extends StatelessWidget {
  const register_age_text_field({
    super.key,
    required this.ageController,
  });

  final TextEditingController ageController;

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
              controller: ageController,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'age'),
            ),
          )),
    );
  }
}
