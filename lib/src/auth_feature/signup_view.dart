import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:narraitor/src/auth_feature/auth_button.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:go_router/go_router.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool _isPasswordVisible = false;
  bool _isVerifyPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleVerifyPasswordVisibility() {
    setState(() {
      _isVerifyPasswordVisible = !_isVerifyPasswordVisible;
    });
  }

  void _handleAccountCreation() async {
    String username = ''; // Get the username from the TextFormField
    String password = ''; // Get the password from the TextFormField

    try {
      final pb = PocketBase('https://narraitor.fly.dev/_/');

      // Request verification for the user's email
      await pb.collection('users').requestVerification('test@example.com');

      // After verification, create the user account
      final userData = await pb.collection('users').authWithPassword(username, password);

      // If account creation is successful, you can use userData for further operations
      if (pb.authStore.isValid) {
        print('Account created successfully!');
        print(pb.authStore.token);
        print(pb.authStore.model.id);

        // Redirect to the home screen or any other page as needed.
        // For example, you can use GoRouter to move to the home screen after successful account creation.
        GoRouter.of(context).go('/home'); // Replace '/home' with your home screen route.
      }
    } catch (e) {
      // Handle account creation errors here
      print('Account creation failed: $e');
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
          'Sign Up',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.person), // Eye icon for username
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.lock), // Eye icon for password
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
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: !_isVerifyPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Verify Password',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.lock), // Eye icon for verify password
                    suffixIcon: IconButton(
                      onPressed: _toggleVerifyPasswordVisibility,
                      icon: Icon(
                        _isVerifyPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                AuthButton(
                  text: 'Create account',
                  onPressed: _handleAccountCreation, // Call the handleAccountCreation function on button press
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
