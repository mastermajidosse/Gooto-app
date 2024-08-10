import 'dart:convert';

class BlogModel {
  int? id;
  double? rate;
  String? title;
  String? imgurl;
  String? desc;
  String? price;
  List<Comments>? comments;
  List<String>? previewImgs;
  // String? desc;

  BlogModel({
    this.desc,
    this.id,
    this.rate,
    this.title,
    this.price,
    this.imgurl,
    this.comments,
    this.previewImgs,
  });
  BlogModel.fromData(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imgurl = json['imgurl'];
    desc = json['desc'];
    rate = json['rate'];
    previewImgs = json['previewImgs'];
  }
  // if (json['comments'] != null) {
  //   comments = <Comments>[];
  //   json['comments'].forEach((v) {
  //     comments!.add(Comments.fromData(v));
  //   });
  // } else {
  //   comments = <Comments>[];
  // }
  BlogModel.fromData2(Map<String, dynamic> json) {
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromData(v));
      });
      title = json['title'];
      desc = json['content'];
      rate = json['rate'];
      imgurl = json['image'];
    } else {
      title = json['title'];
      desc = json['content'];
      rate = json['rate'];
      imgurl = json['image'];
      comments = <Comments>[];
      previewImgs = json['previewImgs'];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'content': desc,
      "title": title,
      "image": imgurl,
    };
  }

  toJsonarticleall() {
    return jsonEncode({
      "title": title.toString(),
      "image": imgurl.toString(),
      "content": desc.toString(),
      "status": false,
    });
  }

  toJsonVideo() {
    return jsonEncode({
      'content': desc,
      "title": title,
      "image":
          "https://colourlex.com/wp-content/uploads/2021/02/vine-black-painted-swatch-300x300.jpg",
    });
  }
}

class Comments {
  String? name;
  String? comment;
  // String? desc;

  Comments({
    this.name,
    this.comment,
  });

  static Comments fromData(map) {
    print('map');

    print(map);

    return Comments(
      // name: map['author']['name'],
      comment: map['comment'].toString(),
    );
  }
}
