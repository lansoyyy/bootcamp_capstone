import 'package:capston/presentation/screens/first_screen.dart';
import 'package:capston/presentation/screens/second_tab.dart';
import 'package:capston/presentation/screens/third_tab.dart';
import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/drawer_widget.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int selectedIndex = 0;

  appBarTitle(int myIndex) {
    if (myIndex == 0) {
      return 'Skilled Workers';
    } else if (myIndex == 1) {
      return 'Job Offers';
    } else {
      return 'Post';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        drawer: const DrawerWidget(),
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: TextBold(
              text: appBarTitle(selectedIndex),
              color: Colors.white,
              fontSize: 22),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.info),
              ),
            )
          ],
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: const [
            FirstTab(),
            SecondTab(),
            ThirdTab(),
          ],
        ),
        bottomNavigationBar: FloatingNavbar(
          backgroundColor: appBarColor,
          selectedItemColor: appBarColor,
          onTap: (int val) {
            setState(() {
              selectedIndex = val;
            });
          },
          currentIndex: selectedIndex,
          items: [
            FloatingNavbarItem(
                icon: Icons.contact_mail_outlined, title: 'Workers'),
            FloatingNavbarItem(
                icon: Icons.work_outline_rounded, title: 'Job Offers'),
            FloatingNavbarItem(
                icon: Icons.create_new_folder_rounded, title: 'Post'),
          ],
        ),
      ),
    );
  }
}
