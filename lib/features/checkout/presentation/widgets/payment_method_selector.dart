import 'package:advanced_ecommerce/features/checkout/domain/entities/payment_method_entity.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/active_payment_time_choice.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/inactive_payment_time_choice.dart';
import 'package:flutter/material.dart';

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

  static final List<PaymentMethodEntity> list = [
    PaymentMethodEntity(
        title: 'الدفع عند الاستلام',
        subTitle: 'التسليم من المكان',
        price: '40 جنيه'),
    PaymentMethodEntity(
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
