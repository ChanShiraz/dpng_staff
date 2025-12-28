import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future<void> launch(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await canLaunchUrl(uri)) {
      throw 'Could not launch $url';
    }

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }
}
