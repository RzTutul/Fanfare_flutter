// To parse this JSON data, do
//
//     final ContentCategoryResponse = ContentCategoryResponseFromMap(jsonString);

import 'dart:convert';

class ContentCategoryResponse {
  ContentCategoryResponse({
    this.data,
    this.success,
  });

  List<ContentCategory> data;
  String success;

  factory ContentCategoryResponse.fromJson(String str) => ContentCategoryResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentCategoryResponse.fromMap(Map<String, dynamic> json) => ContentCategoryResponse(
    data: List<ContentCategory>.from(json["data"].map((x) => ContentCategory.fromMap(x))),
    success: json["success"],
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
    "success": success,
  };
}

class ContentCategory {
  ContentCategory({
    this.id,
    this.cateName,
    this.cateImage,
  });

  String id;
  String cateName;
  String cateImage;

  factory ContentCategory.fromJson(String str) => ContentCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ContentCategory.fromMap(Map<String, dynamic> json) => ContentCategory(
    id: json["id"],
    cateName: json["cate_name"],
    cateImage: json["cate_image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "cate_name": cateName,
    "cate_image": cateImage,
  };
}
