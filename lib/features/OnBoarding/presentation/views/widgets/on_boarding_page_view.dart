import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
    required this.isLastPage,
  });

  final PageController pageController;
  final Function(int) onPageChanged;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      reverse: true,
      children: [
        PageViewItem(
          color: const Color(0XFFFCF4E3),
          image: Assets.pageView1Image,
          bgImage: Assets.pageView1BgImage,
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: const CustomPageView1Title(),
          isLastPage: isLastPage,
        ),
        PageViewItem(
          isLastPage: isLastPage,
          image: Assets.pageView2Image,
          bgImage: Assets.pageView2BgImage,
          subtitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title: const Text(
            'ابحث وتسوق',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class CustomPageView1Title extends StatelessWidget {
  const CustomPageView1Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('مرحبًا بك في'),
        Text('HUB'),
        Text('Fruit'),
      ],
    );
  }
}
