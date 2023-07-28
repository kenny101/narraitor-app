import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  late String selectedTag = "";

  void setTag(String tag) {
    selectedTag = tag;
    this.printCurrentTag();
    notifyListeners();
  }

  void resetTag() {
    selectedTag = "";
      print('resetTag ${selectedTag}');
    notifyListeners();
  }

  void printCurrentTag() {
    print('selectedTag ${selectedTag}');
  }
}
