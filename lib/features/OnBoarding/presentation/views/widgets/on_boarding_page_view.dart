import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        PageViewItem(
          image: Assets.pageView1Image,
          bgImage: Assets.pageView1BgImage,
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: CustomPageView1Title(),
        )
      ],
    );
  }
}

class CustomPageView1Title extends StatelessWidget {
  const CustomPageView1Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text('مرحبًا بك في'),
        Text('HUB'),
        Text('Fruit'),
      ],
    );
  }
}
