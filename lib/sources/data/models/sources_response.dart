import 'package:news_x/sources/data/models/source_model.dart';

class SourcesResponse {
  SourcesResponse({
    required this.status,
    required this.sources,
  });

  final String status;
  final List<SourceModel> sources;

  factory SourcesResponse.fromJson(Map<String, dynamic> json) {
    return SourcesResponse(
      status: json["status"] ?? "",
      sources: json["sources"] == null
          ? []
          : List<SourceModel>.from(
              json["sources"]!.map((x) => SourceModel.fromJson(x))),
    );
  }
}
