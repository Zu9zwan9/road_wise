import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/core/utils/base_bloc.dart';
import 'features/dashboard/gamification/data/models/badge_model.dart';

// Gamification Events
abstract class GamificationEvent extends BaseEvent {}

class LoadBadges extends GamificationEvent {
  final String userId;

  LoadBadges({required this.userId});

  @override
  List<Object> get props => [userId];
}

class CheckBadgeEligibility extends GamificationEvent {
  final String userId;
  final String
  action; // e.g., 'module_completed', 'streak_updated', 'quiz_completed'
  final Map<String, dynamic> metadata;

  CheckBadgeEligibility({
    required this.userId,
    required this.action,
    required this.metadata,
  });

  @override
  List<Object> get props => [userId, action, metadata];
}

// Gamification States
abstract class GamificationState extends BaseState {}

class GamificationInitial extends GamificationState {}

class GamificationLoading extends GamificationState {}

class BadgesLoaded extends GamificationState {
  final List<BadgeModel> availableBadges;
  final List<BadgeModel> earnedBadges;
  final List<BadgeModel> lockedBadges;

  BadgesLoaded({
    required this.availableBadges,
    required this.earnedBadges,
    required this.lockedBadges,
  });

  @override
  List<Object> get props => [availableBadges, earnedBadges, lockedBadges];
}

class BadgeEarned extends GamificationState {
  final BadgeModel badge;
  final int xpRewarded;

  BadgeEarned({required this.badge, required this.xpRewarded});

  @override
  List<Object> get props => [badge, xpRewarded];
}

class GamificationError extends GamificationState {
  final String message;

  GamificationError({required this.message});

  @override
  List<Object> get props => [message];
}

// Gamification BLoC
class GamificationBloc extends BaseBloc<GamificationEvent, GamificationState> {
  // In a real app, these would be injected
  // final BadgeRepository badgeRepository;
  // final UserProgressRepository progressRepository;

  GamificationBloc() : super(GamificationInitial()) {
    on<LoadBadges>(_onLoadBadges);
    on<CheckBadgeEligibility>(_onCheckBadgeEligibility);
  }

  Future<void> _onLoadBadges(
    LoadBadges event,
    Emitter<GamificationState> emit,
  ) async {
    emit(GamificationLoading());
    try {
      // In a real app, fetch badges from repository
      // final allBadges = await badgeRepository.getAllBadges();
      // final earnedBadgeIds = await progressRepository.getEarnedBadgeIds(event.userId);

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 1));

      // Create mock badges
      final allBadges = [
        BadgeModel(
          id: 'badge1',
          title: 'First Steps',
          description: 'Complete your first module',
          iconAsset: 'assets/images/badges/first_steps.png',
          type: BadgeType.completion,
          tier: BadgeTier.bronze,
          unlockCriteria: 'Complete 1 module',
          xpReward: 50,
        ),
        BadgeModel(
          id: 'badge2',
          title: 'Perfect Score',
          description: 'Get 100% on a quiz',
          iconAsset: 'assets/images/badges/perfect_score.png',
          type: BadgeType.mastery,
          tier: BadgeTier.silver,
          unlockCriteria: 'Score 100% on any quiz',
          xpReward: 75,
        ),
        BadgeModel(
          id: 'badge3',
          title: 'Streak Starter',
          description: 'Maintain a 5-day streak',
          iconAsset: 'assets/images/badges/streak_starter.png',
          type: BadgeType.streak,
          tier: BadgeTier.bronze,
          unlockCriteria: 'Maintain a 5-day streak',
          xpReward: 50,
        ),
        BadgeModel(
          id: 'badge4',
          title: 'Road Master',
          description: 'Complete 5 modules',
          iconAsset: 'assets/images/badges/road_master.png',
          type: BadgeType.completion,
          tier: BadgeTier.gold,
          unlockCriteria: 'Complete 5 modules',
          xpReward: 100,
        ),
        BadgeModel(
          id: 'badge5',
          title: 'Streak Champion',
          description: 'Maintain a 30-day streak',
          iconAsset: 'assets/images/badges/streak_champion.png',
          type: BadgeType.streak,
          tier: BadgeTier.platinum,
          unlockCriteria: 'Maintain a 30-day streak',
          xpReward: 200,
        ),
      ];

      // Mock earned badge IDs
      final earnedBadgeIds = ['badge1', 'badge2', 'badge3'];

      // Separate badges into earned and locked
      final earnedBadges = allBadges
          .where((badge) => earnedBadgeIds.contains(badge.id))
          .toList();
      final lockedBadges = allBadges
          .where((badge) => !earnedBadgeIds.contains(badge.id))
          .toList();

      emit(
        BadgesLoaded(
          availableBadges: allBadges,
          earnedBadges: earnedBadges,
          lockedBadges: lockedBadges,
        ),
      );
    } catch (e) {
      emit(GamificationError(message: e.toString()));
    }
  }

  Future<void> _onCheckBadgeEligibility(
    CheckBadgeEligibility event,
    Emitter<GamificationState> emit,
  ) async {
    try {
      // In a real app, check badge eligibility in repository
      // final eligibleBadges = await badgeRepository.checkEligibility(
      //   event.userId,
      //   event.action,
      //   event.metadata,
      // );

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 1));

      // Mock badge eligibility check
      BadgeModel? earnedBadge;

      switch (event.action) {
        case 'module_completed':
          final completedModulesCount =
              event.metadata['completed_modules_count'] as int? ?? 0;
          if (completedModulesCount == 5) {
            earnedBadge = BadgeModel(
              id: 'badge4',
              title: 'Road Master',
              description: 'Complete 5 modules',
              iconAsset: 'assets/images/badges/road_master.png',
              type: BadgeType.completion,
              tier: BadgeTier.gold,
              unlockCriteria: 'Complete 5 modules',
              xpReward: 100,
            );
          }
          break;
        case 'streak_updated':
          final streakDays = event.metadata['streak_days'] as int? ?? 0;
          if (streakDays == 30) {
            earnedBadge = BadgeModel(
              id: 'badge5',
              title: 'Streak Champion',
              description: 'Maintain a 30-day streak',
              iconAsset: 'assets/images/badges/streak_champion.png',
              type: BadgeType.streak,
              tier: BadgeTier.platinum,
              unlockCriteria: 'Maintain a 30-day streak',
              xpReward: 200,
            );
          }
          break;
        case 'quiz_completed':
          final score = event.metadata['score'] as int? ?? 0;
          if (score == 100) {
            earnedBadge = BadgeModel(
              id: 'badge2',
              title: 'Perfect Score',
              description: 'Get 100% on a quiz',
              iconAsset: 'assets/images/badges/perfect_score.png',
              type: BadgeType.mastery,
              tier: BadgeTier.silver,
              unlockCriteria: 'Score 100% on any quiz',
              xpReward: 75,
            );
          }
          break;
      }

      if (earnedBadge != null) {
        emit(BadgeEarned(badge: earnedBadge, xpRewarded: earnedBadge.xpReward));
      } else {
        // If no badge was earned, reload the current badges
        add(LoadBadges(userId: event.userId));
      }
    } catch (e) {
      emit(GamificationError(message: e.toString()));
    }
  }
}
