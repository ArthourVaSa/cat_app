import 'package:cat_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:cat_app/src/config/config.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await Future.delayed(const Duration(seconds: 2), () {
        AppRouter.router.go(AppRouter.homeScreen);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundScaffoldColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Cat Breeds App',
                style: TextStyle(
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Avenir',
                ),
              ),
            ),
            SizedBox(
              height: 2.0.h,
            ),
            Image.asset(
              AppImages.catWelcome,
              width: 80.0.w,
            ),
            SizedBox(
              height: 2.0.h,
            ),
            const Center(
              child: CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
