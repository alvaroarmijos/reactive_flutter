import 'package:flutter/material.dart';
import 'package:reactive_flutter/observer/observer_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reactive Flutter'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text('Observer'),
              trailing: const Icon(Icons.navigate_next_sharp),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ObserverPage(),
                  )),
            ),
          ],
        ));
  }
}
