import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   // Firebase.initializeApp();
    return Scaffold(
      floatingActionButton: FloatingActionButton( 
        child: Icon(Icons.add),
        onPressed: (){
        
      }),
    );
  }
}