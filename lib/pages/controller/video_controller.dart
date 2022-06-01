import 'package:get/get.dart';
import 'package:tik_tok_ui/models/video_response.dart';
import 'package:tik_tok_ui/repository/video_repository.dart';
import 'dart:io';

import '../../models/upload_content_request.dart';

class FVideoController extends GetxController {
  final VideoRepository _videoRepository = Get.put(VideoRepository());
  final datalist = <ContentData>[].obs;
  final video = ContentData().obs;
  final videopath = "".obs;

  Future<VideoResponse> getAllContentList() async{
    VideoResponse response =await _videoRepository.getAllVideoList();
    datalist.assignAll(response.data);
    return response;
  }

  Future<String> uploadFile(String path, UploadContent content) async {

    final response = await _videoRepository.uploadFile(path, content);
    return response;
  }
    @override
  void onInit() {
    print("calling");

    getAllContentList();
    super.onInit();
  }
}
