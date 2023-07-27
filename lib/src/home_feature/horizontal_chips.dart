import 'package:flutter/material.dart';

class HorizontalChips extends StatelessWidget {
  final Function(String) onChipTap;

  HorizontalChips({required this.onChipTap, Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tags.map((tag) {
          return GestureDetector(
            onTap: () => onChipTap(tag), // Invoke the callback with the tag
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Chip(
                side: const BorderSide(color: Colors.white, width: 2),
                backgroundColor: Colors.black,
                label: Text(tag, style: const TextStyle(color: Colors.white)),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
