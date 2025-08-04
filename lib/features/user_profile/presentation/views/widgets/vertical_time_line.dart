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
        (index) {
          final isLast = index == steps.length - 1;
          final isCompleted = steps[index].isCompleted;
          final nextCompleted = !isLast && steps[index + 1].isCompleted;
          final connectorColor = isCompleted && nextCompleted
              ? const Color(0XFF28B446)
              : Colors.grey.shade400;

          return TimelineStepItem(
            step: steps[index],
            isFirst: index == 0,
            isLast: isLast,
            showConnector: !isLast,
            connectorColor: connectorColor,
          );
        },
      ),
    );
  }
}
