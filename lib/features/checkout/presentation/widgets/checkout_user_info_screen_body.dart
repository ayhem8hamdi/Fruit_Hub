import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckoutUserInfoScreenBody extends StatelessWidget {
  const CheckoutUserInfoScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomCardAppBar(
          title: 'العنوان',
        ),
        SliverGap(16),
      ],
    );
  }
}
