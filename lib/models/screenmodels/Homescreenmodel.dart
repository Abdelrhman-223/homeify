import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/Homescreencontroller.dart';
import '../../datahandler/universaldata.dart';
import '../../widgets/dynamicpadding.dart';import '../../configuration/uiconfiguration/Homeuiconfiguration.dart';
class HomeScreenModel {
//Seeker

  DynamicPadding ProductsPadding = new  DynamicPadding(
ContainerHeight: 100,
ContainerWidth: 350,
    ContainersFunction: homeProductView,
    ScrollDirection: Axis.vertical,
    ListOfParams:Products,
);

  DynamicPadding CategoriesPadding = new  DynamicPadding(
ContainerHeight: 32,
ContainerWidth: 350,
    ContainersFunction: homeCategoryView,
    ScrollDirection: Axis.horizontal,
    ListOfParams:Categories,
);

}