import 'package:flutter/material.dart';
import '../providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter.of(context); // Store GoRouter instance

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final authProvider = Provider.of<AuthProvider>(context, listen: false);
              await authProvider.logout();
              
              // Use the stored GoRouter instance to navigate to the 'welcome' route
              goRouter.goNamed('welcome');
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Welcome to the Home View!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
