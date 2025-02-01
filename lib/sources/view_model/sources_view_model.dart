import 'package:flutter/material.dart';
import 'package:news_x/sources/data/models/source_model.dart';
import 'package:news_x/sources/data/repositories/sources_repository.dart';

class SourcesViewModel with ChangeNotifier {
  final sourcesRepo = SourcesRepository();
  bool isLoading = false;
  String? errorMessage;
  List<SourceModel> sources = [];

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();

    try {
      sources = await sourcesRepo.getSources(categoryId);
    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
