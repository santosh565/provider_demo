import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  late String _units;
  late List<String> _waxLines;

  SettingsProvider() {
    _units = 'Imperial';
    _waxLines = ['Swix', 'Toko'];
    loadPreferences();
  }

  String get units => _units;
  List<String> get waxLines => _waxLines;

  set units(String value) {
    _units = value;
    notifyListeners();
    savePreferences();
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
    savePreferences();
  }

  void removeWaxLine(String waxLine) {
    if (!_waxLines.contains(waxLine)) {
      debugPrint('Wax line does not exist');
      return;
    }
    _waxLines.remove(waxLine);
    notifyListeners();
    savePreferences();
  }

  savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('units', _units);
    prefs.setStringList('waxLines', _waxLines);
  }

  loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    String? _units = prefs.getString('units');
    List<String>? _waxLines = prefs.getStringList('waxLines') ;

    if (_units != null) {
     units = _units;
    }

    if (_waxLines != null) {
      waxLines = _waxLines;
    }
  }
}
