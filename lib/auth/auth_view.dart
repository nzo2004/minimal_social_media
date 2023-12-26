import 'package:clone_app/view/login_view/login_view.dart';
import 'package:clone_app/view/register_view/register_view.dart';
import 'package:flutter/material.dart';

class Auth_View extends StatefulWidget {
  const Auth_View({super.key});

  @override
  State<Auth_View> createState() => _Auth_ViewState();
}

class _Auth_ViewState extends State<Auth_View> {
  bool showLoginView = true;

  void toggleShow() {
    setState(() {
      showLoginView = !showLoginView;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginView) {
      return Login_View(
        showRegisterdBack: toggleShow,
      );
    } else {
      return Register_View(showLogindBack: toggleShow);
    }
  }
}
