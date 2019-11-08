import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot docSnap;

  const CategoryTile({Key key, this.docSnap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(docSnap.data['title']),
      trailing: Icon(Icons.keyboard_arrow_right),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(docSnap.data['icon']),
      ),
    );
  }
}
