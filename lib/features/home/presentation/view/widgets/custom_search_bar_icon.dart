import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBarCusromIcon extends StatelessWidget {
  const SearchBarCusromIcon({
    super.key,
    required this.svgName,
  });
  final String svgName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 18),
      child: SvgPicture.asset(
        svgName,
        fit: BoxFit.contain,
      ),
    );
  }
}
