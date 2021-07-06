import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class FormInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Neumorphic(
          style: NeumorphicStyle(
              color: Colors.white, boxShape: NeumorphicBoxShape.stadium()),
          margin: EdgeInsets.only(top: 20),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "username",
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        ),
        Neumorphic(
          style: NeumorphicStyle(
              color: Colors.white, boxShape: NeumorphicBoxShape.stadium()),
          margin: EdgeInsets.only(top: 20),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "email",
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        ),
        Neumorphic(
          style: NeumorphicStyle(
              color: Colors.white, boxShape: NeumorphicBoxShape.stadium()),
          margin: EdgeInsets.only(top: 20),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "password",
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
            ),
          ),
        )
      ],
    ));
  }
}
