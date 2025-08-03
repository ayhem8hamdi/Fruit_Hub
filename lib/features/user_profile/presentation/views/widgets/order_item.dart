import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/order_info_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.isExpanded,
    required this.onArrowTap,
  });

  final bool isExpanded;
  final VoidCallback onArrowTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 19, bottom: 19, left: 32),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: const Color(0XFFF2F3F3).withOpacity(0.4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.commandeIcon),
          const Gap(16),
          const Expanded(child: OrderInfosColumn()),
          GestureDetector(
            onTap: onArrowTap,
            child: isExpanded
                ? const RotatedArrow()
                : SvgPicture.asset(
                    Assets.arrowDownIcon,
                  ),
          ),
        ],
      ),
    );
  }
}

class RotatedArrow extends StatelessWidget {
  const RotatedArrow({super.key, this.icon = Assets.arrowDownIcon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 3.1416,
      child: SvgPicture.asset(
        icon,
      ),
    );
  }
}
