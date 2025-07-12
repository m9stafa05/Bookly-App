import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
Api =>
      https://www.postman.com/restless-space-875499/workspace/students/collection/14058212-d3c30656-4efa-4166-8405-86655985d94d?action=share&creator=14058212

#########
      https://www.googleapis.com/books/v1/volumes?q=programming
##############
Design =>
      https://drive.google.com/file/d/1Y-noGizbczmGe2qEiZ4z9PDyIOoy1csS/view?usp=sharing
Postman =>
      https://elements.getpostman.com/redirect?entityId=14058212-d3c30656-4efa-4166-8405-86655985d94d&entityType=collection
 */
void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
