import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:homeify/screens/Homescreen.dart';
import 'package:homeify/utils/dividers.dart';

import '../controllers/Loginscreencontroller.dart';
import '../utils/images.dart';
import '../widgets/bottomnavbar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: GetBuilder<LoginScreenController>(
              init: LoginScreenController(),
              builder: (controller) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const Alignment(-1, -1),
                        child: SvgPicture.asset(AppImages.overlay1),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppImages.homeifyLogo),
                            spaceVertical64(),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Username",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 4,
                                    offset: const Offset(2, 2),
                                    blurStyle: BlurStyle.outer,
                                  ),
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 4,
                                    offset: const Offset(2, 2),
                                    blurStyle: BlurStyle.inner,
                                  ),
                                ],
                              ),
                              child: TextField(
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.name,
                                controller: usernameController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.black,
                                ),
                              ),
                            ),
                            spaceVertical16(),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Password",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 4,
                                    offset: const Offset(2, 2),
                                    blurStyle: BlurStyle.outer,
                                  ),
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 4,
                                    offset: const Offset(2, 2),
                                    blurStyle: BlurStyle.inner,
                                  ),
                                ],
                              ),
                              child: TextField(
                                cursorColor: Colors.black,
                                obscureText: true,
                                controller: passwordController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.black,
                                ),
                              ),
                            ),
                            spaceVertical16(),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Email",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 4,
                                    offset: const Offset(2, 2),
                                    blurStyle: BlurStyle.outer,
                                  ),
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 4,
                                    offset: const Offset(2, 2),
                                    blurStyle: BlurStyle.inner,
                                  ),
                                ],
                              ),
                              child: TextField(
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.black,
                                ),
                              ),
                            ),
                            spaceVertical16(),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Phone Number",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 4,
                                    offset: const Offset(2, 2),
                                    blurStyle: BlurStyle.outer,
                                  ),
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 4,
                                    offset: const Offset(2, 2),
                                    blurStyle: BlurStyle.inner,
                                  ),
                                ],
                              ),
                              child: TextField(
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.phone,
                                controller: phoneNumberController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.black,
                                ),
                              ),
                            ),
                            spaceVertical16(),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Address",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 4,
                                    offset: const Offset(2, 2),
                                    blurStyle: BlurStyle.outer,
                                  ),
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 4,
                                    offset: const Offset(2, 2),
                                    blurStyle: BlurStyle.inner,
                                  ),
                                ],
                              ),
                              child: TextField(
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.streetAddress,
                                controller: addressController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  fillColor: Colors.black,
                                ),
                              ),
                            ),
                            spaceVertical32(),
                            InkWell(
                              onTap: () {
                                Get.to(HomeScreen());
                              },
                              child: Container(
                                height: 40,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                    child: Text("Sign Up", style: TextStyle(color: Colors.white))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
