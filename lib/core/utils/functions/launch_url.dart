import 'package:bookly_app/core/widgets/show_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, {required String? url}) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        ShowSnackBar(
          message: 'Sorry, could not open the preview link.',
          context: context,
        );
      }
    } catch (e) {
      ShowSnackBar(
        message: 'An error occurred while trying to open the link.',
        context: context,
      );
    }
  }
}
