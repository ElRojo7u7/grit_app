import 'dart:convert';

class ProfileData {
  final String image;
  final String name;
  int level;

  Map<String, dynamic> toMap() =>
      {'name': name, 'image': image, 'level': level};

  factory ProfileData.fromMap(Map<String, dynamic> map) => ProfileData(
        name: map['name'],
        image: map['image'],
        level: map['level'],
      );

  factory ProfileData.fromJson(String source) =>
      ProfileData.fromMap(jsonDecode(source));

  ProfileData({required this.image, required this.name, this.level = 0});
}
