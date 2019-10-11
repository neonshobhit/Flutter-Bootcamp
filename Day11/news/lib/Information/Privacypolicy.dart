import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Text(
          "The app news data is being fetched from NEWSAPI.org."
        ),
      ),
    );
  }
}