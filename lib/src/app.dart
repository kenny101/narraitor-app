import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'auth_feature/welcome_view.dart';
import 'auth_feature/login_view.dart';
import 'auth_feature/signup_view.dart';

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
        GoRoute(
          name: 'signup',
          path: '/signup',
          builder: (context, state) => const SignupView(),
        ),
        GoRoute(
          name: 'login',
          path: '/login',
          builder: (context, state) => const LoginView(),
        ),
      ],
      redirect: (context, state) {
        const isAuthenticated =
            true; // Add your logic to check whether a user is authenticated or not
        if (!isAuthenticated) {
          print("not auth");
          return '/auth';
        } else {
          print("auth");
          return null;
        }
      },
    );
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
