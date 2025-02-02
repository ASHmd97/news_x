import 'package:news_x/news/data/data_source/news_data_source.dart';
import 'package:news_x/news/data/models/news_model.dart';

class NewsRepository {
  final NewsDataSource dataSource;

  NewsRepository(this.dataSource);

  Future<List<News>> getNews(String sourceId) async {
    return dataSource.getNews(sourceId);
  }
}
