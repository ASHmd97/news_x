import 'package:news_x/news/data/models/news_model.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class GetNewsLoading extends NewsState {}

class GetNewsSuccess extends NewsState {
  final List<News> newsList;

  GetNewsSuccess(this.newsList);
}

class GetNewsError extends NewsState {
  final String errorMessage;

  GetNewsError(this.errorMessage);
}
