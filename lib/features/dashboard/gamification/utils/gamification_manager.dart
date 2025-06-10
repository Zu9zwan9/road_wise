import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../gamification_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../../user_profile/presentation/bloc/user_progress_bloc.dart';
import '../data/models/badge_model.dart';

/// GamificationManager is a utility class that handles the integration of
/// gamification elements throughout the app
class GamificationManager {
  // Singleton instance
  static final GamificationManager _instance = GamificationManager._internal();

  factory GamificationManager() => _instance;

  GamificationManager._internal();

  /// Shows XP gain animation and updates user progress
  void showXpGain(BuildContext context, int xp, String source) {
    // Update user progress with XP
    final userId =
        BlocProvider.of<UserProgressBloc>(context).state is UserProgressLoaded
        ? (BlocProvider.of<UserProgressBloc>(context).state
                  as UserProgressLoaded)
              .progress
              .userId
        : '';

    if (userId.isNotEmpty) {
      BlocProvider.of<UserProgressBloc>(
        context,
      ).add(AddXp(userId: userId, xp: xp, source: source));
    }

    // Show XP gain animation
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 16,
        right: 16,
        child: AppWidgets.xpGainIndicator(
          xp: xp,
          onDismiss: () {
            Future.delayed(const Duration(seconds: 2), () {
              if (overlayEntry.mounted) {
                overlayEntry.remove();
              }
            });
          },
        ),
      ),
    );

    overlay.insert(overlayEntry);
  }

  /// Checks for badge eligibility based on an action
  void checkBadgeEligibility(
    BuildContext context,
    String action,
    Map<String, dynamic> metadata,
  ) {
    final userId =
        BlocProvider.of<UserProgressBloc>(context).state is UserProgressLoaded
        ? (BlocProvider.of<UserProgressBloc>(context).state
                  as UserProgressLoaded)
              .progress
              .userId
        : '';

    if (userId.isNotEmpty) {
      BlocProvider.of<GamificationBloc>(context).add(
        CheckBadgeEligibility(
          userId: userId,
          action: action,
          metadata: metadata,
        ),
      );
    }
  }

  /// Shows badge earned animation and updates user progress
  void showBadgeEarned(BuildContext context, BadgeModel badge) {
    // Update user progress with badge
    final userId =
        BlocProvider.of<UserProgressBloc>(context).state is UserProgressLoaded
        ? (BlocProvider.of<UserProgressBloc>(context).state
                  as UserProgressLoaded)
              .progress
              .userId
        : '';

    if (userId.isNotEmpty) {
      BlocProvider.of<UserProgressBloc>(
        context,
      ).add(UnlockBadge(userId: userId, badgeId: badge.id));
    }

    // Show badge earned dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: _getBadgeTierColor(badge.tier),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: const Column(
                children: [
                  Icon(Icons.emoji_events, color: Colors.white, size: 48),
                  SizedBox(height: 8),
                  Text(
                    'Badge Earned!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    badge.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    badge.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.darkGray,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.mapleRed,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '+${badge.xpReward} XP',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mapleRed,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  AppWidgets.primaryButton(
                    text: 'Awesome!',
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Show XP gain after badge dialog is closed
                      showXpGain(context, badge.xpReward, 'badge_earned');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Shows level up animation and updates user progress
  void showLevelUp(BuildContext context, int newLevel) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.mapleRed, AppColors.canadianBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  const Icon(Icons.arrow_upward, color: Colors.white, size: 48),
                  const SizedBox(height: 8),
                  Text(
                    'Level Up! You\'re now Level $newLevel',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text(
                    'Congratulations!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'You\'ve reached level $newLevel. Keep learning and earning XP to unlock more content and features!',
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.darkGray,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  AppWidgets.primaryButton(
                    text: 'Continue',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Shows streak update animation and updates user progress
  void updateStreak(BuildContext context) {
    final userId =
        BlocProvider.of<UserProgressBloc>(context).state is UserProgressLoaded
        ? (BlocProvider.of<UserProgressBloc>(context).state
                  as UserProgressLoaded)
              .progress
              .userId
        : '';

    if (userId.isNotEmpty) {
      BlocProvider.of<UserProgressBloc>(
        context,
      ).add(UpdateStreak(userId: userId));
    }
  }

  /// Shows streak milestone animation
  void showStreakMilestone(BuildContext context, int streakDays) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.zero,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    _getStreakColor(streakDays),
                    _getStreakColor(streakDays).withRed(
                      (_getStreakColor(streakDays).red + 30).clamp(0, 255),
                    ),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.local_fire_department,
                    color: Colors.white,
                    size: 48,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$streakDays Day Streak!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text(
                    'Amazing Consistency!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'You\'ve maintained your learning streak for $streakDays days. Keep it up to earn more rewards!',
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.darkGray,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.mapleRed,
                        size: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '+${_getStreakXpReward(streakDays)} XP',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mapleRed,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  AppWidgets.primaryButton(
                    text: 'Keep Going!',
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Show XP gain after streak dialog is closed
                      showXpGain(
                        context,
                        _getStreakXpReward(streakDays),
                        'streak_milestone',
                      );

                      // Check for streak-related badges
                      checkBadgeEligibility(context, 'streak_updated', {
                        'streak_days': streakDays,
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper methods
  Color _getBadgeTierColor(BadgeTier tier) {
    switch (tier) {
      case BadgeTier.bronze:
        return AppColors.bronze;
      case BadgeTier.silver:
        return AppColors.silver;
      case BadgeTier.gold:
        return AppColors.gold;
      case BadgeTier.platinum:
        return AppColors.platinum;
    }
  }

  Color _getStreakColor(int days) {
    if (days >= 30) return AppColors.streakDay30Plus;
    if (days >= 14) return AppColors.streakDay14;
    if (days >= 7) return AppColors.streakDay7;
    if (days >= 3) return AppColors.streakDay3;
    return AppColors.streakDay1;
  }

  int _getStreakXpReward(int days) {
    if (days >= 30) return 100;
    if (days >= 14) return 50;
    if (days >= 7) return 30;
    if (days >= 3) return 20;
    return 10;
  }
}
