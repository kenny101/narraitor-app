import 'package:flutter/material.dart';
import './section_widget.dart';
import './search_view.dart';
import 'package:line_icons/line_icons.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // Replace the AppBar with a Container
                  padding: const EdgeInsets.only(),
                  height: AppBar().preferredSize.height,
                  color: Colors.transparent,
                  child: const Row(
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold, // Make the text bold
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  onTap: () {
                    // Navigate to the search screen when the TextFormField is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  SearchView(),
                      ),
                    );
                  },
                  readOnly: true, // Prevents manual text input
                  decoration: InputDecoration(
                    hintText: 'Search books, stories, literature by title',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    // Add the search icon using prefixIcon
                    prefixIcon: const Icon(
                      LineIcons.search, // Search icon from line_icons package
                      color: Colors.black, // Icon color
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
                            side:
                                const BorderSide(color: Colors.white, width: 2),
                            backgroundColor: Colors.black,
                            label: Text(tag,
                                style: const TextStyle(color: Colors.white)),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SectionWidget(
                  title: 'New Releases',
                  onRightArrowPressed: () => {},
                ),
                const SizedBox(height: 20),
                SectionWidget(
                  title: 'Short Stories',
                  onRightArrowPressed: () => {},
                ),
                const SizedBox(height: 20),
                SectionWidget(
                  title: 'Drift into Sleep',
                  onRightArrowPressed: () => {},
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
