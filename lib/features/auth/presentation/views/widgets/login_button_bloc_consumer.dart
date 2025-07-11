import 'package:advanced_ecommerce/core/Utils/app_router.dart';
import 'package:advanced_ecommerce/core/Utils/ui_errors_handler.dart';
import 'package:advanced_ecommerce/features/OnBoarding/presentation/views/widgets/on_boarding_button.dart';
import 'package:advanced_ecommerce/features/auth/presentation/manager/login_cubit/cubit/login_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LoginButtonBlocConsumer extends StatelessWidget {
  const LoginButtonBlocConsumer({super.key, this.onLoginPressed});
  final void Function()? onLoginPressed;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubitCubit, LoginCubitState>(
      listener: (context, state) {
        if (state is LoginCubitSucces) {
          UiHandler.showFlushBarThen(
            context,
            "SignUp Successful",
            () {
              Get.toNamed(AppRouter.homeScreen);
              //i will route to the next screen and send the user model as argument
            },
            isError: false,
          );
        } else if (state is LoginCubitFailure) {
          UiHandler.showFlushBar(
            context,
            state.failure.message,
            isError: true,
          );
        }
      },
      builder: (context, state) {
        if (state is LoginCubitLoading) {
          return const OnBoardingButton(
            isLoading: true,
            isActive: true,
          );
        }
        return OnBoardingButton(
            isActive: true, text: 'إنشاء حساب', onTap: onLoginPressed);
      },
    );
  }
}
