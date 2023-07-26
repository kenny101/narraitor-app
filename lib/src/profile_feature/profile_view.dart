import 'package:flutter/material.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

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
          'Profile',
          style: TextStyle(color: Colors.white, fontSize: 34), // Set the text color to white and increase the font size.
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final authProvider = Provider.of<AuthProvider>(context, listen: false);
              await authProvider.logout();
              goRouter.goNamed('welcome');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome to the Profile View!',
          style: TextStyle(fontSize: 20, color: Colors.white), // Set the text color to white.
        ),
      ),
    );
  }
}
