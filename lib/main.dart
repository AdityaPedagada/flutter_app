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
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          width: 100,
          height: 100,
          alignment: Alignment.center,
          child: Text(
            "I am a Box",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              gradient: LinearGradient(colors: [Colors.pink, Colors.yellow]),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)]),
        ),
      ),
    );
  }
}
