import 'package:course_center/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:course_center/pages/sign_in/bloc/sign_in_event.dart';
import 'package:course_center/pages/sign_in/bloc/signin_states.dart';
import 'package:course_center/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildThirdPartyLogin(context),
                  Center(
                      child: reusableText('Or use your email account login')),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('Email'),
                        SizedBox(height: 5.h),
                        buildTextField(
                            'Enter your email address', 'email', 'user',
                            (value) {
                          context.read()<SignInBloc>().add(EmailEvent(value));
                        }),
                        reusableText('Password'),
                        SizedBox(height: 5.h),
                        buildTextField(
                            'Enter your password', 'password', 'lock', (value) {
                          context
                              .read()<SignInBloc>()
                              .add(PasswordEvent(value));
                        }),
                      ],
                    ),
                  ),
                  forgotPassword(),
                  buildLogInAndRegButton('Log In', 'login'),
                  buildLogInAndRegButton('Register', 'register'),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
