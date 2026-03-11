// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'UserProfile.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 int get index; String get name; String get image; String? get strength;@DateOnlyConverter() DateTime get currentDate;@DateOnlyConverter() DateTime? get lastDate;@DateOnlyConverter() DateTime? get levelUpdate; int get level; int get rounds; int get phraseIdx; String? get goal; Map<String, dynamic> get metadata;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.index, index) || other.index == index)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.currentDate, currentDate) || other.currentDate == currentDate)&&(identical(other.lastDate, lastDate) || other.lastDate == lastDate)&&(identical(other.levelUpdate, levelUpdate) || other.levelUpdate == levelUpdate)&&(identical(other.level, level) || other.level == level)&&(identical(other.rounds, rounds) || other.rounds == rounds)&&(identical(other.phraseIdx, phraseIdx) || other.phraseIdx == phraseIdx)&&(identical(other.goal, goal) || other.goal == goal)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,name,image,strength,currentDate,lastDate,levelUpdate,level,rounds,phraseIdx,goal,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'UserProfile(index: $index, name: $name, image: $image, strength: $strength, currentDate: $currentDate, lastDate: $lastDate, levelUpdate: $levelUpdate, level: $level, rounds: $rounds, phraseIdx: $phraseIdx, goal: $goal, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 int index, String name, String image, String? strength,@DateOnlyConverter() DateTime currentDate,@DateOnlyConverter() DateTime? lastDate,@DateOnlyConverter() DateTime? levelUpdate, int level, int rounds, int phraseIdx, String? goal, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? name = null,Object? image = null,Object? strength = freezed,Object? currentDate = null,Object? lastDate = freezed,Object? levelUpdate = freezed,Object? level = null,Object? rounds = null,Object? phraseIdx = null,Object? goal = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,strength: freezed == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as String?,currentDate: null == currentDate ? _self.currentDate : currentDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastDate: freezed == lastDate ? _self.lastDate : lastDate // ignore: cast_nullable_to_non_nullable
as DateTime?,levelUpdate: freezed == levelUpdate ? _self.levelUpdate : levelUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,rounds: null == rounds ? _self.rounds : rounds // ignore: cast_nullable_to_non_nullable
as int,phraseIdx: null == phraseIdx ? _self.phraseIdx : phraseIdx // ignore: cast_nullable_to_non_nullable
as int,goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int index,  String name,  String image,  String? strength, @DateOnlyConverter()  DateTime currentDate, @DateOnlyConverter()  DateTime? lastDate, @DateOnlyConverter()  DateTime? levelUpdate,  int level,  int rounds,  int phraseIdx,  String? goal,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.index,_that.name,_that.image,_that.strength,_that.currentDate,_that.lastDate,_that.levelUpdate,_that.level,_that.rounds,_that.phraseIdx,_that.goal,_that.metadata);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int index,  String name,  String image,  String? strength, @DateOnlyConverter()  DateTime currentDate, @DateOnlyConverter()  DateTime? lastDate, @DateOnlyConverter()  DateTime? levelUpdate,  int level,  int rounds,  int phraseIdx,  String? goal,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.index,_that.name,_that.image,_that.strength,_that.currentDate,_that.lastDate,_that.levelUpdate,_that.level,_that.rounds,_that.phraseIdx,_that.goal,_that.metadata);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int index,  String name,  String image,  String? strength, @DateOnlyConverter()  DateTime currentDate, @DateOnlyConverter()  DateTime? lastDate, @DateOnlyConverter()  DateTime? levelUpdate,  int level,  int rounds,  int phraseIdx,  String? goal,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.index,_that.name,_that.image,_that.strength,_that.currentDate,_that.lastDate,_that.levelUpdate,_that.level,_that.rounds,_that.phraseIdx,_that.goal,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({required this.index, required this.name, required this.image, required this.strength, @DateOnlyConverter() required this.currentDate, @DateOnlyConverter() this.lastDate, @DateOnlyConverter() this.levelUpdate, required this.level, required this.rounds, required this.phraseIdx, this.goal, final  Map<String, dynamic> metadata = const {}}): _metadata = metadata;
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  int index;
@override final  String name;
@override final  String image;
@override final  String? strength;
@override@DateOnlyConverter() final  DateTime currentDate;
@override@DateOnlyConverter() final  DateTime? lastDate;
@override@DateOnlyConverter() final  DateTime? levelUpdate;
@override final  int level;
@override final  int rounds;
@override final  int phraseIdx;
@override final  String? goal;
 final  Map<String, dynamic> _metadata;
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.index, index) || other.index == index)&&(identical(other.name, name) || other.name == name)&&(identical(other.image, image) || other.image == image)&&(identical(other.strength, strength) || other.strength == strength)&&(identical(other.currentDate, currentDate) || other.currentDate == currentDate)&&(identical(other.lastDate, lastDate) || other.lastDate == lastDate)&&(identical(other.levelUpdate, levelUpdate) || other.levelUpdate == levelUpdate)&&(identical(other.level, level) || other.level == level)&&(identical(other.rounds, rounds) || other.rounds == rounds)&&(identical(other.phraseIdx, phraseIdx) || other.phraseIdx == phraseIdx)&&(identical(other.goal, goal) || other.goal == goal)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,name,image,strength,currentDate,lastDate,levelUpdate,level,rounds,phraseIdx,goal,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'UserProfile(index: $index, name: $name, image: $image, strength: $strength, currentDate: $currentDate, lastDate: $lastDate, levelUpdate: $levelUpdate, level: $level, rounds: $rounds, phraseIdx: $phraseIdx, goal: $goal, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 int index, String name, String image, String? strength,@DateOnlyConverter() DateTime currentDate,@DateOnlyConverter() DateTime? lastDate,@DateOnlyConverter() DateTime? levelUpdate, int level, int rounds, int phraseIdx, String? goal, Map<String, dynamic> metadata
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? name = null,Object? image = null,Object? strength = freezed,Object? currentDate = null,Object? lastDate = freezed,Object? levelUpdate = freezed,Object? level = null,Object? rounds = null,Object? phraseIdx = null,Object? goal = freezed,Object? metadata = null,}) {
  return _then(_UserProfile(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,strength: freezed == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as String?,currentDate: null == currentDate ? _self.currentDate : currentDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastDate: freezed == lastDate ? _self.lastDate : lastDate // ignore: cast_nullable_to_non_nullable
as DateTime?,levelUpdate: freezed == levelUpdate ? _self.levelUpdate : levelUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,rounds: null == rounds ? _self.rounds : rounds // ignore: cast_nullable_to_non_nullable
as int,phraseIdx: null == phraseIdx ? _self.phraseIdx : phraseIdx // ignore: cast_nullable_to_non_nullable
as int,goal: freezed == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
