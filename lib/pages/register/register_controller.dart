import 'package:course_center/common/widgets/flutter_toast.dart';
import 'package:course_center/pages/register/bloc/register_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: 'User name can not be empty');
      return;
    }

    if (email.isEmpty) {
      toastInfo(msg: 'Email can not be empty');
      return;
    }

    if (password.isEmpty) {
      toastInfo(msg: 'Password can not be empty');
      return;
    }

    if (rePassword.isEmpty) {
      toastInfo(msg: 'Your password confirmation is wrong');
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: 'An email has been send to your registered email address. To activate it please check your email box and click in the link.');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(
            msg: 'The password provided is too weak',
            backgroundColor: Colors.red);
      } else if (e.code == 'email-already-in-use') {
        toastInfo(
            msg: 'The email is already in use', backgroundColor: Colors.red);
      } else if (e.code == 'Your email address is invalid') {
        toastInfo(
            msg: 'The email is already in use', backgroundColor: Colors.red);
      }
    }
  }
}
