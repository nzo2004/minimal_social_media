import 'package:flutter/material.dart';

class register_name_text_field extends StatelessWidget {
  const register_name_text_field({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

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
              controller: nameController,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Name'),
            ),
          )),
    );
  }
}
