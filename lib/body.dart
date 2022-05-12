import 'package:flutter/material.dart';
import 'package:myapp/services/testApiService.dart';
import '../models/testApi.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var testApiList = TestApiService().getTestApi();

  @override
  Widget build(BuildContext context) {
    List<String> postTitle = [
      'Mobile Legend',
      'Attack Online',
      'Bullet Angel',
      'PUBG'
    ];
    return FutureBuilder<List<AllPostApi>>(
      future: testApiList,
      builder: (context, AsyncSnapshot<List<AllPostApi>> snapshot) {
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
        return ListView(scrollDirection: Axis.vertical, children: <Widget>[
          homeSlider(),
          for (var i = 0; i < 4; i++)
            Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                height: 280,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        flex: 0,
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              postTitle[i],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ))),
                    Expanded(child: postSlider(snapshot))
                  ],
                ))
        ]);
      },
    );
  }

  Widget homeSlider() {
    return Container(
      height: 260,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              width: 350,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                  onTap: () => {
                        Navigator.pushNamed(context, '/category',
                            arguments: '26')
                      },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'web/assets/img/Mobile-legend.jpg',
                        fit: BoxFit.cover,
                        width: 80,
                      )))),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              width: 350,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                  onTap: () => {
                        Navigator.pushNamed(context, '/category',
                            arguments: '36')
                      },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'web/assets/img/BA.jpg',
                        fit: BoxFit.cover,
                        width: 80,
                      )))),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              width: 350,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('web/assets/img/AK.jpg',
                      fit: BoxFit.cover, width: 80))),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              width: 350,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('web/assets/img/PUBG.jpg',
                      fit: BoxFit.cover, width: 80))),
          Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
              width: 350,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('web/assets/img/ROS.jpg',
                      fit: BoxFit.cover, width: 80))),
        ],
      ),
    );
  }

  Widget postSlider(snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var testApi = snapshot.data?[index];

        return Container(
            alignment: Alignment.topCenter,
            width: 250,
            padding: const EdgeInsets.fromLTRB(0, 20, 15, 0),
            child: InkWell(
                onTap: () => {
                      Navigator.pushNamed(context, '/post',
                          arguments: '${testApi?.id}')
                    },
                child: Column(children: [
                  Expanded(
                    flex: 0,
                    child: Image.network('${testApi?.imageLink}',
                        width: 230, height: 140, fit: BoxFit.fill),
                  ),
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        '${testApi?.title}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ])));
      },
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.black,
          height: 0.5,
        );
      },
      itemCount: snapshot.data?.length ?? 0,
    );
  }
}





//   Widget buildPost(testApi) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Image.network(
//           '${testApi?.imageLink}',
//           fit: BoxFit.cover,
//           width: 150,
//         ),
//         const Padding(
//           padding: EdgeInsets.only(top: 10),
//           child: Text('Post Title',
//               style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white)),
//         ),
//         const Text('Post Description',
//             style: TextStyle(fontSize: 14, color: Colors.white)),
//       ],
//     );
