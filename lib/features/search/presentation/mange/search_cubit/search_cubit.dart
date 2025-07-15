import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  SearchRepo searchRepo;
  Future<void> fetchSearchBooks({required String subject}) async {
    emit(SearchLoading());

    var result = await searchRepo.fetchSearchBooks(subject: subject);
    result.fold(
      (failure) {
        emit(SearchFailed(errorMessage: failure.errorMessage));
      },
      (books) {
        emit(SearchSuccess(booksList: books));
      },
    );
  }
}
