import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_actions_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constants.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .19),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
          ),
        ),
        const Gap(40),
        Text(
          bookModel.volumeInfo.title ?? 'Un Known',
          style: Styles.textStyle30,
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(2),
        Text(
          textAlign: TextAlign.center,
          bookModel.volumeInfo.authors![0],
          maxLines: 1,
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
        BooksActionButton(bookModel: bookModel),
      ],
    );
  }
}
