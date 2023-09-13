import 'package:course_center/pages/welcome/bloc/welcome_blocs.dart';
import 'package:course_center/pages/welcome/bloc/welcome_events.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/welcome_states.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    onPageChanged: (index){
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                          1,
                          context,
                          'Next',
                          'First See Learning',
                          'Forget about paper for a moment, all knowledge in one learning',
                          'image 1'),
                      _page(
                          2,
                          context,
                          'Next',
                          'Connect With Everyone',
                          "Always keep in touch with you tutor & friend. Let's get connected",
                          'image 2'),
                      _page(
                          3,
                          context,
                          'Get Started',
                          'Always fascinated Learning',
                          'Anywhere, anytime. The time is at our control',
                          'image 3'),
                    ],
                  ),
                  Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        size: Size.square(8.0),
                        activeSize: Size(20.0, 8.0),
                        activeColor: Colors.blue,
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Text(imagePath),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 18.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(15.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ]),
          child: Center(
            child: Text(buttonName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.normal)),
          ),
        )
      ],
    );
  }
}
