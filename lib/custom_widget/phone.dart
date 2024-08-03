import 'package:url_launcher/url_launcher.dart';

class PhoneDialer {
   void launchPhoneDialer(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: Uri.encodeFull(phoneNumber));
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      throw 'Не удалось запустить $phoneUri';
    }
  }
}