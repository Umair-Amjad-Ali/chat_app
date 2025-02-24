import 'package:flutter/material.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoading = true;

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
