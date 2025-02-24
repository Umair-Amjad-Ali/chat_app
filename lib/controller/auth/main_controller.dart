// lib/controller/auth/main_controller.dart
import 'package:get/get.dart';

class MainController extends GetxController {
  // Current index of bottom navigation
  var currentIndex = 0.obs;

  // Show/hide the top and bottom bars
  var showTopBar = true.obs;
  var showBottomBar = true.obs;

  // Loading indicator state
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Simulate a short loading period (3 seconds)
    Future.delayed(const Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }

  // Change bottom navigation page
  void changePage(int index) {
    currentIndex.value = index;
  }
}
