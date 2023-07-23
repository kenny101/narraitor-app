import 'dart:ui';

import 'package:flutter/material.dart';

class GlassmorphismButton extends StatefulWidget {
  const GlassmorphismButton({super.key});
  @override
  State<GlassmorphismButton> createState() => _GlassmorphismButtonState();
}

class _GlassmorphismButtonState extends State<GlassmorphismButton> {
  bool _isBlur = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _isBlur = !_isBlur;
        },
        child: GlassMorphism(
            blur: _isBlur ? 20 : 0,
            opacity: 0.2,
            child: const SizedBox(
              height: 210,
              width: 320,
            )),
      ),
    );
  }
}

class GlassMorphism extends StatelessWidget {
  final double blur;
  final double opacity;
  final Widget child;

  const GlassMorphism({
    Key? key,
    required this.blur,
    required this.opacity,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(opacity),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border:
                  Border.all(width: 1.5, color: Colors.white.withOpacity(0.2))),
                  child: child,
        ),
      ),
    );
  }
}
