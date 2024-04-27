/*
* اضافة ياقي خطوات الطلب من حيث تأكيد العنوان وتحديد طريقة الدفع
* صفحة شكر للدفع
*
* */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeify/StaticJsonFiles/user_orders.dart';
import '../StaticJsonFiles/products.dart';
import '../controllers/Cartscreencontroller.dart';
import '../widgets/bottomnavbar.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Orders",
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
              itemCount: userOrders.length,
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
                          products[userOrders[index]["product_id"]]["product_image"],
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products[userOrders[index]["product_id"]]["product_name"],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "No.Pieces: ${userOrders[index]["pieces_number"]}",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "${products[userOrders[index]["product_id"]]["product_price"] * userOrders[index]["pieces_number"]}\$",
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        DateTime.now().toString().substring(0, 10),
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Color.fromRGBO(
                            userOrders[index]["product_color"][0],
                            userOrders[index]["product_color"][1],
                            userOrders[index]["product_color"][2],
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
    );
  }
}
