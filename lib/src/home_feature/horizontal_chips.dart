import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart';

class HorizontalChips extends StatefulWidget {
  final Function(String) onChipTap;
  final bool? disableTapAnimation;

  const HorizontalChips({
    required this.onChipTap,
    this.disableTapAnimation = false,
    Key? key,
  }) : super(key: key);

  static const List<String> tags = [
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

  @override
  HorizontalChipsState createState() => HorizontalChipsState();
}

class HorizontalChipsState extends State<HorizontalChips> {
  String? _selectedTag;

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, searchProvider, _) {
        _selectedTag = searchProvider.selectedTag;

        print('selected ${_selectedTag}');

        final List<String> tagsWithSelectedFirst =
            List.of(HorizontalChips.tags);

        if (_selectedTag != null &&
            tagsWithSelectedFirst.contains(_selectedTag!)) {
          tagsWithSelectedFirst.remove(_selectedTag!);
          tagsWithSelectedFirst.insert(0, _selectedTag!);
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: tagsWithSelectedFirst.map((tag) {
              final isSelected = _selectedTag == tag;
              return GestureDetector(
                onTap: () {
                  if (!widget.disableTapAnimation!) {
                    setState(() {
                      if (_selectedTag == tag) {
                        _selectedTag = null; // Unselect the tag if tapped again
                      } else {
                        _selectedTag = tag; // Select the tapped tag
                      }
                    });
                  }
                  if (_selectedTag == null) {
                    searchProvider
                        .resetTag(); // Unselect the tag in the SearchProvider
                  } else {
                    searchProvider.setTag(
                        tag); // Set the selected tag in the SearchProvider
                  }
                  widget.onChipTap(tag);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Chip(
                    side: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                    backgroundColor:
                        isSelected ? Colors.grey[700] : Colors.black,
                    label: Text(
                      tag,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
