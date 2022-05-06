import 'package:flutter/material.dart';

import 'body.dart';
import './widgets/appBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: const MyView());
  }
}

class MyView extends StatelessWidget {
  const MyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MyAppBar(), drawer: buildDrawer(), body: Body());
  }
}

Drawer buildDrawer() {
  return Drawer(
      child: ListView(
    padding: const EdgeInsets.all(0),
    children: const [
      SizedBox(
        height: 150,
        child: DrawerHeader(
          decoration: BoxDecoration(color: Color.fromARGB(137, 63, 63, 63)),
          child: Text('Drawer Header',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.white)),
        ),
      ),
      ListTile(
        title: Text('Attack Online'),
      ),
      ListTile(
        title: Text('Mobile Legend'),
      ),
      ListTile(
        title: Text('Rules Of Survival'),
      ),
      ListTile(
        title: Text('PUBG'),
      ),
      Divider(),
      ListTile(
        title: Text('About'),
      ),
    ],
  ));
}
