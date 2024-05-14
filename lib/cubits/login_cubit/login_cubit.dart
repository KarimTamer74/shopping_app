import 'package:shoppingapp/cubits/login_cubit/login_states.dart';
import 'package:shoppingapp/helper/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialState());

  Future<void> userLogin({required email, required password}) async {
    emit(LoginLoadingState());
    try {
      final auth = FirebaseAuth.instance;
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found')
        emit(LoginFailureState('user-not-found'));
      else if (e.code == 'wrong-password')
        emit(LoginFailureState('wrong-password'));
    } catch (e) {
      emit(LoginFailureState('Something went wrong'));
    }
  }
}
