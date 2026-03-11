import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:grit/helpers/DateTime.helper.dart';
import 'package:grit/helpers/phrases.helper.dart';
import 'package:grit/helpers/profiles.helper.dart';
import 'package:grit/models/UserProfile/UserProfile.model.dart';
import 'package:grit/repositories/UserProfile/UserProfile.repository.dart';

/// Public provider for the repository (we will override it in main).
final profileRepositoryProvider = Provider<UserProfileRepository>((ref) {
  throw UnimplementedError('profileRepositoryProvider must be overridden');
});

/// The StateNotifier holds the current profile (nullable).
/// Uses Change semantics: any update persists automatically.
class UserProfileNotifier extends StateNotifier<UserProfile?> {
  final UserProfileRepository _repo;
  UserProfileNotifier(this._repo) : super(null);

  /// initialize (load persisted profile)
  Future<void> load() async {
    final p = await _repo.loadProfile();
    state = p;
  }

  /// Replace entire profile and persist
  Future<void> setProfile(UserProfile profile) async {
    state = profile;
    await _repo.saveProfile(profile);
  }

  /// Replace entire profile and persist
  Future<void> setDefaultProfile(int idx) async {
    state = profiles[idx];
    await _repo.saveProfile(profiles[idx]);
  }

  /// Clear profile (logout)
  Future<void> clear() async {
    state = null;
    await _repo.clearProfile();
  }

  /// Partial update helpers. They create a new object using copyWith,
  /// update state immediately (optimistic), then persist.
  Future<void> updateName(String name) async {
    if (state == null) return;
    final updated = state!.copyWith(name: name);
    state = updated;
    await _repo.saveProfile(updated);
  }

  Future<void> updateImage(String image) async {
    if (state == null) return;
    final updated = state!.copyWith(image: image);
    state = updated;
    await _repo.saveProfile(updated);
  }

  Future<void> incrementLevel() async {
    if (state == null) return;
    final updated = state!.level + 1 != 21
        ? state!.copyWith(
            phraseIdx: Random().nextInt(phrases.length - 1),
            level: state!.level + 1,
            levelUpdate: getNow(),
          )
        : state!.copyWith(
            level: 0,
            rounds: state!.rounds + 1,
            levelUpdate: getNow(),
            phraseIdx: Random().nextInt(phrases.length - 1),
          );
    state = updated;
    await _repo.saveProfile(updated);
  }

  Future<void> reset() async {
    if (state == null) return;
    final updated = state!.copyWith(
      level: 0,
      levelUpdate: null,
      currentDate: getNow(),
    );
    state = updated;
    await _repo.saveProfile(updated);
  }

  Future<void> updateGoal(String goal) async {
    if (state == null) return;
    final updated = state!.copyWith(goal: goal);
    state = updated;
    await _repo.saveProfile(updated);
  }

  Future<void> updateCurrDate(DateTime date) async {
    if (state == null) return;
    final updated = state!.copyWith(
      currentDate: date,
      lastDate: state!.currentDate,
    );
    state = updated;
    await _repo.saveProfile(updated);
  }

  Future<void> updateStrength(String strenght) async {
    if (state == null) return;
    final updated = state!.copyWith(strength: strenght);
    state = updated;
    await _repo.saveProfile(updated);
  }

  /// Generic update with a callback to mutate the copy
  Future<void> updateWith(UserProfile Function(UserProfile) transform) async {
    if (state == null) return;
    final updated = transform(state!);
    state = updated;
    await _repo.saveProfile(updated);
  }
}

/// Provider for the notifier itself
final userProvNotifierProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfile?>((ref) {
      final repo = ref.watch(profileRepositoryProvider);
      final notifier = UserProfileNotifier(repo);
      // optionally load on creation:
      notifier.load();
      return notifier;
    });
