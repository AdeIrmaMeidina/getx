import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/biodata/views/biodata_view.dart';
import 'package:myapp/app/modules/counter/views/counter_view.dart';
import 'package:myapp/app/modules/home/views/home_view.dart';
import 'package:myapp/app/modules/kategori/views/kategori_view.dart';
import 'package:myapp/app/modules/profile/views/profile_view.dart';

import '../controllers/bottom_menu_controller.dart';

class BottomMenuView extends GetView<BottomMenuController> {
  BottomMenuView({super.key});

  final List<Widget> pages = [
    HomeView(),
    CounterView(),
    KategoriView(),
    BiodataView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=> pages[controller.selectedIndex.value]),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.exposure, title: 'Counter'),
          TabItem(icon: Icons.category, title: 'kategori'),
          TabItem(icon: Icons.person, title: 'Biodata'),
          TabItem(icon: Icons.account_circle, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        backgroundColor:  Color.fromARGB(255, 170, 246, 163),
        onTap: controller.changePage,
        )
    );
  }
}