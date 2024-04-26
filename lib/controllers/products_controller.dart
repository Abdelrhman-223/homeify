import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController{
  List<int> productPickedColor = [0,0,0];

  insertColor(List<int> color){
    productPickedColor = color;

    update();
  }
}
