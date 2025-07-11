import 'package:advanced_ecommerce/core/errors/failure.dart';
import 'package:advanced_ecommerce/features/auth/domain/entities/user_entity.dart';
import 'package:advanced_ecommerce/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'social_media_auth_state.dart';

class SocialMediaAuthCubit extends Cubit<SocialMediaAuthState> {
  SocialMediaAuthCubit(this.authRepo) : super(SocialMediaAuthInitial());
  final AuthRepo authRepo;
  Future<void> loginWithGoogle() async {
    emit(SocialMediaAuthLoading());
    final result = await authRepo.loginWithGoogle();
    result.fold(
      (failure) => emit(SocialMediaAuthFailure(failure: failure)),
      (result) => emit(SocialMediaAuthSucces(userEntity: result)),
    );
  }

  Future<void> loginWithFacebook() async {
    emit(SocialMediaAuthLoading());
    final result = await authRepo.loginWithFacebook();
    result.fold(
      (failure) => emit(SocialMediaAuthFailure(failure: failure)),
      (result) => emit(SocialMediaAuthSucces(userEntity: result)),
    );
  }
}
