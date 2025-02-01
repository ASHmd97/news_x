import 'package:flutter/material.dart';
import 'package:news_x/sources/data/data_source/sources_data_source.dart';
import 'package:news_x/sources/data/models/source_model.dart';

class SourcesViewModel with ChangeNotifier {
  final dateSource = SourcesDataSource();
  bool isLoading = false;
  String? errorMessage;
  List<SourceModel> sources = [];

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await dateSource.getSources(categoryId);

      if (response.status == 'ok' && response.sources.isNotEmpty) {
        sources = response.sources;
      } else {
        errorMessage = 'something ware wrong';
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    
    isLoading = false;
    notifyListeners();
  }
}
