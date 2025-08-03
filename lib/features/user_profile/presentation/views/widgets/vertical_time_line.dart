import 'package:advanced_ecommerce/features/user_profile/domain/entities/order_steps_data_entity.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/time_line_step_item.dart';
import 'package:flutter/material.dart';

class VerticalTimeline extends StatelessWidget {
  final List<OrderStepDataEntity> steps;

  const VerticalTimeline({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        steps.length,
        (index) => TimelineStepItem(
          step: steps[index],
          isFirst: index == 0,
          isLast: index == steps.length - 1,
          showConnector: index != steps.length - 1,
          connectorColor: steps[index].isCompleted
              ? const Color(0XFF28B446)
              : const Color(0XFFF4F5F9),
        ),
      ),
    );
  }
}
