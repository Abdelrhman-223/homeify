import 'package:flutter/material.dart';
import 'package:homeify/StaticJsonFiles/user_cart.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.productId,
    required this.userId,
    required this.piecesNumber,
    required this.productColor,
    required this.buttonActivation,
  });

  final int productId, userId, piecesNumber;
  final List<int> productColor;
  final bool buttonActivation;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if(buttonActivation) {
          bool hasProduct = false;
          for (int i = 0; i < userCart.length; i++) {
            if (userCart[i]["product_id"] == productId) {
              hasProduct = true;
            }
          }
          if (!hasProduct) {
            userCart.add({
              "product_id": productId,
              "user_id": userId,
              "pieces_number": piecesNumber,
              "product_color": productColor,
            });
          }
        }
      },
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      color: (buttonActivation)?Colors.black:Colors.black38,
      child: const Text(
        "Add to Cart",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
