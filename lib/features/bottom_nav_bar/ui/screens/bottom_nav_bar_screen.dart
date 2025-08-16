import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../home/ui/screens/home_screen.dart';
import '../../controller/bottom_nav_controller.dart';
import 'demo_empty_screen/accounts_screen.dart';
import 'demo_empty_screen/search_screen.dart';
import 'demo_empty_screen/watchlist_screen.dart';

class BottomNavbarScreen extends StatelessWidget {
  BottomNavbarScreen({super.key});

  final BottomNavbarController controller = Get.put(BottomNavbarController());

  final List<Widget> screens = [
    HomeScreen(),
    WatchListScreen(),
    SearchScreen(),
    AccountsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            overlayColor: WidgetStatePropertyAll(
              Color(0xff0A0A0A).withValues(alpha: 0.1),
            ),
            labelTextStyle: WidgetStatePropertyAll(
              TextStyle(color: Color(0xff757575)),
            ),
          ),
          child: NavigationBar(
            elevation: 9,
            shadowColor: Colors.red,
            // surfaceTintColor: Color(0xff404040),
            indicatorColor: Color(0xff0A0A0A),
            backgroundColor: Color(0xff0A0A0A),
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (int index) {
              controller.changeIndex(index);
            },
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color:
                      controller.selectedIndex.value == 0
                          ? Color(0xff298CFF)
                          : Color(0xff757575),
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.bookmark_border,
                  color:
                      controller.selectedIndex.value == 1
                          ? Color(0xff298CFF)
                          : Color(0xff757575),
                ),
                label: 'Watchlist',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.search_sharp,
                  color:
                      controller.selectedIndex.value == 2
                          ? Color(0xff298CFF)
                          : Color(0xff757575),
                ),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.account_circle,
                  color:
                      controller.selectedIndex.value == 3
                          ? Color(0xff298CFF)
                          : Color(0xff757575),
                ),
                label: 'Accounts',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
