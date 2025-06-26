import 'package:flutter/material.dart';

class PageViewItemSubtitle extends StatelessWidget {
  const PageViewItemSubtitle({super.key, required this.subtitle});
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37),
      child: Text(
        subtitle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
