import 'package:flutter/foundation.dart';

class RouteProvider with ChangeNotifier {
  bool _nextButtonAvailable = true;

  bool get nextButtonAvailable => _nextButtonAvailable;

  set nextButtonAvailable(bool item) {
    _nextButtonAvailable = item;
    notifyListeners();
  }
}
