import 'package:get/get.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;

  var showTopBar = true.obs;
  var showBottomBar = true.obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 3), () {
      isLoading.value = false;
    });
  }

  void changePage(int index) {
    currentIndex.value = index;
  }
}
