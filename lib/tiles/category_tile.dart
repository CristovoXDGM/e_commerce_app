import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual_app/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {
  final DocumentSnapshot docSnap;

  const CategoryTile({Key key, this.docSnap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryScreen(
                  snapshot: docSnap,
                )));
      },
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
