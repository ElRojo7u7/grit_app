import 'package:grit/models/UserProfile/UserProfile.model.dart';

abstract class UserProfileRepository {
  /// Load saved profile or null if none.
  Future<UserProfile?> loadProfile();

  /// Save profile (overwrite).
  Future<void> saveProfile(UserProfile profile);

  /// Remove saved profile.
  Future<void> clearProfile();
}
