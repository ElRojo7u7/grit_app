import 'package:flutter/foundation.dart';

class AvatarProvider with ChangeNotifier {
  bool _avatarSelected = true;

  bool get avatarSelected => _avatarSelected;

  set avatarSelected(bool item) {
    _avatarSelected = item;
    notifyListeners();
  }
}
