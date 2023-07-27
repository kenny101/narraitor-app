import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'auth_feature/welcome_view.dart';
import 'auth_feature/login_view.dart';
import 'auth_feature/signup_view.dart';
import 'providers/auth_provider.dart';
import 'home_feature/home_view.dart';
import 'nav_feature/navbar_view.dart';
import 'home_feature/search_view.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: MaterialApp.router(
        routerConfig: _configureRouter(context),
      ),
    );
  }

  GoRouter _configureRouter(BuildContext context) {
    return GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          name: 'welcome',
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
        GoRoute(
          name: 'navbar',
          path: '/navbar',
          builder: (context, state) => const Navbar(),
        ),
        GoRoute(
          name: 'search',
          path: '/search',
          builder: (context, state) => const SearchView(showSearchBar: true),
        ),
      ],
      redirect: (context, state) => _redirectToCorrectView(context),
    );
  }

  Future<String?> _redirectToCorrectView(BuildContext context) async {
    final isLoggedIn = await AuthProvider().isLoggedIn();
    if (isLoggedIn) {
      return '/navbar'; // Redirect to the home view if the user is logged in
    } else {
      return null; // Otherwise, allow the original navigation to proceed
    }
  }
}
