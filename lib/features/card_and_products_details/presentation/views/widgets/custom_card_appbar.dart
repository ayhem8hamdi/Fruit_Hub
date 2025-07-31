import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/custom_auth_appbar.dart';
import 'package:flutter/material.dart';

class CustomCardAppBar extends StatelessWidget {
  const CustomCardAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomAuthAppbar(
          title: title,
          isCardAppBar: true,
        ),
      ),
    );
  }
}
