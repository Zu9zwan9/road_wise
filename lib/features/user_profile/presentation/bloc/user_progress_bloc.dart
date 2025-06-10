import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/base_bloc.dart';
import '../../../dashboard/gamification/data/models/badge_model.dart';
import '../../data/models/user_progress_model.dart';

// User Progress Events
abstract class UserProgressEvent extends BaseEvent {}

class LoadUserProgress extends UserProgressEvent {
  final String userId;

  LoadUserProgress({required this.userId});

  @override
  List<Object> get props => [userId];
}

class UpdateStreak extends UserProgressEvent {
  final String userId;

  UpdateStreak({required this.userId});

  @override
  List<Object> get props => [userId];
}

class AddXp extends UserProgressEvent {
  final String userId;
  final int xp;
  final String source; // e.g., 'module_completion', 'quiz_completion'

  AddXp({required this.userId, required this.xp, required this.source});

  @override
  List<Object> get props => [userId, xp, source];
}

class UnlockBadge extends UserProgressEvent {
  final String userId;
  final String badgeId;

  UnlockBadge({required this.userId, required this.badgeId});

  @override
  List<Object> get props => [userId, badgeId];
}

// User Progress States
abstract class UserProgressState extends BaseState {}

class UserProgressInitial extends UserProgressState {}

class UserProgressLoading extends UserProgressState {}

class UserProgressLoaded extends UserProgressState {
  final UserProgressModel progress;
  final List<BadgeModel> earnedBadges;

  UserProgressLoaded({required this.progress, required this.earnedBadges});

  @override
  List<Object> get props => [progress, earnedBadges];
}

class StreakUpdated extends UserProgressState {
  final UserProgressModel progress;
  final bool streakMaintained;
  final bool newStreakRecord;

  StreakUpdated({
    required this.progress,
    required this.streakMaintained,
    required this.newStreakRecord,
  });

  @override
  List<Object> get props => [progress, streakMaintained, newStreakRecord];
}

class XpAdded extends UserProgressState {
  final UserProgressModel progress;
  final int addedXp;
  final bool leveledUp;
  final int newLevel;

  XpAdded({
    required this.progress,
    required this.addedXp,
    required this.leveledUp,
    required this.newLevel,
  });

  @override
  List<Object> get props => [progress, addedXp, leveledUp, newLevel];
}

class BadgeUnlocked extends UserProgressState {
  final UserProgressModel progress;
  final BadgeModel badge;
  final int xpRewarded;

  BadgeUnlocked({
    required this.progress,
    required this.badge,
    required this.xpRewarded,
  });

  @override
  List<Object> get props => [progress, badge, xpRewarded];
}

class UserProgressError extends UserProgressState {
  final String message;

  UserProgressError({required this.message});

  @override
  List<Object> get props => [message];
}

// User Progress BLoC
class UserProgressBloc extends BaseBloc<UserProgressEvent, UserProgressState> {
  // In a real app, these would be injected
  // final UserProgressRepository progressRepository;
  // final BadgeRepository badgeRepository;

  UserProgressBloc() : super(UserProgressInitial()) {
    on<LoadUserProgress>(_onLoadUserProgress);
    on<UpdateStreak>(_onUpdateStreak);
    on<AddXp>(_onAddXp);
    on<UnlockBadge>(_onUnlockBadge);
  }

  Future<void> _onLoadUserProgress(
    LoadUserProgress event,
    Emitter<UserProgressState> emit,
  ) async {
    emit(UserProgressLoading());
    try {
      // In a real app, fetch user progress from repository
      // final progress = await progressRepository.getUserProgress(event.userId);
      // final earnedBadges = await badgeRepository.getEarnedBadges(event.userId);

      // Mock implementation for now
      await Future.delayed(const Duration(seconds: 1));

      // Create mock user progress
      final progress = UserProgressModel(
        userId: event.userId,
        currentStreak: 5,
        longestStreak: 12,
        totalXp: 750,
        level: 3,
        completedModules: [
          CompletedModuleModel(
            moduleId: 'module1',
            completedDate: DateTime.now().subtract(const Duration(days: 5)),
            score: 85,
            earnedXp: 85,
            completedTopicIds: ['topic1', 'topic2', 'topic3'],
          ),
          CompletedModuleModel(
            moduleId: 'module2',
            completedDate: DateTime.now().subtract(const Duration(days: 2)),
            score: 90,
            earnedXp: 135,
            completedTopicIds: ['topic4', 'topic5', 'topic6'],
          ),
        ],
        completedTests: [
          CompletedTestModel(
            testId: 'quiz1',
            completedDate: DateTime.now().subtract(const Duration(days: 4)),
            score: 80,
            earnedXp: 40,
            correctAnswers: 4,
            totalQuestions: 5,
            completionTime: const Duration(minutes: 3, seconds: 45),
          ),
          CompletedTestModel(
            testId: 'quiz2',
            completedDate: DateTime.now().subtract(const Duration(days: 1)),
            score: 100,
            earnedXp: 50,
            correctAnswers: 5,
            totalQuestions: 5,
            completionTime: const Duration(minutes: 2, seconds: 30),
          ),
        ],
        earnedBadges: ['badge1', 'badge2', 'badge3'],
        lastActivityDate: DateTime.now().subtract(const Duration(days: 1)),
      );

      // Create mock earned badges
      final earnedBadges = [
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
      ];

      emit(UserProgressLoaded(progress: progress, earnedBadges: earnedBadges));
    } catch (e) {
      emit(UserProgressError(message: e.toString()));
    }
  }

