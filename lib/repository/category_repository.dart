import 'package:dio/dio.dart';
import 'package:tik_tok_ui/models/category_response.dart';
import 'package:tik_tok_ui/models/video_response.dart';

abstract class ICategoryRepository {
  Future<ContentCategoryResponse> getAllCategory();
}

class CategoryRepository implements ICategoryRepository {
  final Dio _dio = Dio(BaseOptions(
    followRedirects: false,
    // will not throw errors
    validateStatus: (status) => true,
  ));

  @override
  Future<ContentCategoryResponse> getAllCategory() async {

    final response = await _dio.get("https://techtunes999.000webhostapp.com/categories_retrive.php");

    ContentCategoryResponse categoryResponse = ContentCategoryResponse.fromJson(response.data);

    print("Response : ${categoryResponse.toMap()}");
    return categoryResponse;
  }


}
