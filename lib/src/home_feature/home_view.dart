import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> tags = [
    "Fiction",
    "Short Story",
    "Romance",
    "Mystery",
    "Sci-fi",
    "Horror",
    "Non-Fiction",
    "Meditation",
    "Adventure",
    "Children",
    "Gothic",
    "War",
    "Tragedy",
    "Poetry",
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white, fontSize: 34),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: tags.map((tag) {
                  return GestureDetector(
                    onTap: () {
                      print("Tapped on $tag");
                    },
                    child: Chip(
                      side: const BorderSide(color: Colors.white, width: 2),
                      backgroundColor: Colors.black,
                      label: Text(tag, style: const TextStyle(color: Colors.white)),
                    ),
                  );
                }).toList(),
              ),
            ),
            // const SizedBox(height: 16),
            // Title for New Releases
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'New Releases',
                style: TextStyle(
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
                        const Positioned(
                          bottom: 8,
                          left: 8,
                          right: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title Text
                              Text(
                                'The Campground',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Author Text
                              Text(
                                'Edgar Allan Poe',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
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
        ),
      ),
    );
  }
}
