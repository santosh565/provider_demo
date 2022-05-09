import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                value: 'Imperial',
                onChanged: (value) {},
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
                  FilterChip(label: const Text('Swix'), onSelected: (value) {}),
                  const SizedBox(width: 10),
                  FilterChip(
                    label: const Text('Toko'),
                    onSelected: (value) {},
                    selected: true,
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
