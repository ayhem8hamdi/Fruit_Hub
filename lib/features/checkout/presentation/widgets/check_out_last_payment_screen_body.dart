import 'package:advanced_ecommerce/core/Utils/app_assets.dart';
import 'package:advanced_ecommerce/core/Utils/app_styles.dart';
import 'package:advanced_ecommerce/core/Utils/responsive_image.dart';
import 'package:advanced_ecommerce/features/card_and_products_details/presentation/views/widgets/custom_card_appbar.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/check_out_step_row.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/confirm_payment_method_item.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/order_resume_item.dart';
import 'package:advanced_ecommerce/features/checkout/presentation/widgets/order_resume_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CheckoutLastPaymentScreenBody extends StatelessWidget {
  const CheckoutLastPaymentScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomCardAppBar(
          title: 'الدفع',
        ),
        SliverGap(16),
        CheckoutStepsRow(
          stepNumber: 3,
        ),
        SliverGap(24),
        OrderResumeTitle(
          title: 'ملخص الطلب :',
        ),
        SliverGap(8),
        OrderResumeItem(),
        SliverGap(16),
        OrderResumeTitle(title: 'يرجي تأكيد  طلبك'),
        SliverGap(8),
        ConfirmPaymentMethodItem()
      ],
    );
  }
}
