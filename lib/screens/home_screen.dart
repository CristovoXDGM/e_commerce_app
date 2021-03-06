import 'package:flutter/material.dart';
import 'package:loja_virtual_app/tabs/categories_tab.dart';
import 'package:loja_virtual_app/tabs/home_ui.dart';
import 'package:loja_virtual_app/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          drawer: CustomDrawer(
            pageController: _pageController,
          ),
          body: HomeTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Categorias"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(
            pageController: _pageController,
          ),
          body: CategoriesTab(),
        ),
      ],
    );
  }
}
