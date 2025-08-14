import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/core/Utils/responsive_image.dart';
import 'package:advanced_ecommerce/core/Utils/ui_errors_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({super.key, this.width});
  final double? width;
  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int _quantity = 0;

  void _increment() => setState(() => _quantity++);
  void _decrement() {
    if (_quantity == 0) {
      UiHandler.showFlushBar(
        context,
        'عذرًا، لا يمكن إنقاص الكمية أكثر',
      );
    }
    if (_quantity > 0) setState(() => _quantity--);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedQuantityChangerIcon(
          image: Assets.svgaddproductIcon,
          width: widget.width,
          onTap: _increment,
        ),
        const Gap(16),
        Text(
          '$_quantity',
          style: AppStyles.styleBold16(context)
              .copyWith(color: const Color(0XFF06140C)),
        ),
        const Gap(16),
        ConstrainedQuantityChangerIcon(
          image: Assets.svgRemoveProductIcon,
          width: widget.width,
          onTap: _decrement,
        ),
      ],
    );
  }
}

class ConstrainedQuantityChangerIcon extends StatelessWidget {
  const ConstrainedQuantityChangerIcon(
      {super.key, required this.image, required this.onTap, this.width});
  final String image;
  final void Function()? onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ResponsiveImage(
        imageDesignWidth: width ?? 36,
        screenDesignWidth: 375,
        imageDesignAspectRatio: 1,
        customImageWidget: SvgPicture.asset(image),
      ),
    );
  }
}
