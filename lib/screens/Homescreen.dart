import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:homeify/screens/ProductViewscreen.dart';
import 'package:homeify/utils/icons.dart';
import 'package:homeify/widgets/product_field.dart';

import '../controllers/Homescreencontroller.dart';
import '../utils/dividers.dart';
import '../utils/images.dart';
import '../widgets/bottomnavbar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> carousel = [
    Container(
      width: 165,
      height: 100,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text("Carousel 1"),
    ),
    Container(
      width: 165,
      height: 100,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text("Carousel 2"),
    ),
    Container(
      width: 165,
      height: 100,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text("Carousel 3"),
    ),
  ];

  List<Widget> categories = [
    Container(
      height: 40,
      width: 150,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text("Cat 1"),
    ),
    Container(
      height: 40,
      width: 150,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text("Cat 2"),
    ),
    Container(
      height: 40,
      width: 150,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text("Cat 3"),
    ),
  ];

  List<Widget> products = [
    ProductField(fieldImage: AppImages.house1),
    ProductField(fieldImage: AppImages.house2),
    ProductField(fieldImage: AppImages.house3),
    ProductField(fieldImage: AppImages.house4),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MyBottomNavigationBar(),
        body: SafeArea(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: GetBuilder<HomeScreenController>(
                  init: HomeScreenController(),
                  builder: (controller) {
                    return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(16),
                              alignment: Alignment.centerLeft,
                              child: SvgPicture.asset(AppImages.homeifyLogo),
                            ),
                            spaceVertical16(),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 16),
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 4,
                                          offset: const Offset(2, 2),
                                          blurStyle: BlurStyle.outer,
                                        ),
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 4,
                                          offset: const Offset(2, 2),
                                          blurStyle: BlurStyle.inner,
                                        ),
                                      ],
                                    ),
                                    child: TextField(
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Colors.black,
                                        hintText: "Search",
                                        icon: SvgPicture.asset(
                                          AppIcons.searchIcon,
                                          width: 20,
                                          height: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                spaceVertical16(),
                                const Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Icon(
                                    Icons.menu,
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 164,
                              child: ListView.builder(
                                itemCount: carousel.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Align(
                                  alignment: Alignment.center,
                                  child: carousel[index],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 64,
                              child: ListView.builder(
                                itemCount: categories.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Align(
                                  alignment: Alignment.center,
                                  child: categories[index],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(32),
                                child: GridView.builder(
                                  itemCount: products.length,
                                  itemBuilder: (context, index) => Align(child: products[index]),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 32,
                                    mainAxisSpacing: 16,
                                    mainAxisExtent: 185,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ));
                  })),
        ));
  }
}
