import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(primaryColor: Colors.grey.shade600),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awesome App"),
      ),
      body: Container(
        color: Colors.tealAccent,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: 100,
              height: 100,
              alignment: Alignment.center,
              color: Colors.blueGrey,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: 100,
              height: 100,
              alignment: Alignment.center,
              color: Colors.yellow,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: 100,
              height: 100,
              alignment: Alignment.center,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
