import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeify/StaticJsonFiles/products.dart';
import 'package:homeify/controllers/products_controller.dart';
import 'package:homeify/utils/dividers.dart';
import 'package:homeify/widgets/add_to_cart_button.dart';
import 'package:homeify/widgets/pick_product_color.dart';

import '../screens/ProductViewscreen.dart';

class ProductField extends StatefulWidget {
  const ProductField({super.key, required this.productId});

  final int productId;

  @override
  State<ProductField> createState() => _ProductFieldState();
}

class _ProductFieldState extends State<ProductField> {
  int _counter = 0;
  bool buttonActivation = false;

  increaseCounter() {
    _counter++;
    buttonActivation = true;
  }

  decreaseCounter() {
    if (_counter > 0) {
      _counter--;
    } else {
      buttonActivation = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductViewScreen(
          productId: widget.productId,
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage(
                    products[widget.productId]["product_image"],
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  products[widget.productId]["product_name"],
                ),
              ),
            ),
            Text(
              "${products[widget.productId]["product_price"]}\$",
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      decreaseCounter();
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "-",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Text(_counter.toString()),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      increaseCounter();
                    });
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      "+",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            spaceVertical16(),
            PickProductColor(
                colorWidth: 10, productColors: products[widget.productId]["product_colors"]),
            spaceVertical8(),
            GetBuilder<ProductsController>(
              init: ProductsController(),
              builder: (productsController) {
                return AddToCartButton(
                  productId: widget.productId,
                  userId: 1,
                  piecesNumber: _counter,
                  productColor: productsController.productPickedColor,
                  buttonActivation: buttonActivation,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
