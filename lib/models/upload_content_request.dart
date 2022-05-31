
import 'dart:convert';

class UploadContent {
  UploadContent({
    this.name,
    this.caption,
    this.songName,
    this.profileImg,
    this.likes,
    this.comments,
    this.shares,
    this.albumImg,
  });

  String name;
  String caption;
  String songName;
  String profileImg;
  String likes;
  String comments;
  String shares;
  String albumImg;

  factory UploadContent.fromJson(String str) => UploadContent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UploadContent.fromMap(Map<String, dynamic> json) => UploadContent(
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
