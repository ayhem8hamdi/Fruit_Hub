import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/add_payment_method_form.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddPaymentMethodScreenBody extends StatelessWidget {
  const AddPaymentMethodScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomCardAppBar(
            title: 'اضافه بطاقه جديده',
          ),
          SliverGap(24),
          SliverFillRemaining(
              hasScrollBody: false, child: AddPaymentMethodForm()),
        ],
      ),
    );
  }
}
