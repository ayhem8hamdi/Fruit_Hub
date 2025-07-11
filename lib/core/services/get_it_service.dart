import 'package:advanced_ecommerce/core/services/supabase_auth_service.dart';
import 'package:advanced_ecommerce/features/auth/data/repos/auth_repo_impl.dart';
import 'package:advanced_ecommerce/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // 1. Initialize Supabase
  await Supabase.initialize(
    url: 'https://dlfzncatbvtfbatfcdcn.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRsZnpuY2F0YnZ0ZmJhdGZjZGNuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIxNzEzMjgsImV4cCI6MjA2Nzc0NzMyOH0.UF25mvtnsVMLFcCF3BZJGzBKyIjW7Jj78oA7D0PRwgI',
  );

  // 2. Register Supabase Client
  getIt.registerLazySingleton<SupabaseClient>(
    () => Supabase.instance.client,
  );

  // 3. Register SupabaseAuthService (assuming you have this class)
  getIt.registerLazySingleton<SupabaseAuthService>(
    () => SupabaseAuthService(getIt<SupabaseClient>()),
  );

  // 4. Register Auth Repository
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<SupabaseAuthService>()),
  );
}
