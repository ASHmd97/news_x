import 'package:news_x/sources/data/models/source_model.dart';

abstract class SourcesState {}

class SourcesInitial extends SourcesState {}

class GetSourcesLoading extends SourcesState {}

class GetSourcesSuccess extends SourcesState {
  final List<SourceModel> sources;
  GetSourcesSuccess(this.sources);
}

class GetSourcesError extends SourcesState {
  final String message;
  GetSourcesError(this.message);
}
