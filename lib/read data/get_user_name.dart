import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Get_User_Name extends StatefulWidget {
  final String documentId;
  const Get_User_Name({required this.documentId});

  @override
  State<Get_User_Name> createState() => _Get_User_NameState();
}

class _Get_User_NameState extends State<Get_User_Name> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('user');
    //Firebase veriyi almak için var
    return FutureBuilder<DocumentSnapshot>(
      //future nerdeki veriyi çekmek istediğimiz söyleriz
      future: users.doc(widget.documentId).get(),
      builder: (context, snapshot) {
        // veri var mı diye sorarız
        if (snapshot.hasData) {
          //Map ile veriyi çekeriz
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          //Text ile yazarız
          return Text(data['first name'] +
              ' ' +
              data['last name'] +
              ' ' +
              data['age'].toString() +
              ' yaşında sınız');
        }
        return Text('Loading...');
      },
    );
  }
}
