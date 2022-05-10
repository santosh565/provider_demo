import 'package:flutter/foundation.dart';

class SettingsProvider with ChangeNotifier {
  late String _units;
  late List<String> _waxLines;

  SettingsProvider() {
    _units = 'Imperial';
    _waxLines = ['Swix', 'Toko'];
  }

  String get units => _units;
  List<String> get waxLines => _waxLines;

  set units(String value) {
    _units = value;
    notifyListeners();
  }

  set waxLines(List<String> waxLines) {
    _waxLines = waxLines;
    notifyListeners();
  }

  void addWaxLine(String waxLine) {
    if (_waxLines.contains(waxLine)) {
      debugPrint('Wax line already exists');
      return;
    }
    _waxLines.add(waxLine);
    notifyListeners();
  }

  void removeWaxLine(String waxLine) {
    if (!_waxLines.contains(waxLine)) {
      debugPrint('Wax line does not exist');
      return;
    }
    _waxLines.remove(waxLine);
    notifyListeners();
  }

}
