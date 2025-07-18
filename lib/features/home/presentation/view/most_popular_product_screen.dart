import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_bottom_nav_bar.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/most_popular_product_screen_body.dart';
import 'package:flutter/material.dart';

class MostPopularProductScreen extends StatefulWidget {
  const MostPopularProductScreen({super.key});

  @override
  State<MostPopularProductScreen> createState() =>
      _MostPopularProductScreenState();
}

class _MostPopularProductScreenState extends State<MostPopularProductScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const MostPopularProductScreenBody(),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}
