import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConnectLoginOptions extends StatelessWidget {
  const ConnectLoginOptions({super.key});

  static const List<Map<String, String>> _loginOptions = [
    {
      'icon': Assets.googleIcon,
      'text': 'التسجيل بواسطة جوجل',
    },
    {
      'icon': Assets.appelIcon,
      'text': 'التسجيل بواسطة أبل',
    },
    {
      'icon': Assets.facebookIcon,
      'text': 'التسجيل بواسطة فيسبوك',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        _loginOptions.length,
        (index) {
          final item = _loginOptions[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ConnectLoginItem(
              assetName: item['icon']!,
              text: item['text']!,
            ),
          );
        },
      ),
    );
  }
}

class ConnectLoginItem extends StatelessWidget {
  const ConnectLoginItem({
    super.key,
    required this.assetName,
    required this.text,
  });

  final String assetName;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
