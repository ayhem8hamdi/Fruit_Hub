import 'package:advanced_ecommerce/core/Utils/app_router.dart';
import 'package:advanced_ecommerce/core/Utils/ui_errors_handler.dart';
import 'package:advanced_ecommerce/features/auth/presentation/manager/social_media_auth_cubit/cubit/social_media_auth_cubit.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/login_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginBodyBlocListener extends StatelessWidget {
  const LoginBodyBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SocialMediaAuthCubit, SocialMediaAuthState>(
        listener: (context, state) {
          if (state is SocialMediaAuthLoading) {
            EasyLoading.show(status: 'جاري التحميل...');
          } else {
            EasyLoading.dismiss();
          }

          if (state is SocialMediaAuthSucces) {
            EasyLoading.dismiss();
            UiHandler.showFlushBarThen(
              context,
              "تم تسجيل الدخول باستخدام جوجل بنجاح",
              () {
                print('going to home screen');
                Get.toNamed(AppRouter.homeScreen);
              },
              isError: false,
            );
          } else if (state is SocialMediaAuthFailure) {
            EasyLoading.dismiss();
            UiHandler.showFlushBar(
              context,
              state.failure.message,
              isError: true,
            );
          }
        },
        child: const LoginScreenBody());
  }
}
