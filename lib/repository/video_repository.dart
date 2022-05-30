import 'package:dio/dio.dart';
import 'package:tik_tok_ui/models/video_response.dart';

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
}
