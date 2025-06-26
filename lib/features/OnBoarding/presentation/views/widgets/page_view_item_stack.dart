import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewItemStack extends StatelessWidget {
  const PageViewItemStack({
    super.key,
    required this.bgImage,
    required this.image,
    this.color,
  });

  final String bgImage;
  final String image;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(fit: StackFit.passthrough, children: [
        SvgPicture.asset(
          bgImage,
          color: color,
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
        ),
        const Padding(
          padding: EdgeInsets.only(top: 36, right: 20),
          child: Text('تخط'),
        )
      ]),
    );
  }
}
