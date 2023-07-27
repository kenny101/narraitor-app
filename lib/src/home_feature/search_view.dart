import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
    // Request focus on the search field when the widget loads
    _searchFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black87,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    centerTitle: false,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    title: const Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    focusNode: _searchFocusNode, // Assign the FocusNode
                    decoration: InputDecoration(
                      hintText: 'Search books, stories, literature by title',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(
                        LineIcons.search,
                        color: Colors.black,
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
                              side: BorderSide(color: Colors.white, width: 2),
                              backgroundColor: Colors.black,
                              label: Text(tag, style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
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
