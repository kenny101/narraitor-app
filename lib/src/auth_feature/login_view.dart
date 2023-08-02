import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:narraitor/src/auth_feature/auth_button.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:go_router/go_router.dart'; // Added this import for routing

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _handleLogin() async {
    String username = ''; // Get the username from the TextFormField
    String password = ''; // Get the password from the TextFormField

    try {
      final pb = PocketBase('https://narraitor.fly.dev');
      final authData =
          await pb.collection('users').authWithPassword(username, password);

      // If login is successful, you can use authData for further operations
      if (pb.authStore.isValid) {
        print('Login successful!');
        print(pb.authStore.token);
        print(pb.authStore.model.id);

        // Redirect to the navbar screen using GoRouter
        GoRouter.of(context)
            .go('/navbar'); // Replace with your home screen route.
      } else {
        print('Invalid username or password.');
      }
    } catch (e) {
      // Handle login errors here
      print('Login failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Login',
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          iconSize: 20,
          color: Colors.white,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/welcome-background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email or Username',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon:
                          const Icon(Icons.person), // Eye icon for username
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon:
                          const Icon(Icons.lock), // Eye icon for password
                      suffixIcon: IconButton(
                        onPressed: _togglePasswordVisibility,
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // Add your "Forgot Password" logic here
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  AuthButton(
                    text: 'Login',
                    onPressed:
                        _handleLogin, // Call the handleLogin function on button press
                  ),
                  const SizedBox(
                      height: 20), // Add more spacing between buttons
                  TextButton(
                    onPressed: () {
                      // Add your "Create Account" logic here
                    },
                    child: const Text(
                      "Don't have an account? Sign Up",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
