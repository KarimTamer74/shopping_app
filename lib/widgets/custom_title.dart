import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  TitleWidget({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Text( title,
      style: TextStyle(fontSize: 21, color: Colors.white),
    );
  }
}
