import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/settings_provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('units'),
              DropdownButton<String>(
                value: settingsProvider.units,
                onChanged: (value) {
                  settingsProvider.units = value!;
                },
                items: <String>['Imperial', 'Metric']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('wax lines'),
              Wrap(
                children: [
                  FilterChip(
                    label: const Text('Swix'),
                    selected: (settingsProvider.waxLines.contains('Swix')),
                    onSelected: (isSelected) {
                      if (isSelected) {
                        settingsProvider.addWaxLine('Swix');
                      } else {
                        settingsProvider.removeWaxLine('Swix');
                      }
                    },
                  ),
                  const SizedBox(width: 10),
                  FilterChip(
                    label: const Text('Toko'),
                    selected: (settingsProvider.waxLines.contains('Toko')),
                    onSelected: (isSelected) {
                      if (isSelected) {
                        settingsProvider.addWaxLine('Toko');
                      } else {
                        settingsProvider.removeWaxLine('Toko');
                      }
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
