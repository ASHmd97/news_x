import 'package:flutter/material.dart';
import 'package:news_x/api/api_serves.dart';
import 'package:news_x/home/data/models/category_model.dart';
import 'package:news_x/shared/widgets/error_indicator.dart';
import 'package:news_x/shared/widgets/loading_indicator.dart';
import 'package:news_x/sources/view/widgets/sources_tabs.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServes.getSources(category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return ErrorIndicator(snapshot.error.toString());
        } else if (snapshot.connectionState == ConnectionState.done) {
          return SourcesTabs(sources: snapshot.data!.sources);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
