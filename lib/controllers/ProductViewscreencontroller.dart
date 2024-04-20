import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/screenmodels/ProductViewscreenmodel.dart';
import '../widgets/dynamicpadding.dart';
class ProductViewScreenController extends GetxController {
  void Refresh() {update();}
  ProductViewScreenModel HMM = ProductViewScreenModel();

}

GetxController ProductViewScreenControl = Get.find<ProductViewScreenController>();
