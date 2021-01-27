import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wee_chat/widgets/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseAuth.instance.currentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return StreamBuilder(
          stream: Firestore.instance
              .collection('chat')
              .orderBy('createAt', descending: true)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot chatSnapshot) {
            if (chatSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            final chatDocs = chatSnapshot.data.documents;

            return ListView.builder(
              reverse: true,
              itemCount: chatDocs.length,
              itemBuilder: (BuildContext context, int index) {
                return MessageBubble(
                  key: ValueKey(chatDocs[index].documentID),
                  message: chatDocs[index]['text'],
                  isMe: chatDocs[index]['uid'] == snapshot.data.uid,
                );
              },
            );
          },
        );
      },
    );
  }
}
