import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlayView extends StatelessWidget {
  const PlayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter.of(context);

    return Scaffold(
      // Set the background color of the screen to black.
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false, // Left-align the title.
        title: const Text(
          'Now Playing',
          style: TextStyle(color: Colors.white, fontSize: 34), // Set the text color to white and increase the font size.
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Now Playing View!',
          style: TextStyle(fontSize: 20, color: Colors.white), // Set the text color to white.
        ),
      ),
    );
  }
}
