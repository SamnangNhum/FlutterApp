class TestApi {
  int? id;
  String? title;
  String? content;
  String? imageLink;
  // TestApi({this.id , this.title , this.content, this.imageLink});

  TestApi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title']['rendered'];
    content = json['content']['rendered'];
    imageLink = json['_embedded']['wp:featuredmedia'][0]['source_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['imageLink'] = this.imageLink;
    return data;
  }
}
// class TestApi {
//   int? userId;
//   int? id;
//   String? title;


//   TestApi({this.userId, this.id, this.title});

//   TestApi.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     id = json['id'];
//     title = json['title'];

//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userId'] = this.userId;
//     data['id'] = this.id;
//     data['title'] = this.title;

//     return data;
//   }
// }