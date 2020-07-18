import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = 'chet-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          DropdownButton(
            items: [
              DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Logout')
                      ],
                    ),
                  ))
            ],
            onChanged: (newValue) {
              if (newValue == 'logout') {
                FirebaseAuth.instance.signOut();
              }
            },
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
          )
        ],
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection('chats/kw7wK1D1KqJVdX4pmVyy/messages')
              .snapshots(),
          builder: (context, streamSnapshot) {
            if (streamSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            final documents = streamSnapshot.data.documents;
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, i) => Text(documents[i]['text']),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Firestore.instance
              .collection('chats/kw7wK1D1KqJVdX4pmVyy/messages')
              .add({
            'text': 'Hi! from Cameroon',
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