  Future<void> _onUpdateStreak(
    UpdateStreak event,
    Emitter<UserProgressState> emit,
  ) async {
    if (state is UserProgressLoaded) {
      final currentState = state as UserProgressLoaded;
      try {
        // In a real app, update streak in repository
        // final updatedProgress = await progressRepository.updateStreak(event.userId);

        // Mock implementation for now
        await Future.delayed(const Duration(seconds: 1));

        // Check if last activity was yesterday or today
        final now = DateTime.now();
        final lastActivity = currentState.progress.lastActivityDate;
        final difference = now.difference(lastActivity).inDays;

        bool streakMaintained = difference <= 1;
        bool newStreakRecord = false;

        // Update streak
        UserProgressModel updatedProgress;
        if (streakMaintained) {
          // If last activity was yesterday or today, increment streak
          final newStreak = currentState.progress.currentStreak + 1;
          final newRecord = newStreak > currentState.progress.longestStreak;

          updatedProgress = currentState.progress.copyWith(
            currentStreak: newStreak,
            longestStreak: newRecord
                ? newStreak
                : currentState.progress.longestStreak,
            lastActivityDate: now,
          );

          newStreakRecord = newRecord;
        } else {
          // If streak was broken, reset to 1
          updatedProgress = currentState.progress.copyWith(
            currentStreak: 1,
            lastActivityDate: now,
          );
        }

        emit(
          StreakUpdated(
            progress: updatedProgress,
            streakMaintained: streakMaintained,
            newStreakRecord: newStreakRecord,
          ),
        );
      } catch (e) {
        emit(UserProgressError(message: e.toString()));
      }
    }
  }

  Future<void> _onAddXp(AddXp event, Emitter<UserProgressState> emit) async {
    if (state is UserProgressLoaded) {
      final currentState = state as UserProgressLoaded;
      try {
        // In a real app, add XP in repository
        // final updatedProgress = await progressRepository.addXp(
        //   event.userId,
        //   event.xp,
        //   event.source,
        // );

        // Mock implementation for now
        await Future.delayed(const Duration(seconds: 1));

        // Calculate new total XP
        final newTotalXp = currentState.progress.totalXp + event.xp;

        // Calculate new level
        final oldLevel = currentState.progress.level;
        final newLevel = currentState.progress.calculateLevel(newTotalXp);
        final leveledUp = newLevel > oldLevel;

        // Update progress
        final updatedProgress = currentState.progress.copyWith(
          totalXp: newTotalXp,
          level: newLevel,
          lastActivityDate: DateTime.now(),
        );

        emit(
          XpAdded(
            progress: updatedProgress,
            addedXp: event.xp,
            leveledUp: leveledUp,
            newLevel: newLevel,
          ),
        );
      } catch (e) {
        emit(UserProgressError(message: e.toString()));
      }
    }
  }

  Future<void> _onUnlockBadge(
    UnlockBadge event,
    Emitter<UserProgressState> emit,
  ) async {
    if (state is UserProgressLoaded) {
      final currentState = state as UserProgressLoaded;
      try {
        // In a real app, unlock badge in repository
        // final badge = await badgeRepository.getBadgeById(event.badgeId);
        // final updatedProgress = await progressRepository.unlockBadge(
        //   event.userId,
        //   event.badgeId,
        // );

        // Mock implementation for now
        await Future.delayed(const Duration(seconds: 1));

        // Create mock badge
        final badge = BadgeModel(
          id: event.badgeId,
          title: 'Road Master',
          description: 'Complete 5 modules',
          iconAsset: 'assets/images/badges/road_master.png',
          type: BadgeType.completion,
          tier: BadgeTier.gold,
          unlockCriteria: 'Complete 5 modules',
          xpReward: 100,
        );

        // Update earned badges
        final updatedBadges = List<String>.from(
          currentState.progress.earnedBadges,
        );
        if (!updatedBadges.contains(event.badgeId)) {
          updatedBadges.add(event.badgeId);
        }

        // Update progress with new badge and XP
        final updatedProgress = currentState.progress.copyWith(
          earnedBadges: updatedBadges,
          totalXp: currentState.progress.totalXp + badge.xpReward,
          level: currentState.progress.calculateLevel(
            currentState.progress.totalXp + badge.xpReward,
          ),
        );

        emit(
          BadgeUnlocked(
            progress: updatedProgress,
            badge: badge,
            xpRewarded: badge.xpReward,
          ),
        );
      } catch (e) {
        emit(UserProgressError(message: e.toString()));
      }
    }
  }
}
