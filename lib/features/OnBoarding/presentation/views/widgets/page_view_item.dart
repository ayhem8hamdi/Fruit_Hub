import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.bgImage,
      required this.subtitle,
      required this.title});
  final String image, bgImage;
  final String subtitle;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(fit: StackFit.passthrough, children: [
            SvgPicture.asset(
              bgImage,
              color: const Color(0XFFFCF4E3),
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.none,
                ),
              ),
            )
          ]),
        )
      ],
    );
  }
}
