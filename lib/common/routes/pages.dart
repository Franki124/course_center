import 'package:course_center/common/routes/names.dart';
import 'package:course_center/pages/register/bloc/register_blocs.dart';
import 'package:course_center/pages/register/register.dart';
import 'package:course_center/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:course_center/pages/sign_in/sign_in.dart';
import 'package:course_center/pages/welcome/bloc/welcome_blocs.dart';
import 'package:course_center/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBloc()),
      ),
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const Welcome(),
        //bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
    ];
  }


  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings){
    if(settings.name!=null){
      var result = routes().where((element) => element.route==settings.name);
      if(result.isNotEmpty){
        return MaterialPageRoute(builder: (_)=>result.first.page, settings: settings);
      }

    }
    return MaterialPageRoute(builder: (_)=>const SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
