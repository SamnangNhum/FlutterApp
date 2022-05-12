import 'package:flutter/foundation.dart';
import 'package:html/parser.dart';

import '../models/testApi.dart';
import '../services/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestApiService implements Service {
  @override
  Future<List<AllPostApi>> getTestApi() async {
    List<AllPostApi> testApiList = [];
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
      testApiList.add(AllPostApi.fromJson(body[i]));
    }

    return testApiList;
  }

  @override
  Future<List<CatApi>> getTestCatApi(id) async {
    List<CatApi> testCatApiList = [];

    var url = Uri.parse(
        'https://6666zone.com/wp-json/wp/v2/posts?categories=${id}&_embed');
    final response = await http.get(url);
    var body = json.decode(response.body);
    for (var i = 0; i < body.length; i++) {
      body[i]['title']['rendered'] =
          body[i]['title']['rendered'].replaceAll('^^^^', '');
      testCatApiList.add(CatApi.fromJson(body[i]));
    }

    return testCatApiList;
  }

  Future<List<PostApi>> getPostApi(id) async {
    List<PostApi> postApiList = [];

    var url =
        Uri.parse('https://6666zone.com/wp-json/wp/v2/posts/${id}?_embed');
    final response = await http.get(url);
    var body = json.decode(response.body);
   
    body['title']['rendered'] =
        body['title']['rendered'].replaceAll('^^^^', '');
    postApiList.add(PostApi.fromJson(body));
    print(postApiList);
    return postApiList;
  }
}
