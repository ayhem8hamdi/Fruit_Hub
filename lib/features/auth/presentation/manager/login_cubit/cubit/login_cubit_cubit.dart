import 'package:advanced_ecommerce/core/errors/failure.dart';
import 'package:advanced_ecommerce/features/auth/domain/entities/user_entity.dart';
import 'package:advanced_ecommerce/features/auth/domain/repos/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_cubit_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit(this._authRepo) : super(LoginCubitInitial());
  final AuthRepo _authRepo;
  Future<void> loginUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginCubitLoading());
    final result = await _authRepo.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(LoginCubitFailure(failure: failure)),
      (result) => emit(LoginCubitSucces(userEntity: result)),
    );
  }
}
