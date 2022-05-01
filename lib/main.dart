import 'package:flutter/material.dart';
import 'body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: MyView());
  }
}

class MyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context), drawer: buildDrawer(), body: Body());
  }

  AppBar buildAppBar(context) {
    return AppBar(
      title: Image.asset(
        'web/assets/img/6666-Logo-White.png',
        fit: BoxFit.cover,
        width: 80,
      ),
      elevation: 0,
      actions: <Widget>[
        IconButton(
            icon: const Icon(Icons.call),
            onPressed: () => showMyDialog(context)),
      ],
      toolbarHeight: 100,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
    );
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

  void showMyDialog(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('AlertDialog Title'),
              content: const Text('AlertDialog description'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));
  }
}
