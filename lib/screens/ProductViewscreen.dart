import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeify/StaticJsonFiles/products.dart';
import 'package:homeify/utils/dividers.dart';

import '../controllers/ProductViewscreencontroller.dart';
import '../controllers/products_controller.dart';
import '../widgets/add_to_cart_button.dart';
import '../widgets/modelviewer.dart';
import '../widgets/bottomnavbar.dart';
import '../widgets/pick_product_color.dart';

class ProductViewScreen extends StatefulWidget {
  ProductViewScreen({super.key, required this.productId});

  final int productId;

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
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
    return Scaffold(
      bottomNavigationBar: MyBottomNavigationBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: GetBuilder<ProductViewScreenController>(
            init: ProductViewScreenController(),
            builder: (controller) {
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      height: 260,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(25),
                        ),
                        image: DecorationImage(
                          image: AssetImage(products[widget.productId]["product_image"]),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    spaceVertical16(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          products[widget.productId]["product_name"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(
                              FurnitureModelViewer(
                                modelPathForAndroid: products[widget.productId]
                                    ["product_model_android"],
                                modelPathForIos: products[widget.productId]["product_model_ios"],
                              ),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
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
                            child: const Text(
                              "Ar",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Description",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            Text(products[widget.productId]["product_description"]),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Color Palette",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    PickProductColor(
                        colorWidth: 25,
                        productColors: products[widget.productId]["product_colors"]),
                    spaceVertical32(),
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
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "-",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          _counter.toString(),
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              increaseCounter();
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "+",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    spaceVertical32(),
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
                        }),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
