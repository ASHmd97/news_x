import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_x/shared/service_locator.dart';
import 'package:news_x/sources/data/repositories/sources_repository.dart';
import 'package:news_x/sources/view_model/sources_state.dart';

class SourcesViewModel extends Cubit<SourcesState> {
  late final SourcesRepository sourcesRepo;

  SourcesViewModel() : super(SourcesInitial()) {
    sourcesRepo = ServiceLocator.sourcesRepository;
  }

  Future<void> getSources(String categoryId) async {
    emit(GetSourcesLoading());
    try {
      final sources = await sourcesRepo.getSources(categoryId);
      emit(GetSourcesSuccess(sources));
    } catch (e) {
      emit(GetSourcesError(e.toString()));
    }
  }
}
