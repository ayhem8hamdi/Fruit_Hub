import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_colors.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
  });

  final PageController pageController;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      reverse: true,
      children: [
        const PageViewItem(
          color: Color(0XFFFCF4E3),
          image: Assets.pageView1Image,
          bgImage: Assets.pageView1BgImage,
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: CustomPageView1Title(),
        ),
        PageViewItem(
          image: Assets.pageView2Image,
          bgImage: Assets.pageView2BgImage,
          subtitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title: Text(
            'ابحث وتسوق',
            textAlign: TextAlign.center,
            style: AppStyles.styleBold23(context),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ' مرحبًا بك في ',
          style: AppStyles.styleBold23(context),
        ),
        Text('HUB',
            style: AppStyles.styleBold23(context)
                .copyWith(color: const Color(0XFFF4A91F))),
        Text(
          'Fruit',
          style: AppStyles.styleBold23(context)
              .copyWith(color: AppColors.kPrimaryColor),
        ),
      ],
    );
  }
}
