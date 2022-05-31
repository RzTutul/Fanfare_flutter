import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tik_tok_ui/models/video_response.dart';

import '../models/upload_content_request.dart';

abstract class IVideoRepository {
  Future<VideoResponse> getAllVideoList();
}

class VideoRepository implements IVideoRepository {
  final Dio _dio = Dio(BaseOptions(
    followRedirects: false,
    // will not throw errors
    validateStatus: (status) => true,
  ));

  @override
  Future<VideoResponse> getAllVideoList() async {

    final response = await _dio.get("http://techtunes999.000webhostapp.com/video_retrive.php");

    VideoResponse videoResponse = VideoResponse.fromJson(response.data);

    print("Response : ${videoResponse.toMap()}");
    return videoResponse;
  }

  Future<String> uploadFile(String path,UploadContent content) async {
    FormData formData = new FormData.fromMap({
      'file':await MultipartFile.fromFile(path,
          filename: "testing.mp4"),
      "name" : content.name,
      "caption" : content.caption,
      "songName" : content.songName,
      "profileImg" : content.profileImg,
      "likes" : content.likes,
      "comments" : content.comments,
      "shares" : content.shares,
      "albumImg" : content.albumImg,
    });
    var response = await _dio.post("https://techtunes999.000webhostapp.com/uploadcontentvideo.php",data: formData);
    print("upload staus: ${response}");
    return response.data;
  }
}
