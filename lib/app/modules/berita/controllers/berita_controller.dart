
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/app/data/berita_model.dart';
import 'dart:convert';

import '../../../utils/api.dart';

class BeritaController extends GetxController {
  var beritaList = <DataBerita>[].obs;
  var isLoading = true.obs;

  final String baseUrl = '${BaseUrl.api}/berita';

  @override
  void onInit() {
    fetchBeritas();
    super.onInit();
  }

  // Fetch berita
  void fetchBeritas() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var berita = Berita.fromJson(jsonResponse);
        beritaList.value = berita.data!;
      } else {
        Get.snackbar("Error", "Failed to fetch news");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch news: $e");
    } finally {
      isLoading(false);
    }
  }

  // Add berita
  Future<void> addBerita(DataBerita newBerita) async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(newBerita.toJson()),
      );
      if (response.statusCode == 201) {
        fetchBeritas();
        Get.back();
        Get.snackbar("Success", "News added successfully");
      } else {
        Get.snackbar("Error", "Failed to news category");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to news category: $e");
    } finally {
      isLoading(false);
    }
  }

  // Update berita
  Future<void> updateBerita(int id, DataBerita updatedBerita) async {
    try {
      isLoading(true);
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(updatedBerita.toJson()),
      );
      if (response.statusCode == 200) {
        fetchBeritas();
        Get.back();
        Get.snackbar("Success", "Berita updated successfully");
      } else {
        Get.snackbar("Error", "Failed to update news");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update news: $e");
    } finally {
      isLoading(false);
    }
  }

  // Delete berita
  Future<void> deleteBerita(int id) async {
    try {
      isLoading(true);
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      if (response.statusCode == 200) {
        fetchBeritas();
        Get.snackbar("Success", "News deleted successfully");
      } else {
        Get.snackbar("Error", "Failed to delete news");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to delete news: $e");
    } finally {
      isLoading(false);
    }
  }
}
