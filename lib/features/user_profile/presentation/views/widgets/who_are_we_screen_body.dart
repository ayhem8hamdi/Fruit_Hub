import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WhoAreWeScreenBody extends StatelessWidget {
  const WhoAreWeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomCardAppBar(
            title: 'من نحن',
          ),
          SliverGap(16),
        ],
      ),
    );
  }
}
