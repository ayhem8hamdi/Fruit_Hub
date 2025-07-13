import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [HomeScreenUserListTile()],
      ),
    );
  }
}

class HomeScreenUserListTile extends StatelessWidget {
  const HomeScreenUserListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListTile(
        leading: SvgPicture.asset(
          Assets.userIcon,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
