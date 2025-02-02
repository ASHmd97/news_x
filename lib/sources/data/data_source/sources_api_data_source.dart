import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_x/shared/api_constant.dart';
import 'package:news_x/sources/data/data_source/sources_data_source.dart';
import 'package:news_x/sources/data/models/source_model.dart';
import 'package:news_x/sources/data/models/sources_response.dart';

class SourcesApiDataSource extends SourcesDataSource {
  @override
  Future<List<SourceModel>> getSources(String categoryId) async {
    final uri = Uri.https(APIConstant.baseUrl, APIConstant.sourcesEndpoint, {
      'apiKey': APIConstant.apiKey,
      'category': categoryId,
    });

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final sourcesResponse = SourcesResponse.fromJson(json);

    if (sourcesResponse.status == 'ok' && sourcesResponse.sources.isNotEmpty) {
      return sourcesResponse.sources;
    } else {
      throw Exception('something ware wrong');
    }
  }
}
