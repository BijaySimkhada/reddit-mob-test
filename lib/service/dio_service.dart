import 'package:dio/dio.dart';
import 'package:reddit/module/model/comment_model.dart';
import 'package:reddit/module/model/post_model.dart';

class DioService {
  Dio dio = Dio();

  getRedditData() async {
    try {
      final res = await dio.get("https://www.reddit.com/r/books/hot/.json");
      final toMapData = res.data['data']['children'];
      List<dynamic> dataList =
          toMapData.map((val) => PostModel.fromJson(val)).toList();
      return dataList;
    } on DioException catch (e) {
      print(e.message);
    }
  }

  getDataDetails(String url) async {
    try {
      final res = await dio.get("https://www.reddit.com$url.json");
      final toMapData = res.data[1]['data']['children'];
      List<dynamic> commentData =
          toMapData.map((value) => CommentModel.fromJson(value)).toList();
      return commentData;
    } on DioException catch (e) {
      print(e.message);
    }
  }
}
