import 'package:advanced_ecommerce/features/auth/data/repos/auth_repo_impl.dart';
import 'package:advanced_ecommerce/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {

   getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
   getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
    getIt<FirebaseAuthService>(),
  ));


}
