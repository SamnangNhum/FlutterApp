class AllPostApi {
  int? id;
  String? title;
  String? content;
  String? imageLink;
  // TestApi({this.id , this.title , this.content, this.imageLink});

  AllPostApi.fromJson(Map<String, dynamic> json) {
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

class CatApi {
  int? id;
  String? title;
  String? content;
  String? imageLink;
  // TestApi({this.id , this.title , this.content, this.imageLink});

  CatApi.fromJson(Map<String, dynamic> json) {
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

class PostApi {
  int? id;
  String? title;
  String? content;
  String? imageLink;
  // TestApi({this.id , this.title , this.content, this.imageLink});

 PostApi.fromJson(Map<String, dynamic> json) {
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
