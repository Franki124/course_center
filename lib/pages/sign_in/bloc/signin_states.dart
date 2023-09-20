import 'package:course_center/pages/sign_in/bloc/sign_in_event.dart';

class SignInState {
  final String email;
  final String password;

  const SignInState({this.email = '', this.password = ''});

  SignInState copyWith({
  String? email, String? password
}) {
    return SignInState(
      email: email??this.email,
      password: password??this.password
    );
  }
}