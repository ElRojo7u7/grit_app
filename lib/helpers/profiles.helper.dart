import 'dart:math';

import 'package:grit/helpers/DateTime.helper.dart';
import 'package:grit/helpers/phrases.helper.dart';
import 'package:grit/models/UserProfile/UserProfile.model.dart';

const _names = ['Nilo', 'Lumi', 'Milo', 'Brio', 'Nala'];

final profiles = [
  for (int i = 0; i < _names.length; i++)
    UserProfile(
      image: 'assets/images/Profile_${i}.png',
      name: _names[i],
      index: i,
      strength: null,
      currentDate: getNow(),
      lastDate: null,
      level: 0,
      rounds: 0,
      phraseIdx: Random().nextInt(phrases.length - 1),
    ),
];
