import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:flutter/material.dart';

class CheckoutScreenBody extends StatelessWidget {
  const CheckoutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomCardAppBar(
          title: 'الشحن',
        ),
      ],
    );
  }
}
