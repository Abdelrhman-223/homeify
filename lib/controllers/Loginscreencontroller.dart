import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/screenmodels/Loginscreenmodel.dart';
import '../widgets/dynamicpadding.dart';
class LoginScreenController extends GetxController {
  void Refresh() {update();}
  LoginScreenModel HMM = LoginScreenModel();
}

GetxController LoginScreenControl = Get.find<LoginScreenController>();
