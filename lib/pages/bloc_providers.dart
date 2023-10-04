import 'package:course_center/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:course_center/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
    BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
    BlocProvider(lazy: false, create: (context) => SignInBloc()),
  ];
}