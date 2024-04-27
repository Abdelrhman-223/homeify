import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeify/screens/OrdersScreen.dart';
import 'package:homeify/utils/dividers.dart';
import 'package:homeify/widgets/dialogwidget.dart';
import '../main.dart';
import '../widgets/bottomnavbar.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  TextEditingController complainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: SafeArea(
        child: Container(
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
                sharedPreferences.getString("username")!,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                sharedPreferences.getString("email")!,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                sharedPreferences.getString("phoneNumber")!,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                sharedPreferences.getString("address")!,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              spaceVertical64(),
              MaterialButton(
                onPressed: () {
                  Get.to(const OrdersScreen());
                },
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
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
                onPressed: () {
                  DialogBuilder(
                    context,
                    [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Complain Note",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      spaceVertical8(),
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
                          controller: complainController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.black,
                          ),
                        ),
                      ),
                      spaceVertical16(),
                      GestureDetector(
                        onTap: () {
                          if(complainController.text != "") {
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            "Send Complain",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
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
        ),
      ),
    );
  }
}
