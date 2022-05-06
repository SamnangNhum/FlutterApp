import 'package:flutter/foundation.dart';

import '../models/testApi.dart';
import '../services/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestApiService implements Service {
  @override
  Future<List<TestApi>> getTestApi() async {
    List<TestApi> testApiList = [];
    // https://6666zone.com/wp-json/wp/v2/posts
    // https://jsonplaceholder.typicode.com/todos
    var url = Uri.parse('https://6666zone.com/wp-json/wp/v2/posts?_embed');
    final response = await http.get(url);
    var body = json.decode(response.body);
    // print(body);
    for (var i = 0; i < body.length; i++) {
      // body['media_url'] = body['_embedded']['wp:featuredmedia'][0]['source_url'];
      body[i]['title']['rendered'] =
          body[i]['title']['rendered'].replaceAll('^^^^', '');
      testApiList.add(TestApi.fromJson(body[i]));
    }
    print(testApiList);
    return testApiList;
  }
}
