import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_x/home/data/models/category_model.dart';
import 'package:news_x/shared/widgets/error_indicator.dart';
import 'package:news_x/shared/widgets/loading_indicator.dart';
import 'package:news_x/sources/view/widgets/sources_tabs.dart';
import 'package:news_x/sources/view_model/sources_state.dart';
import 'package:news_x/sources/view_model/sources_view_model.dart';

class SourcesScreen extends StatefulWidget {
  const SourcesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  State<SourcesScreen> createState() => _SourcesScreenState();
}

class _SourcesScreenState extends State<SourcesScreen> {
  final viewModel = SourcesViewModel();

  @override
  void initState() {
    viewModel.getSources(widget.category.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<SourcesViewModel, SourcesState>(
        builder: (context, state) {
          if (state is GetSourcesLoading) {
            return const LoadingIndicator();
          } else if (state is GetSourcesError) {
            return ErrorIndicator(message: state.message);
          } else if (state is GetSourcesSuccess) {
            return SourcesTabs(sources: state.sources);
          } else {
            return const SizedBox();
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

// child: Consumer<SourcesViewModel>(
//         builder: (_, viewModel, __) {
//           if (viewModel.isLoading) {
//             return const LoadingIndicator();
//           } else if (viewModel.errorMessage != null) {
//             return ErrorIndicator(message: viewModel.errorMessage!);
//           } else {
//             return SourcesTabs(sources: viewModel.sources);
//           }
//         },
//       ),