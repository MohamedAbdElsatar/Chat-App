import 'package:chat_app/widgets/form_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var isloading = false;
  FirebaseAuth instance = FirebaseAuth.instance;
  void submitFunction(
    String username,
    String email,
    String password,
    bool haveAccount,
    BuildContext conxt,
  ) async {
    UserCredential authResult;
    try {
      setState(() {
        isloading = true;
      });
      if (haveAccount) {
        authResult = await instance.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await instance.createUserWithEmailAndPassword(
            email: email, password: password);
            //FirebaseFirestore.instance.add generate random id 
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(authResult.user!.uid)
            .set({'email': email, 'username': username});
      }
    } on PlatformException catch (error) {
      dynamic message = 'Something went wrong!';

      if (error.message != null) {
        message = error.message;
      }
      print(message);
      ScaffoldMessenger.of(conxt).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ));
    } catch (error) {
      print("error $error");
    } finally {
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormInput(isloading, submitFunction),
    );
  }
}
