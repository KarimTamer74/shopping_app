import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  ListTileWidget({super.key, required this.icon, required this.text});
  IconData icon;
  String text;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          icon,
          size: 35,
          color: Colors.blueGrey,
        ),
        title: Text(
          '$text',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ));
  }
}
