import 'package:flutter/material.dart';
import '../main.dart';

class Name extends StatefulWidget {
  Name({Key? key}) : super(key: key);

  @override
  State<Name> createState() => CategoryPage();
}

class CategoryPage extends State<Name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            toolbarHeight: 200,
            flexibleSpace: dynamicAppBarBacground(),
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
                alignment: Alignment.topLeft,
                onPressed: () => Navigator.pop(context),
              ),
            )));
  }

  Container dynamicAppBarBacground() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('web/assets/img/AK.jpg'), fit: BoxFit.cover)),
    );
  }
}
