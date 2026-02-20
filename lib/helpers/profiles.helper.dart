import 'package:grit/classes/ProfileData.class.dart';

const _names = ['Nilo', 'Lumi', 'Milo', 'Brio', 'Nala'];

final profiles = [
  for (int i = 0; i < _names.length; i++)
    ProfileData(image: 'assets/images/Profile_${i}.jpeg', name: _names[i])
];
