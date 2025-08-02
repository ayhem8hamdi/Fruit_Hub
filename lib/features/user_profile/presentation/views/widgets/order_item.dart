import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/order_info_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(top: 19, bottom: 19, left: 32),
        margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
        color: const Color(0XFFF2F3F3).withOpacity(0.4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.commandeIcon),
            const Gap(16),
            const Expanded(child: OrderInfosColumn()),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(Assets.arrowDownIcon),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
