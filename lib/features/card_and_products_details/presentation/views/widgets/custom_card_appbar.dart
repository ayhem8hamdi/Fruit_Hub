import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_auth_appbar.dart';
import 'package:flutter/material.dart';

class CustomCardAppBar extends StatelessWidget {
  const CustomCardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomAuthAppbar(
          title: 'السلة',
          isCardAppBar: true,
        ),
      ),
    );
  }
}
