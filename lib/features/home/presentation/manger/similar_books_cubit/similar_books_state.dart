part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> booksList;

  const SimilarBooksSuccess({required this.booksList});
}

final class SimilarBooksFailed extends SimilarBooksState {
  final String errorMessage;

  const SimilarBooksFailed({required this.errorMessage,});
}
