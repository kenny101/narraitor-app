import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_button.dart';
import 'package:go_router/go_router.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Set the background image using a Container with a DecorationImage
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/welcome-background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Image.asset(
                      'assets/logos/text-logo.png',
                      width: 300,
                      height: 200,
                    ),
                  ),
                  Text(
                    'Beautiful AI Narrations.\nNatural Voices.',
                    style: GoogleFonts.manjari(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AuthButton(
                        text: 'Sign up free',
                        onPressed: () {
                          context.pushNamed('signup');
                        },
                      ),
                      const SizedBox(height: 5),
                      AuthButton(
                        imageAssetPath: 'assets/logos/google.png',
                        text: 'Continue with Google',
                        onPressed: () {
                          // Add your sign-up with Google logic here
                        },
                      ),
                      const SizedBox(height: 5),
                      AuthButton(
                        imageAssetPath: 'assets/logos/appleDark.png',
                        text: 'Continue with Apple',
                        onPressed: () {
                          // Add your sign-up with Apple logic here
                        },
                      ),
                      const SizedBox(height: 5),
                      Center(
                        child: InkWell(
                          onTap: () {
                            context.pushNamed('login');
                          },
                          borderRadius: BorderRadius.circular(30.0),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            color: Colors.transparent,
                            child: Text(
                              'Login',
                              style: GoogleFonts.nunito(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
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
