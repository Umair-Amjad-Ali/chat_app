// lib/views/widgets/bottom_appbar.dart
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.meeting_room),
          label: "Rooms",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: "Chats",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: "Events",
        ),
      ],
    );
  }
}
