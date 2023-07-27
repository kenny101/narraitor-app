import 'package:flutter/material.dart';
import './section_widget.dart';
import './search_view.dart';
import 'package:line_icons/line_icons.dart';
import './horizontal_chips.dart'; // Import the new widget

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
                        builder: (context) => const SearchView(
                          showKeyboardOnLoaded: true,
                        ),
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
                      LineIcons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                HorizontalChips(
                  onChipTap: (tag) {
                    SearchView(tag: tag);
                  },
                ),
                SectionWidget(
                  title: 'New Releases',
                  onRightArrowPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchView(),
                      ),
                    )
                  },
                ),
                const SizedBox(height: 20),
                SectionWidget(
                  title: 'Short Stories',
                  onRightArrowPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchView(),
                      ),
                    )
                  },
                ),
                const SizedBox(height: 20),
                SectionWidget(
                  title: 'Drift into Sleep',
                  onRightArrowPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchView(),
                      ),
                    )
                  },
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
