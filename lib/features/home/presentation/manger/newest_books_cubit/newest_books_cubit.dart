import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repo/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var results = await homeRepo.fetchNewestBooks();
    results.fold(
      (failure) {
        emit(NewestBooksFailed(errorMessage: failure.errorMessage));
      },
      (books) {
        emit(NewestBooksSuccess(booksList: books));
      },
    );
  }
}
