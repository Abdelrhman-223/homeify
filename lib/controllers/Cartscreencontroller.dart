import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/screenmodels/Cartscreenmodel.dart';
import '../widgets/dynamicpadding.dart';
class CartScreenController extends GetxController {
  void Refresh() {update();}
  CartScreenModel HMM = CartScreenModel();
}

GetxController CartScreenControl = Get.find<CartScreenController>();
