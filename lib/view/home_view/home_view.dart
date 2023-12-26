import 'package:clone_app/read%20data/get_user_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home_View extends StatefulWidget {
  const Home_View({super.key});

  @override
  State<Home_View> createState() => _Home_ViewState();
}

class _Home_ViewState extends State<Home_View> {
  final user = FirebaseAuth.instance.currentUser!;

  //document ID
  List user_ID = [];

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('user')
        .orderBy(
          'age',
        )
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              user_ID.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(user.email!),
            actions: [
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
              )
            ],
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: user_ID.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Get_User_Name(documentId: user_ID[index]));
                      },
                    );
                  },
                ))
              ],
            ),
          )),
    );
  }
}
