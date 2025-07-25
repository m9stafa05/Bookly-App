part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksLoading extends NewestBooksState {}

final class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> booksList;

  const NewestBooksSuccess({required this.booksList});
}

final class NewestBooksFailed extends NewestBooksState {
  final String errorMessage;

  const NewestBooksFailed({required this.errorMessage});
}
