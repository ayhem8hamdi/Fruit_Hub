import 'package:advanced_ecommerce/core/errors/failure.dart';
import 'package:advanced_ecommerce/features/auth/data/repos/auth_repo_impl.dart';
import 'package:advanced_ecommerce/features/auth/domain/entities/user_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepoImpl) : super(SignUpInitial());
  final AuthRepoImpl authRepoImpl;

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
  }) async {
    emit(SignUpLoading());
    final result = await authRepoImpl.createUserWithEmailAndPassword(
        email: email,
        password: password,
        fullName: fullName,
        phoneNumber: phoneNumber);
    result.fold(
      (failure) => emit(SignUpFailed(failure: failure)),
      (result) => emit(SignUpSucces(userEntity: result)),
    );
  }
}
