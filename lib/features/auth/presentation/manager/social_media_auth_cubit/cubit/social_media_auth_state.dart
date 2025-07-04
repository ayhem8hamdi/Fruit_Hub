part of 'social_media_auth_cubit.dart';

sealed class SocialMediaAuthState {}

final class SocialMediaAuthInitial extends SocialMediaAuthState {}

final class SocialMediaAuthLoading extends SocialMediaAuthState {}

final class SocialMediaAuthFailure extends SocialMediaAuthState {
  final Failure failure;

  SocialMediaAuthFailure({required this.failure});
}

final class SocialMediaAuthSucces extends SocialMediaAuthState {
  final UserEntity userEntity;

  SocialMediaAuthSucces({required this.userEntity});
}
