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
  String _email = '';
  String _password = '';
  String _verifyPassword = '';

  Future<bool> _handleAccountCreation() async {
    try {
      final pb = PocketBase('https://narraitor.fly.dev');
      print("$_email, $_password, $_verifyPassword");
      final body = <String, dynamic>{
        "email": _email,
        "emailVisibility": true,
        "password": _password,
        "passwordConfirm": _verifyPassword,
      };

      final record = await pb.collection('users').create(body: body);
      await pb.collection('users').requestVerification(_email);
      // TODO:request verification dialog after request verfication method

      // After verification, create the user account
      final authData = await pb.collection('users').authWithPassword(
            _email,
            _password,
          );

      // If account creation is successful, you can use userData for further operations
      if (pb.authStore.isValid) {
        print('Account created successfully!');
        return true;
      } else {
        // show whatever error dialog
        print("error creating account");
        return false;
      }
    } catch (e) {
      // Handle account creation errors here
      print('Account creation failed: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final goRouter = GoRouter.of(context);

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
                    hintText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon:
                        const Icon(Icons.person), // Eye icon for username
                  ),
                  onChanged: (email) {
                    print('newValue in email change $email');

                    setState(() {
                      _email = email;
                    });
                  },
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
                      onPressed: () {
                        _isPasswordVisible = !_isPasswordVisible;
                      },
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  onChanged: (password) {
                    print('newValue in password $password');

                    setState(() {
                      _password = password;
                    });
                  },
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
                    prefixIcon:
                        const Icon(Icons.lock), // Eye icon for verify password
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVerifyPasswordVisible = !_isVerifyPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isVerifyPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  onChanged: (verifyPassword) {
                    print('verifyPassword $verifyPassword');

                    setState(() {
                      _verifyPassword = verifyPassword;
                    });
                  },
                ),
                const SizedBox(height: 16),
                AuthButton(
                  text: 'Create account',
                  onPressed: () async {
                    bool successfulAccountCreation =
                        await _handleAccountCreation(); // Call the _handleAccountCreation function
                    if (successfulAccountCreation) {
                      goRouter.goNamed('navbar');
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
