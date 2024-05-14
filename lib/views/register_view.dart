import 'package:chatapp/constants/constants.dart';
import 'package:chatapp/helper/helper.dart';
import 'package:chatapp/widgets/custom_submit.dart';
import 'package:chatapp/widgets/custom_title.dart';
import 'package:chatapp/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? email;

  String? password;

  String? rewritePass;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: false,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Create account',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2196F3)),
                  ),
                ),
                Text(
                  'Please enter your details',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 30,
                ),
                TitleWidget(title: 'Your email'),
                CustomTextFormField(
                  obscureText: false,
                  hint: 'Enter your email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TitleWidget(title: 'Password'),
                CustomTextFormField(
                  obscureText: true,
                  hint: 'Enter your password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TitleWidget(title: 'Rewrite password'),
                CustomTextFormField(
                  obscureText: true,
                  hint: 'Rewrite password',
                  onChanged: (data) {
                    rewritePass = data;
                  },
                ),
                CustomSubmit(
                    text: '  Register',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          if (rewritePass == password) {
                            await userRigester();
                            showSnackBar(context, 'Successfully registered ✔️');
                            Navigator.pop(context);
                          } else
                            showSnackBar(
                                context, 'Please write the same password.');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password')
                            showSnackBar(
                                context, 'The password provided is too weak.');
                          else if (e.code == 'email-already-in-use')
                            showSnackBar(context,
                                'The account already exists for that email.');
                        } catch (e) {
                          showSnackBar(context, 'Error, Please try again');
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 238, 241, 243)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'LoginPage');
                      },
                      child: Text(
                        'Login',
                        style:
                            TextStyle(color: Color(0xFF2196F3), fontSize: 16),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> userRigester() async {
    final auth = FirebaseAuth.instance;

    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
    ();
  }
}
