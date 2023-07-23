import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthButton extends StatelessWidget {
  final String? imageAssetPath;
  final String text;
  final VoidCallback onPressed;

  const AuthButton({
    this.imageAssetPath,
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.1),
        elevation: 0,
        side: const BorderSide(width: 2, color: Colors.white60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imageAssetPath != null)
              Image.asset(
                imageAssetPath!,
                width: 24,
                height: 24,
              ),
            if (imageAssetPath != null) const SizedBox(width: 10),
            Text(
              text,
              style: GoogleFonts.nunito(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
