// import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {
  int? id;
  String? name;
  String? url;
  // String? channelImg;
  // String? channelName;
  // String? country;

  VideoModel({
    //this.channelImg,
    this.id,
    this.name,
    this.url,
    // this.country,
    // this.channelName,
  });
  static VideoModel fromData(map) {
    print(map['tags'].toString());
    return VideoModel(
      id: map['id'],
      name: map['name'].toString(),
      url: map['url'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      // 'channelImg': channelImg,
      "name": name,
      "image": url,
    };
  }

  // Create a Video object from Firestore data
  // factory VideoModel.fromFirestore(DocumentSnapshot doc) {
  //   Map data = doc.data() as Map;
  //   return VideoModel(
  //     id: data['id'],
  //     name: data['name'] ?? '',
  //     url: data['url'] ?? '',
  //   );
  // }
}

class AllVideosModel {
  List<VideoModel>? videos;
  int? page;
  int? pages;

  AllVideosModel({this.videos, this.page, this.pages});

  AllVideosModel.fromJson(Map<String, dynamic> json) {
    if (json['videos'] != null) {
      videos = <VideoModel>[];
      json['videos'].forEach((v) {
        videos!.add(VideoModel.fromData(v));
      });
    }
    page = json['page'];
    pages = json['pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['pages'] = this.pages;
    return data;
  }
}
