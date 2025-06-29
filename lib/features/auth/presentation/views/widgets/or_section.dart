import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class OrSection extends StatelessWidget {
  const OrSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HorizDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Text(
            'أو',
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: const Color(0XFF0C0D0D)),
          ),
        ),
        const HorizDivider(),
      ],
    );
  }
}

class HorizDivider extends StatelessWidget {
  const HorizDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Divider(
        thickness: 2,
        color: Color(0xFFDDDFDF),
      ),
    );
  }
}
