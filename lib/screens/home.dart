import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/report.dart';
import 'settings.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var reports = Provider.of<List<Report>>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wax app'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return ListTile(
            title: Text(report.line),
            subtitle: Text(report.wax),
          );
        },
      ),
    );
  }
}
