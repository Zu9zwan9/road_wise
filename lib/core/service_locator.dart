import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../bloc/premium_bloc.dart';
// Import repositories
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
// Import blocs
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/leaderboard/data/repositories/leaderboard_repository_impl.dart';
import '../features/leaderboard/domain/repositories/leaderboard_repository.dart';
import '../features/leaderboard/presentation/bloc/leaderboard_bloc.dart';
import '../features/lessons/data/repositories/lesson_repository_impl.dart';
import '../features/lessons/domain/repositories/lesson_repository.dart';
import '../features/lessons/presentation/bloc/lessons_bloc.dart';
import '../features/profile/data/repositories/user_repository_impl.dart';
import '../features/profile/domain/repositories/user_repository.dart';
import '../features/profile/presentation/bloc/profile_bloc.dart';
import '../features/quiz/data/repositories/quiz_repository_impl.dart';
import '../features/quiz/domain/repositories/quiz_repository.dart';
import '../features/quiz/presentation/bloc/quiz_bloc.dart';
import '../models/challenge.dart';
import '../models/challenge_option.dart';
import '../models/challenge_progress.dart';
import '../models/course.dart';
import '../models/lesson.dart';
import '../models/unit.dart';
// Import models
import '../models/user_progress.dart';
import '../models/user_subscription.dart';

final GetIt sl = GetIt.instance;

Future<void> setupServiceLocator() async {
  // External dependencies
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([
    UserProgressSchema,
    UserSubscriptionSchema,
    CourseSchema,
    UnitSchema,
    LessonSchema,
    ChallengeSchema,
    ChallengeOptionSchema,
    ChallengeProgressSchema,
  ], directory: dir.path);

  sl.registerSingleton<Isar>(isar);

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerLazySingleton<LessonRepository>(
    () => LessonRepositoryImpl(isar: sl()),
  );
  sl.registerLazySingleton<QuizRepository>(
    () => QuizRepositoryImpl(isar: sl()),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(isar: sl()),
  );
  sl.registerLazySingleton<LeaderboardRepository>(
    () => LeaderboardRepositoryImpl(isar: sl()),
  );

  // BLoCs
  sl.registerFactory(() => AuthBloc(authRepository: sl()));
  sl.registerFactory(() => LessonsBloc(lessonRepository: sl()));
  sl.registerFactory(() => QuizBloc(quizRepository: sl()));
  sl.registerFactory(() => ProfileBloc(userRepository: sl()));
  sl.registerFactory(() => LeaderboardBloc(leaderboardRepository: sl()));
  sl.registerFactory(() => PremiumBloc());
}
