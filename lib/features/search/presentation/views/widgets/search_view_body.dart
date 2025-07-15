import 'package:bookly_app/features/search/presentation/mange/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController searchController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onPressed: () {
              BlocProvider.of<SearchCubit>(
                context,
              ).fetchSearchBooks(subject: searchController.text);
            },
            searchController: searchController,
          ),
          const SizedBox(height: 20),
          const Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
