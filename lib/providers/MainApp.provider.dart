import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:grit/classes/ProfileData.class.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainAppProvider with ChangeNotifier {
  ProfileData? _profileData;
  String? _strenght;

  ProfileData get profileData => _profileData!;
  String get strenght => _strenght!;

  set profileData(ProfileData profileData) {
    _profileData = profileData;
    notifyListeners();
  }

  set strenght(String data) {
    _strenght = data;
    notifyListeners();
  }

  Map<String, dynamic> toMap() => {
        'profileData': profileData.toMap(),
        'strenght': strenght,
      };

  String toJson() => jsonEncode(toMap());

  void fromMap(Map<String, dynamic> map) {
    _profileData = ProfileData.fromMap(map['profileData']);
    _strenght = map['strenght'];
  }

  Future<void> saveProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile', toJson());
  }

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('profile');

    if (json == null) return;
    fromMap(jsonDecode(json));
    notifyListeners();
  }
}
