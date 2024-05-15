import 'package:shoppingapp/cubits/login_cubit/login_cubit.dart';
import 'package:shoppingapp/views/add_product.dart';
import 'package:shoppingapp/views/login_view.dart';
import 'package:shoppingapp/views/onboarding_view.dart';
import 'package:shoppingapp/views/register_view.dart';
import 'package:shoppingapp/views/shopping_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
        routes: {
          'OnBoardingView': (context) => OnBoardingView(),
          'LoginPage': (context) => LoginPage(),
          'RegisterPage': (context) => RegisterPage(),
          'ShoppingView': (context) => ShoppingView(),
          'AddProduct': (context) => AddProduct(),
        },
        initialRoute: 'OnBoardingView',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
