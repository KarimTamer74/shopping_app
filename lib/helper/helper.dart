import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: const Color.fromARGB(96, 158, 158, 158),
      content: Center(child: Text(message)),
    ),
  );
}

// Future<void> userRegister() async {
//   final auth = FirebaseAuth.instance;

//   UserCredential credential = await auth.createUserWithEmailAndPassword(
//       email: email!, password: password!);
// }
 