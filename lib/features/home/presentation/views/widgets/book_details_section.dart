import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_actions_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constants.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .19),
          child: const CustomBookImage(),
        ),
        const Gap(40),
        const Text('The Jungle Book', style: Styles.textStyle30),
        const Gap(2),
        Text(
          'Rudyard Kipling',
          style: Styles.textStyle18.copyWith(
            fontFamily: kMontserrat,
            fontWeight: FontWeight.w400,
            color: const Color(0x92CACACA),
            fontStyle: FontStyle.italic,
          ),
        ),
        const Gap(10),
        const BookRating(mainAxisAlignment: MainAxisAlignment.center),
        const Gap(25),
        const BooksActionButton(),
      ],
    );
  }
}
