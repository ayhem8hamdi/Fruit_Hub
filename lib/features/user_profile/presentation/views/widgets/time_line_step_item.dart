import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/features/user_profile/domain/entities/order_steps_data_entity.dart';
import 'package:advanced_ecommerce/features/user_profile/presentation/views/widgets/time_line_dot.dart';
import 'package:flutter/material.dart';

class TimelineStepItem extends StatelessWidget {
  final OrderStepDataEntity step;
  final bool isLast;
  final bool isFirst;
  final bool showConnector;
  final Color connectorColor;

  const TimelineStepItem({
    super.key,
    required this.step,
    required this.isLast,
    required this.showConnector,
    required this.connectorColor,
    required this.isFirst,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.translate(
          offset: const Offset(0, 9.8),
          child: Column(
            children: [
              TimelineDot(isCompleted: step.isCompleted),
              if (showConnector)
                Container(
                  width: 1,
                  height: 23,
                  color: connectorColor,
                ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(step.label,
                    style: AppStyles.styleSemiBold13(context).copyWith(
                        color: step.isCompleted
                            ? const Color(0XFF0C0D0D)
                            : const Color(0XFF949D9E))),
                Text(step.value,
                    style: AppStyles.styleBold13(context)
                        .copyWith(color: const Color(0XFF949D9E))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
