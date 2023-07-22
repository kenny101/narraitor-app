import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'auth_feature/welcome_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use providers in widgets here if needed
    // Example:
    // var myProvider = Provider.of<MyProvider>(context);

    // GoRouter configuration
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          name:
              'welcome', // Optional, add name to your routes. Allows you navigate by name instead of path
          path: '/',
          builder: (context, state) => const WelcomeView(),
        ),
       
      ],
    );
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
