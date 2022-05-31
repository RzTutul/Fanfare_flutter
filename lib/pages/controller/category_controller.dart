
import 'package:get/get.dart';
import 'package:tik_tok_ui/models/category_response.dart';
import 'package:tik_tok_ui/repository/category_repository.dart';

class CategoryController extends GetxController{

  final caterepo = Get.put(CategoryRepository());
  final catelist = <ContentCategory>[].obs;

  Future<bool> getCotentCategory() async {
    ContentCategoryResponse response = await  caterepo.getAllCategory();
    catelist.assignAll(response.data);
  }

  @override
  void onInit() {
    getCotentCategory();
    super.onInit();
  }
}