// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/Homescreencontroller.dart';

class GridViewBuild extends StatefulWidget {
  double ChildAspectRatio;
  Widget Function(int) ContainingWidget;
  Color BorderColor;
  double ContainerHeight;
  int CrossAxisCount;
  List<dynamic> ListOfParams;
  GridViewBuild({
    Key? key,
    required this.ChildAspectRatio,
    required this.ContainingWidget,
    required this.BorderColor,
    required this.ContainerHeight,
    required this.CrossAxisCount,
    required this.ListOfParams,
  }) : super(key: key);

  @override
  State<GridViewBuild> createState() => _GridViewBuildState();
}

class _GridViewBuildState extends State<GridViewBuild> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                                height : this.widget.ContainerHeight ,
                                child: GetBuilder<HomeScreenController>(
                                  init: HomeScreenController(),
                                  builder: (controller) {
                                    return GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: this.widget.CrossAxisCount,
                                      childAspectRatio: this.widget.ChildAspectRatio,
                                    ),
                                    itemBuilder: (context, index) {
                                      return  this.widget.ContainingWidget(index);
                                    },
                                    itemCount: this.widget.ListOfParams.length // Number of items in your data source
                              );
                                  }
                                ),
                              );
  }
}