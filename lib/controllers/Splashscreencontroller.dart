import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/screenmodels/Splashscreenmodel.dart';
import '../widgets/dynamicpadding.dart';
class SplashScreenController extends GetxController {
  void Refresh() {update();}
  SplashScreenModel HMM = SplashScreenModel();
}

GetxController SplashScreenControl = Get.find<SplashScreenController>();
