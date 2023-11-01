import 'package:course_center/common/values/colors.dart';
import 'package:course_center/pages/application/application_page.dart';
import 'package:course_center/pages/bloc_providers.dart';
import 'package:course_center/pages/register/register.dart';
import 'package:course_center/pages/sign_in/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: AppColors.primaryText,
              ),
              elevation: 0,
              backgroundColor: Colors.white
            )
          ),
          home: const ApplicationPage(),
          routes: {
            'signIn': (context) => const SignIn(),
            'register' : (context) => const Register(),
          },
        ),
      ),
    );
  }
}

