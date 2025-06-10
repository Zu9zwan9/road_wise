/// Route constants for the RoadWise app
class AppRoutes {
  // Authentication Routes
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // Onboarding Routes
  static const String onboarding = '/onboarding';
  static const String provinceSelection = '/province-selection';

  // Main App Routes
  static const String dashboard = '/dashboard';
  static const String learn = '/learn';
  static const String practice = '/practice';
  static const String progress = '/progress';
  static const String profile = '/profile';

  // Feature Routes
  static const String moduleDetails = '/module-details';
  static const String lessonContent = '/lesson-content';
  static const String quiz = '/quiz';
  static const String quizResults = '/quiz-results';
  static const String practiceTest = '/practice-test';
  static const String testResults = '/test-results';
  static const String achievements = '/achievements';
  static const String leaderboard = '/leaderboard';
  static const String streakCalendar = '/streak-calendar';
  static const String settings = '/settings';
  static const String premium = '/premium';

  // Private constructor to prevent instantiation
  AppRoutes._();
}
