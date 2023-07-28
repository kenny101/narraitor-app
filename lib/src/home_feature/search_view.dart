import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import './horizontal_chips.dart'; // Import the new widget
import '../providers/search_provider.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  final bool showKeyboardOnLoaded;
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
  final _searchController = TextEditingController();
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    // Request focus on the search field when the widget loads
    if (widget.showKeyboardOnLoaded) {
      _requestFocusOnSearchField();
    }

    // Listen for changes in the text field
    _searchController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _requestFocusOnSearchField() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
  }

  void _onTextChanged() {
    setState(() {
      _showClearButton = _searchController.text.isNotEmpty;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

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
                        searchProvider.resetTag();
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
                    controller:
                        _searchController, // Use the TextEditingController
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (value) {
                      // Handle the search action here
                      print("Search: $value");
                    },
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
                      suffixIcon: _showClearButton
                          ? GestureDetector(
                              onTap:
                                  _clearSearch, // Handle the tap event to clear the search
                              child: const Icon(LineIcons.times, color: Colors.black),
                            )
                          : null,
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
