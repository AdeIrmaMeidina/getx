
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/data/berita_model.dart';
import 'package:myapp/app/modules/berita/views/berita_view.dart';
import 'package:myapp/app/modules/tag/views/tag_view.dart';
import 'package:myapp/app/modules/user/views/user_view.dart';
import '../../biodata/views/biodata_view.dart';
import '../../counter/views/counter_view.dart';
import '../../home/views/home_view.dart';
import '../../kategori/views/kategori_view.dart';
import '../../profile/views/profile_view.dart';
import '../controllers/bottom_menu_controller.dart';

class BottomMenuView extends GetView<BottomMenuController> {
  BottomMenuView({Key? key}) : super(key: key);

  final List<Widget> pages = [
    HomeView(),
    CounterView(),
    KategoriView(),
    BiodataView(),
    ProfileView(),
    TagView(),
    UserView(),
    BeritaView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.exposure, title: 'Counter'),
          TabItem(icon: Icons.category, title: 'Kategori'),
          TabItem(icon: Icons.person, title: 'Biodata'),
          TabItem(icon: Icons.account_circle, title: 'Profile'),
          TabItem(icon: Icons.tag, title: 'Tag'),
          TabItem(icon: Icons.people, title: 'User'),
          TabItem(icon: Icons.newspaper, title: 'Berita'),
        ],
        initialActiveIndex: 0,
        onTap: controller.changePage,
      ),
    );
  }
}
