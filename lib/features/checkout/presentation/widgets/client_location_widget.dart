import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/confirm_payment_method_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ClientLocationWidget extends StatelessWidget {
  const ClientLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
        margin: const EdgeInsets.symmetric(horizontal: 19),
        decoration: BoxDecoration(
            color: const Color(0XFFF2F3F3).withOpacity(0.4),
            borderRadius: BorderRadius.circular(4)),
        child: Column(
          children: [
            const ConfirmOrderScreenRow(
              text: 'عنوان التوصيل',
            ),
            const Gap(9),
            Row(
              children: [
                SvgPicture.asset(Assets.locationIcon),
                const Gap(8),
                Text(
                  'شارع النيل، مبنى رقم ١٢٣',
                  style: AppStyles.styleRegular16(context)
                      .copyWith(color: const Color(0XFF4E5556)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
