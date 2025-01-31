import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_x/news/data/models/news_response.dart';
import 'package:news_x/shared/api_constant.dart';
import 'package:news_x/sources/data/models/sources_response.dart';

class ApiServes {
  static Future<SourcesResponse> getSources(String categoryID) async {
    final uri = Uri.https(APIConstant.baseUrl, APIConstant.sourcesEndpoint, {
      'apiKey': APIConstant.apiKey,
      'category': categoryID,
    });

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(String sourceID) async {
    final uri = Uri.https(APIConstant.baseUrl, APIConstant.newsEndpoint, {
      'apiKey': APIConstant.apiKey,
      'sources': sourceID,
    });

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
