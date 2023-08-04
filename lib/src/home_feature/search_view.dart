import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import './horizontal_chips.dart'; // Import the new widget

class SearchView extends StatefulWidget {
  final bool showKeyboardOnLoaded; // 
  final String? tag;

  const SearchView({
    Key? key,
    this.showKeyboardOnLoaded = false,
    this.tag,
  }) : super(key: key);

  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState extends State<SearchView> {
  final _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Request focus on the search field when the widget loads
    if (widget.showKeyboardOnLoaded) {
      _requestFocusOnSearchField();
    }
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _requestFocusOnSearchField() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
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
                      icon: const Icon(Icons.arrow_back),
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
                  if (widget
                      .showKeyboardOnLoaded) // Conditionally show the search bar based on the boolean value
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
                      prefixIcon: const Icon(
                        LineIcons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  if (widget
                      .showKeyboardOnLoaded) // Conditionally show the search bar based on the boolean value
                    const SizedBox(height: 5),
                  HorizontalChips(
                    onChipTap: (tag) {
                      print("Tapped on $tag");
                    },
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
