import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:surokkha/responsive/responsive_layout.dart';
import 'package:surokkha/screens/login_screen.dart';
import 'package:surokkha/screens/mobile_screenholder.dart';
import 'package:surokkha/screens/web_screenholder.dart';
import 'package:surokkha/services/auth_services/auth_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => ResponsiveLayout(
                  mobileScreen: AuthService().checkAuth()
                      ? MobieScreenHolder()
                      : LoginScreen(),
                  webScreen: AuthService().checkAuth()
                      ? const WebScreenHolder()
                      : LoginScreen(),
                )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height:
                    MediaQuery.of(context).size.width >= 700 ? 150.h : 230.h,
                width: MediaQuery.of(context).size.width >= 700 ? 150.w : 230.w,
                child: const Image(
                  image: AssetImage('assets/gov_logo.png'),
                )),
            const SizedBox(
              height: 20,
            ),
            LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.green, size: 50),
          ],
        ),
      ),
    );
  }
}
