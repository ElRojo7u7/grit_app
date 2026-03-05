import 'dart:convert';

class ProfileData {
  String image;
  String name;
  int level;
  int index = -1;

  Map<String, dynamic> toMap() =>
      {'name': name, 'image': image, 'level': level, 'index': index};

  factory ProfileData.fromMap(Map<String, dynamic> map) => ProfileData(
        name: map['name'],
        image: map['image'],
        level: map['level'],
        index: map['index'],
      );

  factory ProfileData.fromJson(String source) =>
      ProfileData.fromMap(jsonDecode(source));

  ProfileData({
    required this.image,
    required this.name,
    required this.index,
    this.level = 0,
    // this.index = -1,
  });
}
