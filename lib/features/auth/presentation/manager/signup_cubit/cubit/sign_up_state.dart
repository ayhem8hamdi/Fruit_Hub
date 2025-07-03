part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSucces extends SignUpState {
  final UserEntity userEntity;

  SignUpSucces({required this.userEntity});
}

final class SignUpFailed extends SignUpState {
  final Failure failure;

  SignUpFailed({required this.failure});
}
