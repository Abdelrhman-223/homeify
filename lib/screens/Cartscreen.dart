import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeify/StaticJsonFiles/products.dart';
import 'package:homeify/StaticJsonFiles/user_orders.dart';
import 'package:homeify/utils/images.dart';

import '../StaticJsonFiles/user_cart.dart';
import '../controllers/Cartscreencontroller.dart';
import '../widgets/bottomnavbar.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
            return ListView.builder(
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
      floatingActionButton: MaterialButton(
        onPressed: () {
          setState(() {
            userOrders.addAll(userCart);
            userCart.clear();
          });
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
      ),
    );
  }
}
