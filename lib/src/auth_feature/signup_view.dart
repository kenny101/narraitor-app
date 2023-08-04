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
  bool _showPasswordCriteria = false;
  final FocusNode _passwordFocusNode = FocusNode();
  String _errorMessage = '';

  void _showPasswordCriteriaPopup(bool isVisible) {
    setState(() {
      _showPasswordCriteria = isVisible;
    });
  }

  Future<bool> _handleAccountCreation() async {
    try {
      final pb = PocketBase('https://narraitor.fly.dev');
      print("$_email, $_password, $_verifyPassword");

      if (_password.length < 8) {
        setState(() {
          _errorMessage = 'Password must be at least 8 characters long.';
        });
        return false;
      }

      if (_password.length > 14) {
        setState(() {
          _errorMessage = 'Password cannot be more than 14 characters long.';
        });
        return false;
      }

      if (_password != _verifyPassword) {
        setState(() {
          _errorMessage = 'Passwords do not match.';
        });
        return false;
      }

      final body = <String, dynamic>{
        "email": _email,
        "emailVisibility": true,
        "password": _password,
        "passwordConfirm": _verifyPassword,
      };

      final record = await pb.collection('users').create(body: body);
      await pb.collection('users').requestVerification(_email);

      final authData = await pb.collection('users').authWithPassword(
        _email,
        _password,
      );

      if (pb.authStore.isValid) {
        print('Account created successfully!');
        return true;
      } else {
        setState(() {
          _errorMessage = 'Error creating account.';
        });
        return false;
      }
    } catch (e) {
      print('Account creation failed: $e');
      setState(() {
        _errorMessage = 'Account creation failed: $e';
      });
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
                    prefixIcon: const Icon(Icons.person),
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
                  focusNode: _passwordFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                        _showPasswordCriteriaPopup(!_isPasswordVisible);
                      },
                      child: Icon(
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
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVerifyPasswordVisible =
                              !_isVerifyPasswordVisible;
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
                // Show error message if present
                if (_errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                AuthButton(
                  text: 'Create account',
                  onPressed: () async {
                    // Reset error message before account creation attempt
                    setState(() {
                      _errorMessage = '';
                    });
                    bool successfulAccountCreation =
                        await _handleAccountCreation();
                    if (successfulAccountCreation) {
                      goRouter.goNamed('navbar');
                    }
                  },
                ),
              ],
            ),
          ),
          if (_showPasswordCriteria)
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(right: 16),
              child: const Card(
                color: Colors.black,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '- Password must be at least 8 characters in length',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
