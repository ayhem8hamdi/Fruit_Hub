import 'package:advanced_ecommerce/features/user_profile/domain/entities/order_steps_data_entity.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/vertical_time_line.dart';
import 'package:flutter/material.dart';

class OrderDetailsContent extends StatelessWidget {
  const OrderDetailsContent({super.key});

  static final List<OrderStepDataEntity> steps = [
    OrderStepDataEntity(
        label: 'تتبع الطلب', value: '22 مارس , 2024', isCompleted: true),
    OrderStepDataEntity(
        label: 'قبول الطلب', value: '22 مارس , 2024', isCompleted: true),
    OrderStepDataEntity(
        label: 'تم شحن الطلب', value: '22 مارس , 2024', isCompleted: false),
    OrderStepDataEntity(
        label: 'خرج للتوصيل', value: 'قيد الانتظار', isCompleted: false),
    OrderStepDataEntity(
        label: 'تم تسليم', value: 'تم التسليم', isCompleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return VerticalTimeline(steps: steps);
  }
}
