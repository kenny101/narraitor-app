import 'package:flutter/material.dart';
import '../providers/search_provider.dart';
import 'package:pocketbase/pocketbase.dart';

class SearchTile extends StatelessWidget {
  final RecordModel item;

  const SearchTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = parseUrl(item, 'thumbnail', false);
    final title = item.getStringValue('title');
    final description = item.getStringValue('description');
    final author = item.getStringValue('author');

    // Print the values
    print('Thumbnail URL: $thumbnailUrl');
    print('Title: $title');
    print('Description: $description');

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Thumbnail
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(thumbnailUrl),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title (limited to one line)
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Set to white for visibility on dark background
                  ),
                  maxLines: 1, // Limit to one line
                  overflow: TextOverflow.ellipsis, // Add ellipsis (...) when text overflows
                ),
                const SizedBox(height: 2),
                // Author (limited to one line)
                Text(
                  'By $author',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[300], // Text color for dark background
                  ),
                  maxLines: 1, // Limit to one line
                  overflow: TextOverflow.ellipsis, // Add ellipsis (...) when text overflows
                ),
                const SizedBox(height: 4), // Add spacing between author and description
                // Description with up to 3 lines
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[300], // Text color for dark background
                  ),
                  maxLines: 3, // Limit the description to 3 lines
                  overflow: TextOverflow.ellipsis, // Add ellipsis (...) when text overflows
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
