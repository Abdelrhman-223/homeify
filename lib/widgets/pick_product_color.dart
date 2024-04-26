import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeify/controllers/products_controller.dart';

class PickProductColor extends StatelessWidget {
  PickProductColor({super.key, required this.colorWidth, required this.productColors});

  final double colorWidth;
  final List productColors;

  int pickedColorIndex = -1;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => GetBuilder<ProductsController>(
        init: ProductsController(),
        builder: (productsController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            height: colorWidth*3,
            child: ListView.builder(
              itemCount: productColors.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      pickedColorIndex = index;
                      productsController.insertColor(productColors[index]);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: (pickedColorIndex == index) ? colorWidth + 5 : colorWidth,
                      backgroundColor: Color.fromRGBO(
                          productColors[index][0], productColors[index][1], productColors[index][2], 1),
                    ),
                  ),
                );
              }
            ),
          );
        }
      ),
    );
  }
}
