import 'package:chatapp/constants/constants.dart';
import 'package:chatapp/cubits/login_cubit/login_cubit.dart';
import 'package:chatapp/cubits/login_cubit/login_states.dart';
import 'package:chatapp/helper/helper.dart';
import 'package:chatapp/widgets/custom_submit.dart';
import 'package:chatapp/widgets/custom_title.dart';
import 'package:chatapp/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  bool isLoading = false; //to show loading indicator if network was slow

  String? email,
      password; // to accept email and pass from user and create an account

  GlobalKey<FormState> formKey =
      GlobalKey(); //to use Form() widget and validate TextFormField()

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginSuccessState) {
          isLoading = false;
          showSnackBar(context, 'Successfully logined ✔️');
          Navigator.pushNamed(context, 'ShoppingView', arguments: email);
        } else if (state is LoginFailureState) {
          isLoading = false;
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          //ModalProgressHUD >>- packdge to show loading indicator
          inAsyncCall: isLoading, // required with ModalProgressHUD
          child: Scaffold(
            backgroundColor: Color.fromRGBO(4, 24, 40, 1),
            body: Form(
              key: formKey, //required with Form()
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ListView(children: [
                  SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        kLogo,
                        scale: 4.5,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Shopping App',
                      style: TextStyle(
                        color: Color.fromARGB(236, 176, 203, 216),
                        fontSize: 24,
                        fontFamily: 'Pacifico-Regular',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TitleWidget(title: 'Login'),
                  CustomTextFormField(
                    obscureText: false,
                    hint: 'Enter your Email',
                    onChanged: (data) {
                      email = data;
                    },
                  ),
                  CustomTextFormField(
                    obscureText: true,
                    hint: 'Enter your Password',
                    onChanged: (data) {
                      password = data;
                    },
                  ),
                  CustomSubmit(
                      text: '  Sign in',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          BlocProvider.of<LoginCubit>(context)
                              .userLogin(email: email!, password: password!);
                        }
                      }),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      'don\'t have an account?  ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'RegisterPage');
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Color(0xFF2196F3)),
                      ),
                    )
                  ]),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
