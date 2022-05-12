import 'package:flutter/material.dart';
import 'widgets/category.dart';
import 'widgets/post.dart';
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
    return MaterialApp(
        theme: ThemeData.dark(),
        onGenerateRoute: (settings) {
          final args = settings.arguments;
          if (settings.name == '/category' || settings.name == '/post') {
            return PageRouteBuilder(
                settings: settings,
                pageBuilder: (context, animation, secondaryAnimation) {
                  return post(args);
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;
                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  final offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                      position: offsetAnimation, child: child);
                },
                );
          }
        },
     
        home: const MyView());
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
