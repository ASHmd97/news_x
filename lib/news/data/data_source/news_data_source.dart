import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_x/news/data/models/news_model.dart';
import 'package:news_x/news/data/models/news_response.dart';
import 'package:news_x/shared/api_constant.dart';

class NewsDataSource {
  Future<List<News>> getNews(String sourceID) async {
    final uri = Uri.https(APIConstant.baseUrl, APIConstant.newsEndpoint, {
      'apiKey': APIConstant.apiKey,
      'sources': sourceID,
    });

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final newsResponse = NewsResponse.fromJson(json);

    if (newsResponse.status == 'ok') {
      return newsResponse.articles;
    } else {
      throw Exception('Failed To Get The Articles');
    }
  }
}
