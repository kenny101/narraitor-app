import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            padding:
                const EdgeInsets.only(top: 250.0), // Add padding at the top
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Add the image above the text with padding in between
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 0), // Add padding between the image and text
                  child: Image.asset('assets/logos/text-logo.png',
                      width: 300, height: 200),
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
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 250.0), // Add padding at the top
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
