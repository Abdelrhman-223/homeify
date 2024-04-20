import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/screenmodels/Homescreenmodel.dart';
import '../widgets/dynamicpadding.dart';
class HomeScreenController extends GetxController {
  void Refresh() {update();}
  HomeScreenModel HMM = HomeScreenModel();
}

GetxController HomeScreenControl = Get.find<HomeScreenController>();
