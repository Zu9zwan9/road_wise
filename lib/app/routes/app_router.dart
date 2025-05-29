import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:road_wise/features/auth/presentation/pages/login_page.dart';
import 'package:road_wise/features/auth/presentation/pages/register_page.dart';
import 'package:road_wise/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:road_wise/features/learning/presentation/pages/lesson_details_page.dart';
import 'package:road_wise/features/learning/presentation/pages/lessons_page.dart';
import 'package:road_wise/features/learning/presentation/pages/quiz_page.dart';
import 'package:road_wise/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:road_wise/features/profile/presentation/pages/profile_page.dart';
import 'package:road_wise/features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      // Splash and Onboarding
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),

      // Authentication
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),

      // Main App Shell
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(child: child);
        },
        routes: [
          // Dashboard
          GoRoute(
            path: '/dashboard',
            name: 'dashboard',
            builder: (context, state) => const DashboardPage(),
            routes: [
              // Nested routes for dashboard if needed
            ],
          ),

          // Learning
          GoRoute(
            path: '/lessons',
            name: 'lessons',
            builder: (context, state) => const LessonsPage(),
            routes: [
              GoRoute(
                path: 'details/:lessonId',
                name: 'lesson_details',
                builder: (context, state) {
                  final lessonId = state.pathParameters['lessonId']!;
                  return LessonDetailsPage(lessonId: lessonId);
                },
              ),
              GoRoute(
                path: 'quiz/:lessonId',
                name: 'quiz',
                builder: (context, state) {
                  final lessonId = state.pathParameters['lessonId']!;
                  return QuizPage(lessonId: lessonId);
                },
              ),
            ],
          ),

          // Profile
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      // Add authentication and onboarding redirects here
      // Example:
      // final isLoggedIn = getIt<AuthBloc>().state.isAuthenticated;
      // final isOnboarded = getIt<SharedPreferences>().getBool('isOnboarded') ?? false;

      // if (!isOnboarded && state.location != '/onboarding') {
      //   return '/onboarding';
      // }

      // if (!isLoggedIn &&
      //     state.location != '/login' &&
      //     state.location != '/register' &&
      //     state.location != '/splash' &&
      //     state.location != '/onboarding') {
      //   return '/login';
      // }

      return null;
    },
  );
}

// Bottom Navigation Bar Scaffold
class ScaffoldWithBottomNavBar extends StatefulWidget {
  final Widget child;

  const ScaffoldWithBottomNavBar({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int _currentIndex = 0;

  static const List<_BottomNavItem> _bottomNavItems = [
    _BottomNavItem(
      icon: Icons.home_rounded,
      label: 'Home',
      initialLocation: '/dashboard',
    ),
    _BottomNavItem(
      icon: Icons.school_rounded,
      label: 'Learn',
      initialLocation: '/lessons',
    ),
    _BottomNavItem(
      icon: Icons.person_rounded,
      label: 'Profile',
      initialLocation: '/profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          context.go(_bottomNavItems[index].initialLocation);
        },
        items: _bottomNavItems
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
                label: item.label,
              ),
            )
            .toList(),
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor:
            Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class _BottomNavItem {
  final IconData icon;
  final String label;
  final String initialLocation;

  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.initialLocation,
  });
}
