import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/models/info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Info(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Page1(),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Column(
        children: const [
          Flexible(
            child: Top(),
          ),
          Flexible(
            child: Bottom(),
          )
        ],
      ),
    );
  }
}

class Top extends StatelessWidget {
  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Top build');
    final info = context.read<Info>();
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () {
                info.title = 'new tittle';
                info.description = 'new description';
              },
              child: const Text('Change values')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Page2()));
              },
              child: const Text('Next page')),
        ],
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Bottom build');
    final info = Provider.of<Info>(context);
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: info.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: info.description,
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<Info>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: info.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: info.description,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
