import 'package:flutter/material.dart';

class CustomSubmit extends StatefulWidget {
  CustomSubmit({super.key, required this.text, this.onTap});
  String text;
  VoidCallback? onTap;

  @override
  State<CustomSubmit> createState() => _CustomSubmitState();
}

class _CustomSubmitState extends State<CustomSubmit> {
  Widget? screen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white60,
        ),
        margin: EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.login_outlined),
            Text(
              widget.text,
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 1, 46, 52)),
            ),
          ],
        ),
      ),
    );
  }
}
