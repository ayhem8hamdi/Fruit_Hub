import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/personal_data_change_form.dart';
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
          SliverGap(24),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: PersonalDataChangeForm(),
            ),
          )
        ],
      ),
    );
  }
}
