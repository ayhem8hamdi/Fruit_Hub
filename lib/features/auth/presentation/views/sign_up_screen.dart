import 'package:advanced_ecommerce/core/services/get_it_service.dart';
import 'package:advanced_ecommerce/features/auth/domain/repos/auth_repo.dart';
import 'package:advanced_ecommerce/features/auth/presentation/manager/signup_cubit/cubit/sign_up_cubit.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: const SignUpScreenBody(),
    ));
  }
}
