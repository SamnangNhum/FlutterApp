import 'package:flutter/material.dart';
import 'package:myapp/services/testApiService.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Name extends StatefulWidget {
  final id;
  Name(this.id, {Key? key}) : super(key: key);

  @override
  State<Name> createState() => CategoryPage();
}

class CategoryPage extends State<Name> {
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
              image: AssetImage('web/assets/img/AK.jpg'), fit: BoxFit.cover)),
    );
  }

  FutureBuilder myBody(id) {
    var testCatApiList = TestApiService().getTestCatApi(id);
    print(testCatApiList);
    return FutureBuilder(
      future: testCatApiList,
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
        return ListView.separated(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            var testCatApi = snapshot.data?[index];
            return Padding(
              padding: const EdgeInsets.fromLTRB(10 , 15 , 10 , 15),
              child: Column(
                
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0 , 0 ,0 , 10.0),
                    child: Image.network('${testCatApi?.imageLink}', fit: BoxFit.cover),
                  ),
                  Text('${testCatApi?.title}')
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.black,
              height: 0,
            );
          },
          itemCount: snapshot.data?.length ?? 0,
        );
      },
    );
  }
}
