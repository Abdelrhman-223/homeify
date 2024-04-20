import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/screenmodels/Accountscreenmodel.dart';
import '../widgets/dynamicpadding.dart';
class AccountScreenController extends GetxController {
  void Refresh() {update();}
  AccountScreenModel HMM = AccountScreenModel();
}

GetxController AccountScreenControl = Get.find<AccountScreenController>();
