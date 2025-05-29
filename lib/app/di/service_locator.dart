import 'package:get_it/get_it.dart';
import 'package:road_wise/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:road_wise/features/auth/domain/repositories/auth_repository.dart';
import 'package:road_wise/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:road_wise/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:road_wise/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:road_wise/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:road_wise/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:road_wise/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:road_wise/features/dashboard/domain/usecases/get_user_stats_usecase.dart';
import 'package:road_wise/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:road_wise/features/learning/data/repositories/learning_repository_impl.dart';
import 'package:road_wise/features/learning/domain/repositories/learning_repository.dart';
import 'package:road_wise/features/learning/domain/usecases/complete_lesson_usecase.dart';
import 'package:road_wise/features/learning/domain/usecases/get_lessons_usecase.dart';
import 'package:road_wise/features/learning/presentation/bloc/learning_bloc.dart';
import 'package:road_wise/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:road_wise/features/profile/domain/repositories/profile_repository.dart';
import 'package:road_wise/features/profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:road_wise/features/profile/domain/usecases/update_user_profile_usecase.dart';
import 'package:road_wise/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // External dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  getIt.registerLazySingleton<DashboardRepository>(
      () => DashboardRepositoryImpl());
  getIt.registerLazySingleton<LearningRepository>(
      () => LearningRepositoryImpl());
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl());

  // Use cases
  // Auth
  getIt.registerLazySingleton(() => SignInUseCase(getIt()));
  getIt.registerLazySingleton(() => SignUpUseCase(getIt()));
  getIt.registerLazySingleton(() => SignOutUseCase(getIt()));

  // Dashboard
  getIt.registerLazySingleton(() => GetUserStatsUseCase(getIt()));

  // Learning
  getIt.registerLazySingleton(() => GetLessonsUseCase(getIt()));
  getIt.registerLazySingleton(() => CompleteLessonUseCase(getIt()));

  // Profile
  getIt.registerLazySingleton(() => GetUserProfileUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateUserProfileUseCase(getIt()));

  // BLoCs
  getIt.registerFactory(() => AuthBloc(
        signIn: getIt(),
        signUp: getIt(),
        signOut: getIt(),
      ));

  getIt.registerFactory(() => DashboardBloc(
        getUserStats: getIt(),
      ));

  getIt.registerFactory(() => LearningBloc(
        getLessons: getIt(),
        completeLesson: getIt(),
      ));

  getIt.registerFactory(() => ProfileBloc(
        getUserProfile: getIt(),
        updateUserProfile: getIt(),
      ));
}
