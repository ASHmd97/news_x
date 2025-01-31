import 'package:news_x/news/data/models/news_model.dart';

class NewsResponse {
  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<News> articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json["status"] ?? "",
      totalResults: json["totalResults"] ?? 0,
      articles: json["articles"] == null
          ? []
          : List<News>.from(json["articles"]!.map((x) => News.fromJson(x))),
    );
  }
}
