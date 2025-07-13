import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/services_locator.dart';
import 'package:bookly_app/features/home/data/repo/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

/*
Api =>
#########
      https://www.googleapis.com/books/v1/volumes?q=programming
#########
Design =>
      https://drive.google.com/file/d/1Y-noGizbczmGe2qEiZ4z9PDyIOoy1csS/view?usp=sharing
Postman =>
      https://elements.getpostman.com/redirect?entityId=14058212-d3c30656-4efa-4166-8405-86655985d94d&entityType=collection
 */
void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
