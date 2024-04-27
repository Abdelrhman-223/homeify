import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:homeify/screens/Homescreen.dart';
import 'package:homeify/screens/Loginscreen.dart';
import 'package:homeify/utils/images.dart';
import '../controllers/Splashscreencontroller.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        if (sharedPreferences.containsKey("loggedIn")) {
          Get.off(sharedPreferences.getBool("loggedIn")!?const HomeScreen():LoginScreen());
        } else {
          Get.off(LoginScreen());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: GetBuilder<SplashScreenController>(
            init: SplashScreenController(),
            builder: (controller) {
              return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.homeifyLogo),
                    ],
                  ));
            },
          ),
        ),
      ),
    );
  }
}
