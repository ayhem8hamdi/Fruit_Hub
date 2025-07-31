import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/payment_method_button.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/payment_type_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaymentMethodsScreenBody extends StatelessWidget {
  const PaymentMethodsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomCardAppBar(
            title: 'المدفوعات',
          ),
          SliverGap(16),
          PaymentTypeItem(text: '**** 1234 ', icon: Assets.paymentOneIcon),
          SliverGap(12),
          PaymentTypeItem(text: '**** 4887 ', icon: Assets.paymentTwoIcon),
          PaymentMethodsButton()
        ],
      ),
    );
  }
}
