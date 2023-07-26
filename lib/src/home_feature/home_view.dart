import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color of the screen to black.
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false, // Left-align the title.
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white, fontSize: 34), // Set the text color to white and increase the font size.
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to the Home View!',
          style: TextStyle(fontSize: 20, color: Colors.white), // Set the text color to white.
        ),
      ),
    );
  }
}
