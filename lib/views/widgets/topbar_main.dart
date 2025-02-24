// lib/views/widgets/topbar_main.dart
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onNotificationTap;
  final ValueChanged<String>? onMenuItemSelected;

  const TopBar({
    Key? key,
    this.title = "ChatApp",
    this.onNotificationTap,
    this.onMenuItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust sizes relative to screen dimensions.
    final iconSize = screenWidth * 0.06;
    final titleFontSize = screenWidth * 0.05;
    final menuTextFontSize = screenWidth * 0.04;
    // Set vertical offset as 5% of screen height.
    final offsetY = screenHeight * 0.05;

    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontSize: titleFontSize),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, size: iconSize),
          onPressed: onNotificationTap,
        ),
        PopupMenuButton<String>(
          // Apply responsive vertical offset.
          offset: Offset(0, offsetY),
          icon: Icon(Icons.menu, size: iconSize),
          onSelected: onMenuItemSelected,
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'profile',
              child: Row(
                children: [
                  Icon(Icons.person, size: iconSize),
                  SizedBox(width: screenWidth * 0.02),
                  Text("Profile", style: TextStyle(fontSize: menuTextFontSize)),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'subscription',
              child: Row(
                children: [
                  Icon(Icons.subscriptions, size: iconSize),
                  SizedBox(width: screenWidth * 0.02),
                  Text("Subscription",
                      style: TextStyle(fontSize: menuTextFontSize)),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'leaderboard',
              child: Row(
                children: [
                  Icon(Icons.leaderboard, size: iconSize),
                  SizedBox(width: screenWidth * 0.02),
                  Text("Leaderboard",
                      style: TextStyle(fontSize: menuTextFontSize)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
