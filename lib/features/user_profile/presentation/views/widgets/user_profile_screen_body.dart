import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/custom_user_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserProfileScreenBody extends StatelessWidget {
  const UserProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        slivers: [CustomUserAppBar(), SliverGap(16)],
      ),
    );
  }
}
