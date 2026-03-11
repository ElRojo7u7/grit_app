import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grit/converters/Date.converter.dart';

part 'UserProfile.model.freezed.dart';
part 'UserProfile.model.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required int index,
    required String name,
    required String image,
    required String? strength,
    @DateOnlyConverter() required DateTime currentDate,
    @DateOnlyConverter() DateTime? lastDate,
    @DateOnlyConverter() DateTime? levelUpdate,
    required int level,
    required int rounds,
    required int phraseIdx,
    String? goal,
    @Default({}) Map<String, dynamic> metadata,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
