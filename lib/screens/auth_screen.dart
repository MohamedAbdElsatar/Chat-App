import 'package:chat_app/widgets/form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AuthScreen extends StatelessWidget {
  void submitFunction(
      String email, String username, String password, bool isLogIn) {
    print(email);
    print(username);
    print(password);
    print(isLogIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FormInput(submitFunction));
  }
}
