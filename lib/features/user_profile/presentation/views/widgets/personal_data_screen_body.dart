import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PersonalDataScreenBody extends StatelessWidget {
  const PersonalDataScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomCardAppBar(
            title: 'الملف الشخصي',
          ),
          SliverGap(24),
        ],
      ),
    );
  }
}
