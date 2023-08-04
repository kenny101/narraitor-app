import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import './horizontal_chips.dart';
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

    // Add the scoped will pop callback to handle back gesture detection
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ModalRoute.of(context)?.addScopedWillPopCallback(_handleBackGesture);
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _requestFocusOnSearchField() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
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

  Future<bool> _handleBackGesture() async {
    // Perform your desired action when the back gesture is detected
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.resetTag();

    // Allow the back navigation to proceed
    return true;
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
                  if (widget.showKeyboardOnLoaded) const SizedBox(height: 5),
                  TextFormField(
                    focusNode: _searchFocusNode,
                    controller: _searchController,
                    textInputAction: TextInputAction.search,
                    onFieldSubmitted: (value) async {
                      print("Search: $value");
                      var result = await searchProvider.searchContent(
                          'tags?~"${searchProvider.selectedTag}"');
                      print('result ${result}');
                    },
                    decoration: InputDecoration(
                      hintText: searchProvider.selectedTag.isEmpty
                          ? 'Search all content by title'
                          : 'Search content title by ${searchProvider.selectedTag}',
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
                              onTap: _clearSearch,
                              child: const Icon(LineIcons.times,
                                  color: Colors.black),
                            )
                          : null,
                    ),
                  ),
                  if (widget.showKeyboardOnLoaded) const SizedBox(height: 5),
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
