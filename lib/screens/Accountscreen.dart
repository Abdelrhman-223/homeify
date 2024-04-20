import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeify/screens/OrdersScreen.dart';
import 'package:homeify/utils/dividers.dart';

import '../controllers/Accountscreencontroller.dart';
import '../widgets/bottomnavbar.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: GetBuilder<AccountScreenController>(
            init: AccountScreenController(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                  ),
                  const Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "Phone Number",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  spaceVertical64(),
                  MaterialButton(
                    onPressed: () {
                      Get.to(OrdersScreen());
                    },
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    color: Colors.grey,
                    child: const Text(
                      "My Orders",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  spaceVertical16(),
                  MaterialButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    color: Colors.grey,
                    child: const Text(
                      "Complain",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
