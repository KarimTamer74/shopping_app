import 'package:chatapp/cubits/login_cubit/login_cubit.dart';
import 'package:chatapp/views/login_view.dart';
import 'package:chatapp/views/onboarding_view.dart';
import 'package:chatapp/views/register_view.dart';
import 'package:chatapp/views/shopping_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

/*
karemtamerali
kemotamer448@gmail.com 
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
        routes: {
          'OnBoardingView': (context) => OnBoardingView(),
          'LoginPage': (context) => LoginPage(),
          'RegisterPage': (context) => RegisterPage(),
          'ShoppingView':(context) => ShoppingView(),
        },
        initialRoute: 'OnBoardingView',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
