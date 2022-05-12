import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:myapp/services/testApiService.dart';

class post extends StatefulWidget {
  final id;

  const post(this.id, {Key? key}) : super(key: key);

  @override
  State<post> createState() => _postState();
}

class _postState extends State<post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.id),
          elevation: 0,
          toolbarHeight: 200,
          flexibleSpace: dynamicAppBarBackground(),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              alignment: Alignment.topLeft,
              onPressed: () => Navigator.pop(context),
            ),
          )),
      body: myBody(widget.id),
    );
  }

  Container dynamicAppBarBackground() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('web/assets/img/BA.jpg'), fit: BoxFit.cover)),
    );
  }

  FutureBuilder myBody(id) {
    var postApiList = TestApiService().getPostApi(id);
    return FutureBuilder(
      future: postApiList,
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Padding(
            padding: EdgeInsets.all(190),
            child: Center(
                child: LoadingIndicator(
                    indicatorType: Indicator.ballRotateChase,
                    colors: [Colors.white])),
          );
        }
        if (snapshot.hasError) {
          return const Padding(
            padding: EdgeInsets.all(190),
            child: Center(
                child: Text(
              'Error',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          );
        }
        return ListView(scrollDirection: Axis.vertical, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: Column(
              children: [
             

                Html(data: '${snapshot.data[0].content}')
              ],
            ),
          )
        ]);
      },
    );
  }
}
