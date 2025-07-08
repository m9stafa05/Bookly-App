import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HoweViewBody extends StatelessWidget {
  const HoweViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          const FeaturedBooksListView(),
          const Gap(50),
          Text(
            'Best Seller',
            style: Styles.textStyle18.copyWith(
              fontFamily: kMontserrat,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(20),
          const BestSellerListViewItems(),
        ],
      ),
    );
  }
}
