import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider_demo/models/report.dart';

class FireStoreService {
  final _db = FirebaseFirestore.instance;
  var random = Random();

  Stream<List<Report>> getReports() {
    return _db
        .collection('reports')
        .orderBy('temp', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Report.fromJson(doc.data())).toList());
  }

  Future<void> addReport() async {
    var temp = next(-15, 5);
    var line = (temp < -5) ? 'Swix' : 'Toko';
    var wax = (temp.isEven) ? 'Red' : 'Green';
    Map<String, dynamic> dataMap = {
      'temp': temp,
      'wax': wax,
      'line': line,
    };
    await _db.collection('reports').add(dataMap);
  }

  int next(int min, int max) => min + random.nextInt(max - min);
}
