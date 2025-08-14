import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/product_details_screen_body.dart';
import 'package:advanced_ecommerce/features/home/data/models/fruit_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FruitModel fruit = Get.arguments as FruitModel;
    return Scaffold(
      body: ProductDetailsScreenBody(
        fruitModel: fruit,
      ),
    );
  }
}
