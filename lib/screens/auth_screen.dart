import 'package:chat_app/widgets/buttons_sign.dart';
import 'package:chat_app/widgets/form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purpleAccent,
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: SafeArea(
          minimum: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/images/avataruser.jpg'),
                  ),
                 FormInput(),
                  SizedBox(height: 30),
                 Buttons()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
