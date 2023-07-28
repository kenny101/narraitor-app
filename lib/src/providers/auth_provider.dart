import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  final pb = PocketBase('https://narraitor.fly.dev');
  PocketBase get pocketBase => pb;

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    pb.authStore.clear();
    prefs.remove("pb_auth");
  }

  Future<bool> loginWithProvider(String provider) async {
    if (provider != 'apple' && provider != 'google') {
      throw ArgumentError(
          "Invalid provider. Allowed providers are 'apple' or 'google'.");
    } else {
      await pb.collection('users').authWithOAuth2(provider, (url) async {
        if (defaultTargetPlatform == TargetPlatform.android) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          await launchUrl(url, mode: LaunchMode.platformDefault);
        }
      });
      final encoded = jsonEncode(<String, dynamic>{
        "token": pb.authStore.token,
        "model": pb.authStore.model,
      });
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("pb_auth", encoded);
      print("called saved ${pb.authStore.token} ${pb.authStore.model.id}");
      pb.authStore.save(pb.authStore.token, pb.authStore.model.id);
      if (pb.authStore.isValid) {
        return true;
      }
    }
    return false;
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final String? raw = prefs.getString("pb_auth");

    // Check if the raw data from SharedPreferences is not empty and not null
    if (raw != null && raw.isNotEmpty) {
      final decoded = jsonDecode(raw);
      final token = (decoded as Map<String, dynamic>)["token"] as String?;
      final model =
          RecordModel.fromJson(decoded["model"] as Map<String, dynamic>? ?? {});

      // If the token and model are not null, the user is considered logged in
      if (token != null) {
        pb.authStore.save(token, model);
        if (pb.authStore.isValid) {
          print("user is logged in");
          return true;
        }
      }
    }
    print("user is not logged in");
    // If any condition fails, the user is considered not logged in
    return false;
  }
}
