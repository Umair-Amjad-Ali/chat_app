// lib/views/main/rooms_page.dart
import 'package:flutter/material.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoading = true; // Set this based on your logic

    if (isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Loading Rooms..."),
            SizedBox(height: 16),
            CircularProgressIndicator(),
          ],
        ),
      );
    }
  }
}
