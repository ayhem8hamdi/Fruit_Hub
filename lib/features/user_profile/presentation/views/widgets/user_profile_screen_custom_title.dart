import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';

class UserProfileScreenCustomTitle extends StatelessWidget {
  const UserProfileScreenCustomTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 19),
        child: Text(
          title,
          style: AppStyles.styleSemiBold16(context).copyWith(
            color: Colors.black,
            height: 1.7,
          ),
        ),
      ),
    );
  }
}
