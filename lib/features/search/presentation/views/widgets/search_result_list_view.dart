import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/book_list_view_item.dart';
import 'package:bookly_app/core/widgets/custom_error.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/features/search/presentation/mange/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/default_search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount:
                state.booksList.length + 1, // +1 for the header
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Text(
                    'Search Results',
                    style: Styles.textStyle18.copyWith(
                      fontFamily: kMontserrat,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                );
              } else {
                // book index is offset by 1
                final book = state.booksList[index - 1];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  child: BookListViewItem(bookModel: book),
                );
              }
            },
          );
        } else if (state is SearchFailed) {
          return CustomError(errorMessage: state.errorMessage);
        } else if (state is SearchLoading) {
          return const CustomLoadingIndicator();
        } else {
          return const DefaultSearchResult();
        }
      },
    );
  }
}
