import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = 'chet-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('chats/kw7wK1D1KqJVdX4pmVyy/messages')
            .snapshots(),
        builder: (context, streamSnapshot) => ListView.builder(
          itemCount: streamSnapshot.data.documents.length,
          itemBuilder: (context, i) => Text('Hello'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
