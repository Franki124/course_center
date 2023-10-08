import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';
import '../sign_in/bloc/sign_in_blocs.dart';
import '../sign_in/bloc/sign_in_events.dart';
import '../sign_in/bloc/signin_states.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar('Sign up'),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Center(
                      child: reusableText(
                          'Enter your details below and free sign up')),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('User name'),
                        buildTextField('Enter your username', 'name', 'user',
                            (value) {
                          context.read()<SignInBloc>().add(EmailEvent(value));
                        }),
                        reusableText('Email'),
                        buildTextField(
                            'Enter your email address', 'email', 'user',
                            (value) {
                          context.read()<SignInBloc>().add(EmailEvent(value));
                        }),
                        reusableText('Password'),
                        buildTextField(
                            'Enter your password', 'password', 'lock', (value) {
                          context
                              .read()<SignInBloc>()
                              .add(PasswordEvent(value));
                        }),
                        reusableText('Confirm Password'),
                        buildTextField(
                            'Re-enter your password', 'password', 'lock',
                            (value) {
                          context
                              .read()<SignInBloc>()
                              .add(PasswordEvent(value));
                        }),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 25.w),
                    child: reusableText(
                        'Enter your details below and free sign up'),
                  ),
                  buildLogInAndRegButton('Sign up', 'login', () {
                    Navigator.of(context).pushNamed('register');
                  }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
