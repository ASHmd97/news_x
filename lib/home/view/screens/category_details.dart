import 'package:flutter/material.dart';
import 'package:news_x/home/data/models/category_model.dart';
import 'package:news_x/shared/widgets/error_indicator.dart';
import 'package:news_x/shared/widgets/loading_indicator.dart';
import 'package:news_x/sources/view/widgets/sources_tabs.dart';
import 'package:news_x/sources/view_model/sources_view_model.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SourcesViewModel()..getSources(category.id),
      child: Consumer<SourcesViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(message: viewModel.errorMessage!);
          } else {
            return SourcesTabs(sources: viewModel.sources);
          }
        },
      ),
    );
  }
}
// FutureBuilder(
//       future: ApiServes.getSources(category.id),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const LoadingIndicator();
//         } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
//           return ErrorIndicator(message: snapshot.error.toString());
//         } else if (snapshot.connectionState == ConnectionState.done) {
//           return SourcesTabs(sources: snapshot.data!.sources);
//         } else {
//           return const SizedBox();
//         }
//       },