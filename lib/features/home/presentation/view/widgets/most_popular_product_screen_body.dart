import 'package:advanced_ecommerce/features/home/presentation/view/widgets/custom_most_popular_product_appbar.dart';
import 'package:flutter/widgets.dart';

class MostPopularProductScreenBody extends StatelessWidget {
  const MostPopularProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomMostPopularProductAppbar(
          title: 'الأكثر مبيعًا',
        )
      ],
    );
  }
}
