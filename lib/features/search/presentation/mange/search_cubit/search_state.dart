part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<BookModel> booksList;

  const SearchSuccess({required this.booksList});
}

final class SearchFailed extends SearchState {
  final String errorMessage;

  const SearchFailed({required this.errorMessage});
}
