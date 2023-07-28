import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  late String selectedTag = "";

  void setTag(String tag) {
    selectedTag = tag;
    print("added $tag");
    notifyListeners();
  }

  void resetTag() {
    selectedTag = "";
    print("tag reset");
    notifyListeners();
  }
}
