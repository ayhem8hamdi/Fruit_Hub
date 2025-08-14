import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/features/home/data/models/fruit_model.dart';
import 'package:advanced_ecommerce/features/home/presentation/view/widgets/horiz_list_fruit_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductsHorizList extends StatelessWidget {
  const ProductsHorizList({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: ResponsiveHorizontalRowList(),
    );
  }
}

class ResponsiveHorizontalRowList extends StatelessWidget {
  const ResponsiveHorizontalRowList({super.key});

  static final List<FruitModel> list = [
    FruitModel(
        id: 0,
        imagelink: Assets.fraisePng,
        productName: 'فراولة',
        price: "20جنية"),
    FruitModel(
        id: 1,
        imagelink: Assets.mangoImage,
        productName: 'مانجو',
        price: '150جنية'),
    FruitModel(
        id: 2,
        imagelink: Assets.avocadoImage,
        productName: 'أفوكادو',
        price: '90جنية'),
    FruitModel(
        id: 3,
        imagelink: Assets.bananasImage,
        productName: 'موز',
        price: '50جنية'),
    FruitModel(
        id: 4,
        imagelink: Assets.fraisePng,
        productName: 'فراولة',
        price: "20جنية"),
    FruitModel(
        id: 5,
        imagelink: Assets.mangoImage,
        productName: 'مانجو',
        price: '150جنية'),
    FruitModel(
        id: 6,
        imagelink: Assets.avocadoImage,
        productName: 'أفوكادو',
        price: '90جنية'),
    FruitModel(
        id: 7,
        imagelink: Assets.bananasImage,
        productName: 'موز',
        price: '50جنية'),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Row(
            children: List.generate(list.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 9),
                child: HorizListFruitItem(
                  fruitModel: list[index],
                ),
              );
            }),
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
