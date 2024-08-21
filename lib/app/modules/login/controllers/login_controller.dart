import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

import '../../../utils/api.dart';

class LoginController extends GetxController {
  final box = GetStorage();
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2297515806.
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  Future<void> login() async {
    isLoading(true);
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4192953879.
    final url = Uri.parse('${BaseUrl.api}/login');
    final response = await http.post(
      url,
      body: {
        'email': emailController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final token = data['access_token'];

      box.write('access_token', token);
      Get.offAllNamed('/bottom-menu');
    } else {
      Get.snackbar('Error', 'Login failed. Please try again',
          snackPosition: SnackPosition.BOTTOM);
    }
    isLoading(false);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
