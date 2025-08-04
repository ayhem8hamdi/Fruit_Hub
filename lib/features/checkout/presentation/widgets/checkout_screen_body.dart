import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CheckoutScreenBody extends StatelessWidget {
  const CheckoutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomCardAppBar(
          title: 'الشحن',
        ),
        SliverToBoxAdapter(
          child: CheckOutStepsItem(),
        )
      ],
    );
  }
}

class CheckOutStepsItem extends StatelessWidget {
  const CheckOutStepsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(Assets.checkedCheckOutIcon),
        const Gap(5),
        Text(
          'الشحن',
          style: AppStyles.styleBold13(context)
              .copyWith(color: AppColors.kPrimaryColor),
        )
      ],
    );
  }
}
