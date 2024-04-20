import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeify/utils/images.dart';

import '../controllers/Cartscreencontroller.dart';
import '../widgets/bottomnavbar.dart';

class OrdersScreen extends StatefulWidget {
  OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Widget> cartProducts = [
    Row(
      children: [
        Container(
          width: 150,
          height: 100,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                AppImages.house1,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product Name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Order Date",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Price",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Reach Date",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    ),
    Row(
      children: [
        Container(
          width: 150,
          height: 100,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                AppImages.house1,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product Name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Order Date",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Price",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Reach Date",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    ),
    Row(
      children: [
        Container(
          width: 150,
          height: 100,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                AppImages.house1,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product Name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Order Date",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Price",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              "Reach Date",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ],
    ),
  ];

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
              itemCount: cartProducts.length,
              itemBuilder: (context, index) => cartProducts[index],
            );
          },
        ),
      ),
    );
  }
}
