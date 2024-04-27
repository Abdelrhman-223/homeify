import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:homeify/screens/Homescreen.dart';
import 'package:homeify/utils/dividers.dart';
import '../main.dart';
import '../utils/images.dart';

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

  String signUpAlert = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Container(
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
                            if (usernameController.text != "" &&
                                passwordController.text != "" &&
                                emailController.text != "" &&
                                phoneNumberController.text != "" &&
                                addressController.text != "") {
                              sharedPreferences.setString("username", usernameController.text);
                              sharedPreferences.setString("password", passwordController.text);
                              sharedPreferences.setString("email", emailController.text);
                              sharedPreferences
                                  .setString("phoneNumber", phoneNumberController.text);
                              sharedPreferences.setString("address", addressController.text);
                              sharedPreferences.setBool("loggedIn", true);
                              Get.to(const HomeScreen());
                            } else {
                              setState(() {
                                signUpAlert = "You should fill fields first.";
                              });
                            }
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
                        spaceVertical8(),
                        Text(
                          signUpAlert,
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
