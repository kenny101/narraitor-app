import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class SectionCard extends StatelessWidget {
  final String imageUrl;
  final String cardTitle;
  final String cardAuthor;

  const SectionCard({
    required this.imageUrl,
    required this.cardTitle,
    required this.cardAuthor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            imageUrl,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black45],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 8,
          right: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardTitle.length <= 25
                    ? cardTitle
                    : '${cardTitle.substring(0, 25)}...',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                cardAuthor.length <= 25
                    ? cardAuthor
                    : '${cardAuthor.substring(0, 25)}...',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}