// To parse this JSON data, do
//
//     final videoResponse = videoResponseFromMap(jsonString);

import 'dart:convert';

class VideoResponse {
  VideoResponse({
    this.data,
    this.success,
  });

  List<ContentData> data;
  String success;

  factory VideoResponse.fromJson(String str) => VideoResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoResponse.fromMap(Map<String, dynamic> json) => VideoResponse(
    data: List<ContentData>.from(json["data"].map((x) => ContentData.fromMap(x))),
    success: json["success"],
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "success": success,
  };
}

class ContentData {
  ContentData({
    this.id,
    this.videoUrl,
    this.name,
    this.caption,
    this.songName,
    this.profileImg,
    this.likes,
    this.comments,
    this.shares,
    this.albumImg,
  });

  String id;
  String videoUrl;
  String name;
  String caption;
  String songName;
  String profileImg;
  String likes;
  String comments;
  String shares;
  String albumImg;

  factory ContentData.fromJson(String str) => ContentData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentData.fromMap(Map<String, dynamic> json) => ContentData(
    id: json["id"],
    videoUrl: json["videoUrl"],
    name: json["name"],
    caption: json["caption"],
    songName: json["songName"],
    profileImg: json["profileImg"],
    likes: json["likes"],
    comments: json["comments"],
    shares: json["shares"],
    albumImg: json["albumImg"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "videoUrl": videoUrl,
    "name": name,
    "caption": caption,
    "songName": songName,
    "profileImg": profileImg,
    "likes": likes,
    "comments": comments,
    "shares": shares,
    "albumImg": albumImg,
  };
}
