import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/number_of_selected_products.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/selected_card_item_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardScreenBody extends StatelessWidget {
  const CardScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomCardAppBar(),
          SliverGap(16),
          NumberOfSelectedProductsText(),
          SliverGap(24),
          SelectedcardItemsList(),
        ],
      ),
    );
  }
}
