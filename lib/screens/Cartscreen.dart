import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeify/StaticJsonFiles/products.dart';
import 'package:homeify/StaticJsonFiles/user_orders.dart';
import 'package:homeify/main.dart';
import 'package:homeify/utils/images.dart';

import '../StaticJsonFiles/user_cart.dart';
import '../controllers/Cartscreencontroller.dart';
import '../utils/dividers.dart';
import '../widgets/bottomnavbar.dart';
import '../widgets/dialogwidget.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController confirmAddressController = TextEditingController();

  String paymentType = "cash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: GetBuilder<CartScreenController>(
          init: CartScreenController(),
          builder: (controller) {
            return (userCart.isEmpty)
                ? const Center(
                    child: Text("Cart is Empty, add some products to the cart"),
                  )
                : ListView.builder(
                    itemCount: userCart.length,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Container(
                          width: 150,
                          height: 100,
                          margin: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                products[userCart[index]["product_id"]]["product_image"],
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[userCart[index]["product_id"]]["product_name"],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "No.Pieces: ${userCart[index]["pieces_number"]}",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "${products[userCart[index]["product_id"]]["product_price"] * userCart[index]["pieces_number"]}\$",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Color.fromRGBO(
                                  userCart[index]["product_color"][0],
                                  userCart[index]["product_color"][1],
                                  userCart[index]["product_color"][2],
                                  1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: userCart.isNotEmpty
          ? MaterialButton(
              onPressed: () {
                confirmAddressController.text = sharedPreferences.getString("address")!;
                if (userCart.isNotEmpty) {
                  DialogBuilder(context, [
                    StatefulBuilder(
                      builder: (context, setState) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Confirm Address",
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
                              controller: confirmAddressController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.black,
                              ),
                            ),
                          ),
                          spaceVertical32(),
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    paymentType = "cash";
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: (paymentType == "cash") ? Colors.black : Colors.black45,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    "Pay Cash",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    paymentType = "online";
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    color:
                                        (paymentType == "online") ? Colors.black : Colors.black45,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Text(
                                    "Pay Online",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          spaceVertical16(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (confirmAddressController.text != "") {
                                  userOrders.addAll(userCart);
                                  userCart.clear();
                                  Navigator.pop(context);
                                }
                              });
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
                                "Confirm",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]);
                }
              },
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: const Text(
                "Order Products",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )
          : null,
    );
  }
}
