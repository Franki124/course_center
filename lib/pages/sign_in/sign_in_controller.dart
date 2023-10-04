import 'package:course_center/common/widgets/flutter_toast.dart';
import 'package:course_center/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: 'Please provide email address', backgroundColor: Colors.red);
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: 'Please provide password', backgroundColor: Colors.red);
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if(credential.user == null) {
            toastInfo(msg: "User doesn't exist", backgroundColor: Colors.red);
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "User is not verified", backgroundColor: Colors.red);
            return;
          }

          var user = credential.user;
          if(user != null) {
            toastInfo(msg: 'User exist', backgroundColor: Colors.green);
            return;
          } else {
            toastInfo(msg: "No user", backgroundColor: Colors.red);
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: 'No user found for that email', backgroundColor: Colors.red);
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'Wrong password provided for that user', backgroundColor: Colors.red);
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: 'Please provide a valid email address', backgroundColor: Colors.red);
          }
        }
      }
    } catch (e) {
      toastInfo(msg: e.toString(), backgroundColor: Colors.red);
    }
  }
}
