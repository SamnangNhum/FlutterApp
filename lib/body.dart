import 'package:flutter/material.dart';
import 'widgets/category.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Name()),
                            )
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
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('web/assets/img/BA.jpg',
                          fit: BoxFit.cover, width: 80))),
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
        ),
        for (var i = 0; i < 5; i++)
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                child: const Text('Mobile Legend',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
              Container(
                height: 180,
                padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  for (var i = 0; i < 5; i++)
                    Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: buildPost())
                ]),
              )
            ],
          )
      ],
    );
  }

  Widget buildPost() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'web/assets/img/1.jpg',
          fit: BoxFit.cover,
          width: 150,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text('Post Title',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        const Text('Post Description',
            style: TextStyle(fontSize: 14, color: Colors.white)),
      ],
    );
  }
}
