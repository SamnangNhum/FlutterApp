import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

  // TODO: implement preferredSize
  @override
  Size get preferredSize => Size.fromHeight(100);
}
