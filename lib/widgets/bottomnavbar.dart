import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:homeify/screens/Accountscreen.dart';
import 'package:homeify/screens/Cartscreen.dart';
import 'package:homeify/screens/Homescreen.dart';
import 'package:homeify/utils/icons.dart';
import '../utils/images.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

int _selectedIndex = 2;

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigate to corresponding screen based on selected index
    switch (_selectedIndex) {
      case 0:
        // _onItemTapped(0);
        Get.to(AccountScreen());
        break;
      case 1:
        // _onItemTapped(1);
        Get.to(CartScreen());
        break;
      case 2:
        //  _onItemTapped(2);
        Get.to(HomeScreen());
        break;
      // _onItemTapped(4);
      //  Get.delete<HomeScreenController>();

      //  Get.to(HomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.homeifyLogo,
            width: 75,
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          Expanded(
            child: BottomNavigationBar(
              elevation: 1,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey[600],
              backgroundColor: Colors.black,
              onTap: _onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.personIcon,
                    width: 24.0,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.cartIcon,
                    width: 24.0,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.homeIcon,
                    width: 24.0,
                    colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
