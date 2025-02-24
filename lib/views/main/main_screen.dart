import 'package:chat_app/constants/routes/app_routes.dart';
import 'package:chat_app/views/main/chat_page.dart';
import 'package:chat_app/views/main/events_page.dart';
import 'package:chat_app/views/main/rooms_page.dart';
import 'package:chat_app/views/widgets/bottom_appbar.dart';
import 'package:chat_app/views/widgets/topbar_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/main_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.put(MainController());

    return Obx(() {
      return SafeArea(
        child: Scaffold(
          appBar: controller.showTopBar.value
              ? TopBar(
                  title: "ChatApp",
                  onNotificationTap: () {},
                  onMenuItemSelected: (value) {
                    if (value == 'profile') {
                      Get.toNamed(AppRoutes.profilePage);
                    } else if (value == 'subscription') {
                      Get.toNamed(AppRoutes.subscriptionPage);
                    } else if (value == 'leaderboard') {
                      Get.toNamed(AppRoutes.leaderboardPage);
                    }
                  },
                )
              : null,
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: const [
              RoomsPage(),
              ChatPage(),
              EventsPage(),
            ],
          ),
          bottomNavigationBar: controller.showBottomBar.value
              ? BottomBar(
                  currentIndex: controller.currentIndex.value,
                  onTap: (index) {
                    controller.changePage(index);
                    if (index == 0) {
                      Get.offNamed(AppRoutes.roomPage);
                    } else if (index == 1) {
                      Get.offNamed(AppRoutes.chatPage);
                    } else if (index == 2) {
                      Get.offNamed(AppRoutes.eventPage);
                    }
                  },
                )
              : null,
        ),
      );
    });
  }
}
