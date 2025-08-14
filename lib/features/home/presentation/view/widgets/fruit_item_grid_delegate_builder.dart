import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/home/data/models/fruit_model.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/fruit_grid_item.dart';
import 'package:flutter/material.dart';

class FruitItemGridDelegateBuilder extends StatelessWidget {
  const FruitItemGridDelegateBuilder({super.key, this.color});

  final Color? color;
  static final List<FruitModel> fruitList = [
    FruitModel(
        imagelink: Assets.waterMelonImage,
        productName: 'بطيخ',
        price: '30جنية'),
    FruitModel(
        imagelink: Assets.fraisePng, productName: 'فراولة', price: "20جنية"),
    FruitModel(
        imagelink: Assets.ananasIcon, productName: 'أناناس', price: '200جنية'),
    FruitModel(
        imagelink: Assets.mangoImage, productName: 'مانجو', price: '150جنية'),
    FruitModel(
        imagelink: Assets.avocadoImage,
        productName: 'أفوكادو',
        price: '90جنية'),
    FruitModel(
        imagelink: Assets.bananasImage, productName: 'موز', price: '50جنية'),
    FruitModel(
        imagelink: Assets.waterMelonImage,
        productName: 'بطيخ',
        price: '30جنية'),
    FruitModel(
        imagelink: Assets.fraisePng, productName: 'فراولة', price: "20جنية"),
    FruitModel(
        imagelink: Assets.ananasIcon, productName: 'أناناس', price: '200جنية'),
    FruitModel(
        imagelink: Assets.mangoImage, productName: 'مانجو', price: '150جنية'),
    FruitModel(
        imagelink: Assets.avocadoImage,
        productName: 'أفوكادو',
        price: '90جنية'),
    FruitModel(
        imagelink: Assets.bananasImage, productName: 'موز', price: '50جنية'),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 163 / 214,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) =>
              FruitGridItem(color: color, fruitModel: fruitList[index]),
          childCount: fruitList.length,
        ),
      ),
    );
  }
}
