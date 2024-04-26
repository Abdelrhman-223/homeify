import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeify/controllers/user_data_controller.dart';
import 'package:homeify/screens/OrdersScreen.dart';
import 'package:homeify/utils/dividers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/bottomnavbar.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: SafeArea(
        child: GetBuilder<UserDataController>(
          init: UserDataController(),
          builder: (controller) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                  ),
                  Text(
                    controller.username,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    controller.email,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    controller.phoneNumber,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    controller.address,
                    style: const TextStyle(
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
              ),
            );
          }
        ),
      ),
    );
  }
}
