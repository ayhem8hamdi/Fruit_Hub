import 'package:advanced_ecommerce/features/home/presentation/view/widgets/most_popular_product_screen_body.dart';
import 'package:flutter/material.dart';

class MostPopularProductScreen extends StatelessWidget {
  const MostPopularProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: MostPopularProductScreenBody()),
    );
  }
}
