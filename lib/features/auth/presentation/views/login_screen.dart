import 'package:advanced_ecommerce/core/services/get_it_service.dart';
import 'package:advanced_ecommerce/features/auth/domain/repos/auth_repo.dart';
import 'package:advanced_ecommerce/features/auth/presentation/manager/login_cubit/cubit/login_cubit_cubit.dart';
import 'package:advanced_ecommerce/features/auth/presentation/manager/social_media_auth_cubit/cubit/social_media_auth_cubit.dart';
import 'package:advanced_ecommerce/features/auth/presentation/views/widgets/login_body_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SocialMediaAuthCubit(getIt.get<AuthRepo>()),
        ),
        BlocProvider(
          create: (context) => LoginCubitCubit(getIt.get<AuthRepo>()),
        ),
      ],
      child: const LoginBodyBlocListener(),
    );
  }
}
