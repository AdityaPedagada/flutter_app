import 'package:flutter/material.dart';
import 'package:flutter_app1/widgets/drawer.dart';
import 'package:flutter_app1/pages/lonin_page.dart';
import 'package:flutter_app1/utils/contants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePageFB extends StatefulWidget {
  const HomePageFB({Key? key}) : super(key: key);
  static const String routerName = "/homefb";

  @override
  _HomePageFBState createState() => _HomePageFBState();
}

class _HomePageFBState extends State<HomePageFB> {
  // var myText = "Change My Name";
  // TextEditingController _nameController = TextEditingController();

  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future fetchData() async {
    var res = await http.get(Uri.parse(url));
    data = jsonDecode(res.body);
    return data;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text("Awesome App FB"),
        actions: [
          IconButton(
              onPressed: () {
                Constants.prefs?.setBool("loggedIn", false);
                // Navigator.pop(context);
                Navigator.pushReplacementNamed(context, LoginPage.routerName);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text("Fetch Something"),
              );
            case ConnectionState.active:
              return Center(
                child: Text("Connection Active"),
              );
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Some Errors Occures"),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index]["title"]),
                    subtitle: Text("ID: ${data[index]["id"]}"),
                    leading: Icon(
                      Icons.account_circle_rounded,
                      size: 40,
                    ),
                  );
                },
                itemCount: data.length,
              );
          }
        },
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // myText = _nameController.text;
          // setState(() {});
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
