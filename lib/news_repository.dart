import 'dart:convert';
import 'models/article_model.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  Future<List<ArticleModel>> fetchNews() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=e4f7e21826c14cfe9d4a78641e7e63ec"));

    var data = jsonDecode(response.body);

    List<ArticleModel> _articleModelList = [];

    for (var item in data["articles"]) {
      ArticleModel _articleModel = ArticleModel.fromJson(item);
      _articleModelList.add(_articleModel);
    }
    return _articleModelList;
  }
}
