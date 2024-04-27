import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:homeify/StaticJsonFiles/products.dart';
import 'package:homeify/screens/Loginscreen.dart';
import 'package:homeify/utils/icons.dart';
import 'package:homeify/widgets/product_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/dividers.dart';
import '../utils/images.dart';
import '../widgets/bottomnavbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String chosenCategory = "all";

  List<int> sortedProducts = [];

  SharedPreferences? sharedPreferences;

  getDataFromSH() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    getDataFromSH();
    for (int i = 1; i <= products.length; i++) {
      sortedProducts.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  sharedPreferences!.setBool("loggedIn", false);
                  Get.offAll(LoginScreen());
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Settings",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "Languages",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Builder(
        builder: (homeContext) {
          return SafeArea(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(16),
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
                              colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
                            ),
                          ),
                        ),
                      ),
                    ),
                    spaceVertical16(),
                    IconButton(
                      onPressed: () {
                        Scaffold.of(homeContext).openDrawer();
                      },
                      icon: const Icon(
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
                      child: Container(
                        width: 165,
                        height: 100,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: AssetImage(carousel[index]), fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          chosenCategory = "all";
                          // itemBuilderLength = products.length;
                          sortedProducts.clear();
                          for (int i = 1; i <= products.length; i++) {
                            sortedProducts.add(i);
                          }
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: ("all" == chosenCategory) ? Colors.black : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "All",
                          style: TextStyle(
                            color: ("all" == chosenCategory) ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 52,
                        child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (categories[index] == chosenCategory) {
                                    chosenCategory = "all";
                                    // itemBuilderLength = products.length;
                                    sortedProducts.clear();
                                    for (int i = 1; i <= products.length; i++) {
                                      sortedProducts.add(i);
                                    }
                                  } else {
                                    chosenCategory = categories[index];
                                    // itemBuilderLength = 0;
                                    sortedProducts.clear();
                                    for (int i = 1; i <= products.length; i++) {
                                      if (products[i]["category"] == categories[index]) {
                                        sortedProducts.add(i);
                                      }
                                    }
                                  }
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: (categories[index] == chosenCategory)
                                      ? Colors.black
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  categories[index],
                                  style: TextStyle(
                                    color: (categories[index] == chosenCategory)
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: GridView.builder(
                      itemCount: sortedProducts.length,
                      itemBuilder: (context, index) => Align(
                        child: ProductField(productId: sortedProducts[index]),
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 32,
                        mainAxisSpacing: 16,
                        mainAxisExtent: 280,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
