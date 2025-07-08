import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 20,
        ),
        const Gap(10),
        const Text('4.8', style: Styles.textStyle16),
        const Gap(3),
        Text(
          '(5242)',
          style: Styles.textStyle16.copyWith(
            color: const Color(0xff707070),
          ),
        ),
      ],
    );
  }
}
