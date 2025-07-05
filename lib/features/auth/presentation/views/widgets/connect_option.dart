import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/auth/presentation/manager/social_media_auth_cubit/cubit/social_media_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ConnectLoginOptions extends StatelessWidget {
  const ConnectLoginOptions({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: ConnectLoginItem(
          assetName: Assets.googleIcon,
          text: 'التسجيل بواسطة جوجل',
          onTap: () {
            print('tapped');
            context.read<SocialMediaAuthCubit>().loginWithGoogle();
          },
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: ConnectLoginItem(
          assetName: Assets.appelIcon,
          text: 'التسجيل بواسطة أبل',
          onTap: null,
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: ConnectLoginItem(
          assetName: Assets.facebookIcon,
          text: 'التسجيل بواسطة فيسبوك',
          onTap: null,
        ),
      ),
    ]);
  }
}

class ConnectLoginItem extends StatelessWidget {
  const ConnectLoginItem({
    super.key,
    required this.assetName,
    required this.text,
    this.onTap,
  });

  final String assetName;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFE6E9EA),
            width: 1.6,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.5),
              child: SvgPicture.asset(assetName),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    text,
                    style: AppStyles.styleSemiBold16(context)
                        .copyWith(color: const Color(0xFF0C0D0D)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
