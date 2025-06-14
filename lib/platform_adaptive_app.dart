import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_wise/bloc/premium_bloc.dart';

// Import the auth bloc directly
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/province_bloc.dart';
// Import screens
import 'features/auth/presentation/screens/forgot_password_screen.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/province_selection_screen.dart';
import 'features/auth/presentation/screens/register_screen.dart';
import 'features/core/presentation/theme/app_theme.dart';
import 'features/dashboard/presentation/screens/dashboard_screen.dart';
import 'features/lessons/presentation/bloc/learning_module_bloc.dart';
import 'features/profile/presentation/bloc/gamification_bloc.dart';
import 'features/profile/presentation/bloc/user_progress_bloc.dart';
import 'features/quiz/presentation/bloc/quiz_bloc.dart';
import 'features/quiz/presentation/screens/quiz_results_screen.dart';
import 'features/quiz/presentation/screens/quiz_screen.dart';

// Routes constants
class AppRoutes {
  static const String dashboard = '/dashboard';
  static const String provinceSelection = '/province-selection';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String quiz = '/quiz';
  static const String quizResults = '/quiz-results';
}

class PlatformAdaptiveApp extends StatelessWidget {
  const PlatformAdaptiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Cupertino style on iOS, Material on Android and Web
    final bool useCupertinoStyle = defaultTargetPlatform == TargetPlatform.iOS;

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc()..add(const AuthCheckRequested()),
        ),
        BlocProvider<ProvinceBloc>(create: (context) => ProvinceBloc()),
        BlocProvider<LearningModuleBloc>(
          create: (context) => LearningModuleBloc(),
        ),
        BlocProvider<QuizBloc>(create: (context) => QuizBloc()),
        BlocProvider<UserProgressBloc>(create: (context) => UserProgressBloc()),
        BlocProvider<GamificationBloc>(create: (context) => GamificationBloc()),
        BlocProvider<PremiumBloc>(create: (context) => PremiumBloc()),
      ],
      child: useCupertinoStyle ? _buildCupertinoApp() : _buildMaterialApp(),
    );
  }

  Widget _buildCupertinoApp() {
    return CupertinoApp(
      title: 'RoadWise',
      theme: const CupertinoThemeData(
        primaryColor: Color(0xFFD80621), // AppColors.mapleRed
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xFFF8F8F8), // AppColors.offWhite
        textTheme: CupertinoTextThemeData(
          primaryColor: Color(0xFF2C3E50), // AppColors.nearBlack
        ),
      ),
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthInitial || state is AuthLoading) {
            return const CupertinoPageScaffold(
              child: Center(child: CupertinoActivityIndicator()),
            );
          } else if (state is Authenticated) {
            return const DashboardScreen();
          } else if (state is ProvinceSelectionRequired) {
            return const ProvinceSelectionScreen();
          } else {
            // AuthenticationRequired or other states
            return const LoginScreen();
          }
        },
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.dashboard:
            return CupertinoPageRoute(builder: (_) => const DashboardScreen());
          case AppRoutes.provinceSelection:
            return CupertinoPageRoute(
              builder: (_) => const ProvinceSelectionScreen(),
            );
          case AppRoutes.login:
            return CupertinoPageRoute(builder: (_) => const LoginScreen());
          case AppRoutes.register:
            return CupertinoPageRoute(builder: (_) => const RegisterScreen());
          case AppRoutes.forgotPassword:
            return CupertinoPageRoute(
              builder: (_) => const ForgotPasswordScreen(),
            );
          case AppRoutes.quiz:
            final args = settings.arguments as Map<String, dynamic>;
            return CupertinoPageRoute(
              builder: (_) => QuizScreen(quizId: args['quizId'] as String),
            );
          case AppRoutes.quizResults:
            final args = settings.arguments as Map<String, dynamic>;
            return CupertinoPageRoute(
              builder: (_) => QuizResultsScreen(
                quizId: args['quizId'] as String,
                score: args['score'] as int,
                totalQuestions: args['totalQuestions'] as int,
                answers: args['answers'] as List<String>,
                correctAnswers: args['correctAnswers'] as int, // Provide this
              ),
            );
          default:
            return CupertinoPageRoute(
              builder: (_) => const CupertinoPageScaffold(
                child: Center(child: Text('Route not found')),
              ),
            );
        }
      },
    );
  }

  Widget _buildMaterialApp() {
    return MaterialApp(
      title: 'RoadWise',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthInitial || state is AuthLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is Authenticated) {
            return const DashboardScreen();
          } else if (state is ProvinceSelectionRequired) {
            return const ProvinceSelectionScreen();
          } else {
            // AuthenticationRequired or other states
            return const LoginScreen();
          }
        },
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.dashboard:
            return MaterialPageRoute(builder: (_) => const DashboardScreen());
          case AppRoutes.provinceSelection:
            return MaterialPageRoute(
              builder: (_) => const ProvinceSelectionScreen(),
            );
          case AppRoutes.login:
            return MaterialPageRoute(builder: (_) => const LoginScreen());
          case AppRoutes.register:
            return MaterialPageRoute(builder: (_) => const RegisterScreen());
          case AppRoutes.forgotPassword:
            return MaterialPageRoute(
              builder: (_) => const ForgotPasswordScreen(),
            );
          case AppRoutes.quiz:
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => QuizScreen(quizId: args['quizId'] as String),
            );
          case AppRoutes.quizResults:
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => QuizResultsScreen(
                quizId: args['quizId'] as String,
                score: args['score'] as int,
                totalQuestions: args['totalQuestions'] as int,
                answers: args['answers'] as List<String>,
                correctAnswers: args['correctAnswers'] as int, // Provide this
              ),
            );
          default:
            return MaterialPageRoute(
              builder: (_) =>
                  const Scaffold(body: Center(child: Text('Route not found'))),
            );
        }
      },
    );
  }
}
