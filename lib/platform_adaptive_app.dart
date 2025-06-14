import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:road_wise/navigation/app_routes.dart';
import 'package:road_wise/bloc/premium_bloc.dart';


class PlatformAdaptiveApp extends StatelessWidget {
  const PlatformAdaptiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Cupertino style on iOS, Material on Android and Web
    final bool useCupertinoStyle = defaultTargetPlatform == TargetPlatform.iOS;

    return MultiBlocProvider(
      providers: [
        BlocProvider<auth_bloc.AuthBloc>(
          create: (context) =>
              auth_bloc.AuthBloc()..add(auth_bloc.AuthCheckRequested()),
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
      home: BlocBuilder<auth_bloc.AuthBloc, auth_bloc.AuthState>(
        builder: (context, state) {
          if (state is auth_bloc.AuthInitial ||
              state is auth_bloc.AuthLoading) {
            return const CupertinoPageScaffold(
              child: Center(child: CupertinoActivityIndicator()),
            );
          } else if (state is auth_bloc.Authenticated) {
            return const DashboardScreen();
          } else if (state is auth_bloc.ProvinceSelectionRequired) {
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
                score: args['score'] as double,
                correctAnswers: args['correctAnswers'] as int,
                totalQuestions: args['totalQuestions'] as int,
                isPassed: args['isPassed'] as bool,
                earnedXp: args['earnedXp'] as int,
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
      home: BlocBuilder<auth_bloc.AuthBloc, auth_bloc.AuthState>(
        builder: (context, state) {
          if (state is auth_bloc.AuthInitial ||
              state is auth_bloc.AuthLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is auth_bloc.Authenticated) {
            return const DashboardScreen();
          } else if (state is auth_bloc.ProvinceSelectionRequired) {
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
                score: args['score'] as double,
                correctAnswers: args['correctAnswers'] as int,
                totalQuestions: args['totalQuestions'] as int,
                isPassed: args['isPassed'] as bool,
                earnedXp: args['earnedXp'] as int,
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
