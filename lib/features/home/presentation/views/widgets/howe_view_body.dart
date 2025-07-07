import 'package:bookly_app/core/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_bokks_list_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HoweViewBody extends StatelessWidget {
  const HoweViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
          Gap(50),
          Text('Best Seller', style: Styles.titleMedium),
        ],
      ),
    );
  }
}
