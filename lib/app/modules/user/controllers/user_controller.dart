
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/app/data/user_model.dart';
import 'dart:convert';

import '../../../utils/api.dart';


class UserController extends GetxController {
  var userList = <DataUser>[].obs;
  var selectedUser = Rxn<int>();
  var isLoading = true.obs;

  final String baseUrl = '${BaseUrl.api}/user';

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  // Fetch kategori
  void fetchUsers() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var user = User.fromJson(jsonResponse);
        userList.value = user.data!;
      } else {
        Get.snackbar("Error", "Failed to fetch user");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch user: $e");
    } finally {
      isLoading(false);
    }
  }

  // Add USER
  Future<void> addUser(DataUser newUser) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(newUser.toJson()),
      );
      if (response.statusCode == 201) {
        fetchUsers();
        Get.back();
        Get.snackbar("Success", "User userned successfully");
      } else {
        Get.snackbar("Error", "Failed to user");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to user: $e");
    } finally {
      isLoading(false);
    }
  }

  // Update User
  Future<void> updateUser(int id, DataUser updatedUser) async {
    try {
      isLoading(true);
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(updatedUser.toJson()),
      );
      if (response.statusCode == 200) {
        fetchUsers();
        Get.back();
        Get.snackbar("Success", "User updated successfully");
      } else {
        Get.snackbar("Error", "Failed to update user");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update user: $e");
    } finally {
      isLoading(false);
    }
  }

  // Delete USER
  Future<void> deleteUser(int id) async {
    try {
      isLoading(true);
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        fetchUsers();
        Get.snackbar("Success", "User deleted successfully");
      } else {
        Get.snackbar("Error", "Failed to delete user");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to delete user: $e");
    } finally {
      isLoading(false);
    }
  }
}
