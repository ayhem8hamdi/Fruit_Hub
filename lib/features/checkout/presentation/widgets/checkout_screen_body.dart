import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/active_payment_time_choice.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/check_out_step_row.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/inactive_payment_time_choice.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckoutScreenBody extends StatelessWidget {
  const CheckoutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomCardAppBar(
          title: 'الشحن',
        ),
        SliverGap(16),
        CheckoutStepsRow(
          stepNumber: 0,
        ),
        SliverGap(32),
        PaymentMethodSelector()
      ],
    );
  }
}

class PaymentMethodSelector extends StatefulWidget {
  const PaymentMethodSelector({super.key});

  @override
  State<PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  int selectedIndex = 0;

  void onSelect(int index) {
    if (selectedIndex != index) {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  static final List<PaymentItemModel> list = [
    PaymentItemModel(
        title: 'الدفع عند الاستلام',
        subTitle: 'التسليم من المكان',
        price: '40 جنيه'),
    PaymentItemModel(
        title: 'اشتري الان وادفع لاحقا',
        subTitle: 'يرجي تحديد طريقه الدفع',
        price: 'مجاني')
  ];
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: List.generate(2, (index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onSelect(index),
            child: Padding(
              padding: EdgeInsets.only(bottom: index == 0 ? 12 : 0),
              child: isSelected
                  ? ActivePaymentTimeChoice(paymentItemModel: list[index])
                  : InActivePaymentTimeChoice(
                      paymentItemModel: list[index],
                    ),
            ),
          );
        }),
      ),
    );
  }
}

class PaymentItemModel {
  final String title;
  final String subTitle;
  final String price;

  PaymentItemModel(
      {required this.title, required this.subTitle, required this.price});
}
