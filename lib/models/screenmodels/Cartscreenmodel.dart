import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/Cartscreencontroller.dart';
import '../../datahandler/universaldata.dart';
import '../../widgets/dynamicpadding.dart';import '../../configuration/uiconfiguration/Cartuiconfiguration.dart';
class CartScreenModel {
//Seeker

  DynamicPadding CartProductsPadding = new  DynamicPadding(
ContainerHeight: 300,
ContainerWidth: 350,
    ContainersFunction: cartProductView,
    ScrollDirection: Axis.vertical,
    ListOfParams:Products,
);

}