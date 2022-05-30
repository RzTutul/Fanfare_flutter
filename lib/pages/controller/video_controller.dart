import 'package:get/get.dart';
import 'package:tik_tok_ui/models/video_response.dart';
import 'package:tik_tok_ui/repository/video_repository.dart';

class FVideoController extends GetxController {
  final VideoRepository _videoRepository = Get.put(VideoRepository());
  final datalist = <ContentData>[].obs;

  Future<VideoResponse> getAllContentList() async{
    VideoResponse response =await _videoRepository.getAllVideoList();
    datalist.assignAll(response.data);
    return response;
  }

  @override
  void onInit() {
    print("calling");

    getAllContentList();
    super.onInit();
  }
}
