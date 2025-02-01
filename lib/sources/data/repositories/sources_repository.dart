import 'package:news_x/sources/data/data_source/sources_data_source.dart';
import 'package:news_x/sources/data/models/source_model.dart';

class SourcesRepository {
  final dataSource = SourcesDataSource();

  Future<List<SourceModel>> getSources(String categoryId) async {
    return dataSource.getSources(categoryId);
  }
}
