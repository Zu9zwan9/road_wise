import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/onboarding_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/welcome_screen.dart';
import '../features/leaderboard/presentation/screens/leaderboard_screen.dart';
import '../features/lessons/presentation/screens/dashboard_screen.dart';
import '../features/lessons/presentation/screens/lesson_content_screen.dart';
import '../features/lessons/presentation/screens/module_details_screen.dart';
import '../features/lessons/presentation/screens/province_selection_screen.dart';
import '../features/profile/presentation/screens/achievements_screen.dart';
import '../features/profile/presentation/screens/premium_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../features/profile/presentation/screens/settings_screen.dart';
import '../features/profile/presentation/screens/streak_calendar_screen.dart';
import '../features/quiz/presentation/screens/quiz_results_screen.dart';
import '../features/quiz/presentation/screens/quiz_screen.dart';
import 'app_routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shell',
);

class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    routes: [
      // Auth routes
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.provinceSelection,
        builder: (context, state) => const ProvinceSelectionScreen(),
      ),

      // Main app shell route with bottom navigation
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return DashboardScreen(child: child);
        },
        routes: [
          // Learn tab
          GoRoute(
            path: AppRoutes.learn,
            builder: (context, state) => const LessonContentScreen(),
            routes: [
              GoRoute(
                path: 'module/:moduleId',
                builder: (context, state) {
                  final moduleId = state.pathParameters['moduleId']!;
                  return ModuleDetailsScreen(moduleId: moduleId);
                },
                routes: [
                  GoRoute(
                    path: 'lesson/:lessonId',
                    builder: (context, state) {
                      final moduleId = state.pathParameters['moduleId']!;
                      final lessonId = state.pathParameters['lessonId']!;
                      return LessonContentScreen(
                        moduleId: moduleId,
                        lessonId: lessonId,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          // Practice tab
          GoRoute(
            path: AppRoutes.practice,
            builder: (context, state) => const QuizScreen(),
          ),

          // Progress tab
          GoRoute(
            path: AppRoutes.progress,
            builder: (context, state) => const StreakCalendarScreen(),
          ),

          // Profile tab
          GoRoute(
            path: AppRoutes.profile,
            builder: (context, state) => const ProfileScreen(),
            routes: [
              GoRoute(
                path: 'achievements',
                builder: (context, state) => const AchievementsScreen(),
              ),
              GoRoute(
                path: 'settings',
                builder: (context, state) => const SettingsScreen(),
              ),
              GoRoute(
                path: 'premium',
                builder: (context, state) => const PremiumScreen(),
              ),
            ],
          ),
        ],
      ),

      // Feature routes
      GoRoute(
        path: AppRoutes.quiz,
        builder: (context, state) {
          final quizId = state.uri.queryParameters['quizId'] ?? '';
          return QuizScreen(quizId: quizId);
        },
      ),
      GoRoute(
        path: AppRoutes.quizResults,
        builder: (context, state) {
          final quizId = state.uri.queryParameters['quizId'] ?? '';
          final score =
              double.tryParse(state.uri.queryParameters['score'] ?? '0') ?? 0.0;
          final correctAnswers =
              int.tryParse(
                state.uri.queryParameters['correctAnswers'] ?? '0',
              ) ??
              0;
          final totalQuestions =
              int.tryParse(
                state.uri.queryParameters['totalQuestions'] ?? '0',
              ) ??
              0;
          final isPassed =
              (state.uri.queryParameters['isPassed'] ?? 'false') == 'true';
          final earnedXp =
              int.tryParse(state.uri.queryParameters['earnedXp'] ?? '0') ?? 0;

          return QuizResultsScreen(
            quizId: quizId,
            score: score,
            correctAnswers: correctAnswers,
            totalQuestions: totalQuestions,
            isPassed: isPassed,
            earnedXp: earnedXp,
          );
        },
      ),
      GoRoute(
        path: AppRoutes.leaderboard,
        builder: (context, state) => const LeaderboardScreen(),
      ),
    ],
    redirect: (context, state) {
      final authState = context.read<AuthBloc>().state;
      final isLoggedIn = authState is Authenticated;

      final isAuthRoute =
          state.matchedLocation == AppRoutes.login ||
          state.matchedLocation == AppRoutes.register ||
          state.matchedLocation == AppRoutes.forgotPassword ||
          state.matchedLocation == AppRoutes.welcome;

      // If not logged in and not on an auth route, redirect to welcome
      if (!isLoggedIn && !isAuthRoute) {
        return AppRoutes.welcome;
      }

      // If logged in and on an auth route, redirect to dashboard
      if (isLoggedIn && isAuthRoute) {
        return AppRoutes.dashboard;
      }

      // No redirection needed
      return null;
    },
  );
}
