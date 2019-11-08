import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual_app/tiles/category_tile.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("products").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          var dividedtiles = ListTile.divideTiles(
                  tiles: snapshot.data.documents.map((f) {
                    return CategoryTile(
                      docSnap: f,
                    );
                  }).toList(),
                  color: Colors.grey,
                  context: context)
              .toList();

          return ListView(
            children: dividedtiles,
          );
        }
      },
    );
  }
}
