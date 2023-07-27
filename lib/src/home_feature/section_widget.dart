import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import './section_card.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final Function() onRightArrowPressed; // Add this callback function

  const SectionWidget({
    required this.title,
    required this.onRightArrowPressed, // Pass the callback function to the constructor
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      "https://narraitor.fly.dev/api/files/by9jykxah8jlmop/d8fqg7iu4vzy5ea/b12ed970a7324e1bbf2310527f299c3f_hPQ3j8hibu.jpeg",
      "https://narraitor.fly.dev/api/files/by9jykxah8jlmop/d8fqg7iu4vzy5ea/b12ed970a7324e1bbf2310527f299c3f_hPQ3j8hibu.jpeg",
      "https://narraitor.fly.dev/api/files/by9jykxah8jlmop/d8fqg7iu4vzy5ea/b12ed970a7324e1bbf2310527f299c3f_hPQ3j8hibu.jpeg",
      "https://narraitor.fly.dev/api/files/by9jykxah8jlmop/d8fqg7iu4vzy5ea/b12ed970a7324e1bbf2310527f299c3f_hPQ3j8hibu.jpeg",
      "https://narraitor.fly.dev/api/files/by9jykxah8jlmop/d8fqg7iu4vzy5ea/b12ed970a7324e1bbf2310527f299c3f_hPQ3j8hibu.jpeg",
      "https://narraitor.fly.dev/api/files/by9jykxah8jlmop/d8fqg7iu4vzy5ea/b12ed970a7324e1bbf2310527f299c3f_hPQ3j8hibu.jpeg",
      "https://narraitor.fly.dev/api/files/by9jykxah8jlmop/d8fqg7iu4vzy5ea/b12ed970a7324e1bbf2310527f299c3f_hPQ3j8hibu.jpeg",
      "https://narraitor.fly.dev/api/files/by9jykxah8jlmop/d8fqg7iu4vzy5ea/b12ed970a7324e1bbf2310527f299c3f_hPQ3j8hibu.jpeg",
      "https://narraitor.fly.dev/api/files/by9jykxah8jlmop/d8fqg7iu4vzy5ea/b12ed970a7324e1bbf2310527f299c3f_hPQ3j8hibu.jpeg",
    ];

    String cardTitle = "The Campground";
    String cardAuthor = "Edgar Allan Poe";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed:
                      onRightArrowPressed, // Use the callback function here
                  icon: const Icon(
                    LineIcons
                        .arrowRight, // Right arrow icon from line_icons package
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: imageUrls.map((url) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
                child: SectionCard(
                  imageUrl: url,
                  cardTitle: cardTitle,
                  cardAuthor: cardAuthor,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
