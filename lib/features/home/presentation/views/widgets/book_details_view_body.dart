import 'package:bookly_app/features/home/presentation/views/widgets/custom_books_details_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(children: [CustomBookDetailsAppBar()]),
    );
  }
}