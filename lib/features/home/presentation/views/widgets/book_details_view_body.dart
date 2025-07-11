import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_books_details_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          const Gap(10),
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
       
        ],
      ),
    );
  }
}
