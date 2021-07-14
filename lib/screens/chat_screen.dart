import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Firebase.initializeApp();
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chats/86YiRN2ByrCq6TWvMnvB/messages')
            .snapshots(),
        builder: (context, snapshot) {
          final document = snapshot.data!.docs;
          return ListView.builder(
              itemCount: document.length,
              itemBuilder: (context, index) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: Text(document[index]['text']),
                );
              });
        },
      ),
     
    );
  }
}
