// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserProfile.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  index: (json['index'] as num).toInt(),
  name: json['name'] as String,
  image: json['image'] as String,
  strength: json['strength'] as String?,
  currentDate: const DateOnlyConverter().fromJson(
    json['currentDate'] as String,
  ),
  lastDate: _$JsonConverterFromJson<String, DateTime>(
    json['lastDate'],
    const DateOnlyConverter().fromJson,
  ),
  levelUpdate: _$JsonConverterFromJson<String, DateTime>(
    json['levelUpdate'],
    const DateOnlyConverter().fromJson,
  ),
  level: (json['level'] as num).toInt(),
  rounds: (json['rounds'] as num).toInt(),
  phraseIdx: (json['phraseIdx'] as num).toInt(),
  goal: json['goal'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'index': instance.index,
      'name': instance.name,
      'image': instance.image,
      'strength': instance.strength,
      'currentDate': const DateOnlyConverter().toJson(instance.currentDate),
      'lastDate': _$JsonConverterToJson<String, DateTime>(
        instance.lastDate,
        const DateOnlyConverter().toJson,
      ),
      'levelUpdate': _$JsonConverterToJson<String, DateTime>(
        instance.levelUpdate,
        const DateOnlyConverter().toJson,
      ),
      'level': instance.level,
      'rounds': instance.rounds,
      'phraseIdx': instance.phraseIdx,
      'goal': instance.goal,
      'metadata': instance.metadata,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
