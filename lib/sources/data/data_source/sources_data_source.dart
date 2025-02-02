import 'package:news_x/sources/data/models/source_model.dart';

abstract class SourcesDataSource {
  Future<List<SourceModel>> getSources(String categoryId);
}
