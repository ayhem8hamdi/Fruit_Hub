import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_search_text_field.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/home_screen_user_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeScreenUserListTile(),
        Gap(16),
        CustomSearchTextField(hintText: 'ابحث عن.......'),
        Gap(12),
        CustomCurvedContainer()
      ],
    );
  }
}

class CustomCurvedContainer extends StatelessWidget {
  const CustomCurvedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SoftLeftCurveClipper(),
      child: Container(
        color: const Color(0XFF5DB957),
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'عروض العيد',
            ),
            const Gap(12),
            const Text(
              '%25 خصم',
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.green,
              ),
              child: const Text('تسوق الآن'),
            ),
          ],
        ),
      ),
    );
  }
}

class SoftLeftCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(17, 0);
    path.quadraticBezierTo(0, size.height / 2, 17, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
