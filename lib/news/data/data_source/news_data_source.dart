import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_x/news/data/models/news_response.dart';
import 'package:news_x/shared/api_constant.dart';

class NewsDataSource {
  Future<NewsResponse> getNews(String sourceID) async {
    final uri = Uri.https(APIConstant.baseUrl, APIConstant.newsEndpoint, {
      'apiKey': APIConstant.apiKey,
      'sources': sourceID,
    });

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
