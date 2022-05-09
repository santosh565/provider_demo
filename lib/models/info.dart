import 'package:flutter/foundation.dart';

class Info with ChangeNotifier {
  late String _title, _description;
  Info() {
    _description = 'default description';
    _title = 'default title :';
  }

  String get title => _title;
  String get description => _description;

  set title(String value) {
    _title = value;
    notifyListeners();
  }

  set description(String value) {
    _description = value;
    notifyListeners();
  }
}
