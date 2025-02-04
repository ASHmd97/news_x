import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_x/news/data/repositories/news_repository.dart';
import 'package:news_x/news/view_model/news_state.dart';
import 'package:news_x/shared/service_locator.dart';

class NewsViewModel extends Cubit<NewsState> {
  late final NewsRepository newsRepo;

  NewsViewModel() : super(NewsInitial()) {
    newsRepo = ServiceLocator.newsRepository;
  }

  Future<void> getNews(String sourceId) async {
    emit(GetNewsLoading());
    try {
      final news = await newsRepo.getNews(sourceId);
      emit(GetNewsSuccess(news));
    } catch (e) {
      emit(GetNewsError(e.toString()));
    }
  }
}
