import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthButton extends StatefulWidget {
  final String? imageAssetPath;
  final String text;
  final VoidCallback onPressed;
  final VoidCallback? onAccountCreatePressed; // Add this line

  const AuthButton({
    this.imageAssetPath,
    required this.text,
    required this.onPressed,
    this.onAccountCreatePressed, // Add this line
    Key? key,
  }) : super(key: key);

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
  }

  void _onButtonPressed() {
    _controller.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      _controller.reverse();
    });
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: 1.0,
        end: .98,
      ).animate(_controller),
      child: ElevatedButton(
        onPressed: widget.onAccountCreatePressed != null // Modify this line
            ? () {
                _onButtonPressed();
                if (widget.onAccountCreatePressed != null) {
                  widget.onAccountCreatePressed!(); // Add this line
                }
              }
            : _onButtonPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(.2),
          elevation: 1,
          side: const BorderSide(width: 2, color: Colors.white60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.imageAssetPath != null)
                Image.asset(
                  widget.imageAssetPath!,
                  width: 24,
                  height: 24,
                ),
              if (widget.imageAssetPath != null) const SizedBox(width: 10),
              Text(
                widget.text,
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
