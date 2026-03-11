import 'dart:convert';
import 'dart:developer';

import 'package:grit/models/UserProfile/UserProfile.model.dart';
import 'package:grit/repositories/UserProfile/UserProfile.repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsProfileRepository implements UserProfileRepository {
  static const _kProfileKey = 'user_profile_v1';

  final SharedPreferences _prefs;

  SharedPrefsProfileRepository(this._prefs);

  @override
  Future<UserProfile?> loadProfile() async {
    final jsonStr = _prefs.getString(_kProfileKey);
    if (jsonStr == null) return null;
    try {
      final Map<String, dynamic> map = jsonDecode(jsonStr);
      return UserProfile.fromJson(map);
    } catch (e) {
      log("corrupted data; consider clearing or migrating");
      return null;
    }
  }

  @override
  Future<void> saveProfile(UserProfile profile) async {
    final encoded = jsonEncode(profile.toJson());
    await _prefs.setString(_kProfileKey, encoded);
  }

  @override
  Future<void> clearProfile() async {
    await _prefs.remove(_kProfileKey);
  }
}
