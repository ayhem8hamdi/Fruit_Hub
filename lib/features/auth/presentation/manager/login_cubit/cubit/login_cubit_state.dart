part of 'login_cubit_cubit.dart';

@immutable
sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginCubitLoading extends LoginCubitState {}

final class LoginCubitSucces extends LoginCubitState {
  final UserEntity userEntity;

  LoginCubitSucces({required this.userEntity});
}

final class LoginCubitFailure extends LoginCubitState {
  final Failure failure;

  LoginCubitFailure({required this.failure});
}
