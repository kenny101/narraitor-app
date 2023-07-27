import 'package:flutter/material.dart';
import './section_widget.dart';

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
      body: SingleChildScrollView(
        child: Padding(
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
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Chip(
                          side: const BorderSide(color: Colors.white, width: 2),
                          backgroundColor: Colors.black,
                          label: Text(tag,
                              style: const TextStyle(color: Colors.white)),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SectionWidget(
                title: 'New Releases',
              ),
              const SizedBox(height: 20),
              const SectionWidget(
                title: 'Short Stories',
              ),
              const SizedBox(height: 20),
              const SectionWidget(
                title: 'Drift into Sleep',
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
