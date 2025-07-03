import 'package:advanced_ecommerce/core/Utils/ui_errors_handler.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:advanced_ecommerce/features/auth/presentation/manager/signup_cubit/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignUpButtonBlocBuilder extends StatelessWidget {
  const SignUpButtonBlocBuilder({super.key, this.onSignUpPressed});
  final void Function()? onSignUpPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSucces) {
          UiHandler.showFlushBarThen(
            context,
            "SignUp Successful",
            () {
              Get.back();
            },
            isError: false,
          );
        } else if (state is SignUpFailed) {
          UiHandler.showFlushBarThen(
            context,
            state.failure.message,
            () {
              // Optionally do something after the error flushbar dismisses
            },
            isError: true,
          );
        }
      },
      builder: (context, state) {
        if (state is SignUpLoading) {
          return const OnBoardingButton(
            isLoading: true,
            isActive: true,
          );
        }

        return OnBoardingButton(
            isActive: true, text: 'إنشاء حساب', onTap: onSignUpPressed);
      },
    );
  }
}
