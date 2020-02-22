import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual_app/datas/product_data.dart';
import 'package:loja_virtual_app/tiles/product_tile.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key key, this.snapshot}) : super(key: key);

  final DocumentSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              labelPadding: EdgeInsets.all(10),
              indicatorColor: Colors.white,
              tabs: <Widget>[Icon(Icons.grid_on), Icon(Icons.list)],
            ),
            title: Text(snapshot.data['title']),
            centerTitle: true,
          ),
          body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection("products")
                .document(snapshot.documentID)
                .collection('items')
                .getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    GridView.builder(
                        padding: EdgeInsets.all(4.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                          childAspectRatio: 0.65,
                        ),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          ProductData data = ProductData.fromDocument(
                              snapshot.data.documents[index]);
                          data.category = this.snapshot.documentID;
                          return ProductTile(
                            product: data,
                            type: "grid",
                          );
                        }),
                    ListView.builder(
                      padding: EdgeInsets.all(4),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return ProductTile(
                          type: "list",
                          product: ProductData.fromDocument(
                              snapshot.data.documents[index]),
                        );
                      },
                    )
                  ],
                );
              }
            },
          )),
    );
  }
}
