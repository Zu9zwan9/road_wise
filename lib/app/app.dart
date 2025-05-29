import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_wise/app/theme/app_theme.dart';
import 'package:road_wise/app/routes/app_router.dart';
import 'package:road_wise/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:road_wise/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:road_wise/features/learning/presentation/bloc/learning_bloc.dart';
import 'package:road_wise/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:road_wise/app/di/service_locator.dart';

class RoadWiseApp extends StatelessWidget {
  const RoadWiseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider<DashboardBloc>(
          create: (context) => getIt<DashboardBloc>(),
        ),
        BlocProvider<LearningBloc>(
          create: (context) => getIt<LearningBloc>(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => getIt<ProfileBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'RoadWise',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('es', 'ES'),
          Locale('fr', 'FR'),
        ],
        localizationsDelegates: const [
          // AppLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}
