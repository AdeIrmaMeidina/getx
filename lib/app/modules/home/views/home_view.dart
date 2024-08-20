import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Select which one',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed:() {
              Get.toNamed('/counter');
            },
            child: Text('go to counter page')),

            const SizedBox(height: 20),
            ElevatedButton(
            onPressed:() {
              Get.toNamed('/formulir');
            },
            child: Text('go to formulir page'))
        ],
      ),
    );
  }
}