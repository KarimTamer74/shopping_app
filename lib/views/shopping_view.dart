
import 'package:chatapp/helper/home_page_ui.dart';
import 'package:chatapp/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class ShoppingView extends StatelessWidget {
  ShoppingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color(0xFF03184C),
          elevation: 0,
          title: const Text(
            'New Trend',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Playfair_Display',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: IconButton(
                  onPressed: () {},
                  icon: IconButton(
                    tooltip: 'Cart',
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                  )),
            )
          ],
        ),
        body: HomePageUI());
  }
}
