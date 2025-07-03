import 'package:advanced_ecommerce/core/services/firebase_auth_service.dart';
import 'package:advanced_ecommerce/features/auth/data/repos/auth_repo_impl.dart';
import 'package:advanced_ecommerce/features/auth/domain/repos/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);

  getIt.registerLazySingleton<FireBaseAuthService>(
    () => FireBaseAuthService(
      getIt<FirebaseAuth>(),
      getIt<FirebaseFirestore>(),
    ),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<FireBaseAuthService>()),
  );
}
