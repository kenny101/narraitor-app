import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SectionWidget extends StatelessWidget {
  final String title;

  const SectionWidget({
    required this.title,
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
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: imageUrls.map((url) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 8.0, 0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        url,
                        height: 220,
                        width: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 220,
                      width: 220,
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
                      bottom: 8,
                      left: 8,
                      right: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title Text
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
                          // Author Text
                          Text(
                            cardAuthor.length <= 25
                                ? cardAuthor
                                : '${cardAuthor.substring(0, 25)}...',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          RatingBar.builder(
                            ignoreGestures: true,
                            itemSize: 20,
                            initialRating: 3,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: const EdgeInsets.only(right: 2),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
