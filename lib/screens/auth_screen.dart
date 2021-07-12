import 'package:chat_app/widgets/form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  void submitFunction(
     String username,
    String email,
    String password,
    bool haveAccount,
    BuildContext cnxt,
  ) async {
    try {
      if (haveAccount) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } on PlatformException catch (error) {
      dynamic message = 'Something went wrong!';

      if (error.message != null) {
        message = error.message;
      }
      ScaffoldMessenger.of(cnxt).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ));
    } catch (error) {
      print("error $error");
    
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: FormInput(submitFunction));
  }
}
