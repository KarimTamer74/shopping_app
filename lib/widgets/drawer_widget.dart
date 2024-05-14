import 'package:shoppingapp/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        
        backgroundColor: Color(0xFF041828),
        child: ListView(children: [
          DrawerHeader(
              child: Padding(
            padding: const EdgeInsets.only(left: 2, right: 2),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Color.fromARGB(255, 240, 240, 233),
                    )),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Shopping App',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    // fontFamily: 'Playfair_Display',
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                // Image.asset(
                //   'assets/App-Store-Logo.png',
                //   scale: 65,
                // )
              ],
            ),
          )),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTileWidget(icon: Icons.home, text: 'Home')),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, 'favorites');
              },
              child: ListTileWidget(
                icon: Icons.favorite,
                text: 'Favorites',
              )),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'account');
              },
              child: ListTileWidget(
                icon: Icons.account_box,
                text: 'Account',
              )),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, 'favorites');
              },
              child: ListTileWidget(
                icon: Icons.logout,
                text: 'Sign out',
              )),
        ]));
  }
}
