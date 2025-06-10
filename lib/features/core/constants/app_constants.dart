/// App-wide constants for RoadWise
class AppConstants {
  // App Information
  static const String appName = 'RoadWise';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';

  // API Endpoints
  static const String baseUrl = 'https://api.roadwise.com';

  // Shared Preferences Keys
  static const String tokenKey = 'auth_token';
  static const String userIdKey = 'user_id';
  static const String selectedProvinceKey = 'selected_province';
  static const String onboardingCompleteKey = 'onboarding_complete';
  static const String currentStreakKey = 'current_streak';
  static const String lastLoginDateKey = 'last_login_date';

  // Animation Durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);

  // Gamification Constants
  static const int dailyXpGoal = 50;
  static const int streakThreshold = 1; // Days to maintain streak
  static const int xpPerLesson = 10;
  static const int xpPerQuiz = 20;
  static const int xpPerPracticeTest = 30;

  // Cache Duration
  static const Duration cacheDuration = Duration(days: 7);

  // Pagination
  static const int defaultPageSize = 10;

  // Minimum Scores
  static const double passingScore = 0.8; // 80%

  // Canadian Provinces
  static const List<String> provinces = [
    'Alberta',
    'British Columbia',
    'Manitoba',
    'New Brunswick',
    'Newfoundland and Labrador',
    'Northwest Territories',
    'Nova Scotia',
    'Nunavut',
    'Ontario',
    'Prince Edward Island',
    'Quebec',
    'Saskatchewan',
    'Yukon',
  ];

  // Private constructor to prevent instantiation
  AppConstants._();
}
