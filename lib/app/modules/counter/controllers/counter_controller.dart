import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt bilangan = 0.obs;

  void tambahSatu() {
    if (bilangan.value >= 20) {
      Get.snackbar('warning', 'maaf anda telah mencapai batas maksimal');
    } else {
      bilangan.value++;
    }
  }

   void kurangSatu() {
    if (bilangan.value <= 0) {
      Get.snackbar('warning', 'maaf anda telah mencapai batas maksimal');
    } else {
      bilangan.value--;
    }
  }
}