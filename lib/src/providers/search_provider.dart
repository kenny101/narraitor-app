import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:pocketbase/pocketbase.dart';
import './auth_provider.dart';

class SearchProvider extends ChangeNotifier {
  late String selectedTag = "";
  final PocketBase pb;

  SearchProvider(this.pb);

  void setTag(String tag) {
    selectedTag = tag;
    printCurrentTag();
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

  void checkAuth() async {
    print(await AuthProvider().isLoggedIn());
  }

  Future<List<RecordModel>> searchContent(String filter) async {
    print("filter $filter");
    final resultList = await pb.collection('audio').getList(
          filter: filter,
        );
    return resultList.items;
  }
}

String parseUrl(RecordModel item, String field, bool thumb) {
  String thumbSize = thumb ? '100x100' : '';
  return "https://narraitor.fly.dev/api/files/${item.collectionId}/${item.id}/${item.getStringValue(field)}?${thumbSize}";
}
