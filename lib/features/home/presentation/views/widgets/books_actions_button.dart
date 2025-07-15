import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/core/widgets/show_snack_bar.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksActionButton extends StatelessWidget {
  const BooksActionButton({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              fontSize: 22,
              text: 'Free',
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                  bookModel.volumeInfo.previewLink ?? '',
                );
                try {
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    ShowSnackBar(
                      message:
                          'Sorry, could not open the preview link.',
                      // ignore: use_build_context_synchronously
                      context: context,
                    );
                  }
                } catch (e) {
                  ShowSnackBar(
                    message:
                        'An error occurred while trying to open the link.',
                    // ignore: use_build_context_synchronously
                    context: context,
                  );
                }
              },
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              fontSize: 16,
              text: 'Free preview',
            ),
          ),
        ],
      ),
    );
  }
}
