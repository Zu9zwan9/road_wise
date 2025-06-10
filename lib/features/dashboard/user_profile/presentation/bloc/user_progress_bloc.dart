import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../user_profile/data/models/user_progress_model.dart';
import '../../../gamification/data/models/badge_model.dart';

// User Progress Events
abstract class UserProgressEvent extends Equatable {
  @override
  List<Object> get props => [];
}

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
  final String source;

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
abstract class UserProgressState extends Equatable {
  @override
  List<Object> get props => [];
}

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
class UserProgressBloc extends Bloc<UserProgressEvent, UserProgressState> {
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
      // Mock implementation
      await Future.delayed(const Duration(seconds: 1));
      final progress = UserProgressModel(
        userId: event.userId,
        currentStreak: 5,
        longestStreak: 12,
        totalXp: 750,
        level: 3,
        completedModules: [],
        completedTests: [],
        earnedBadges: [],
        lastActivityDate: DateTime.now(),
      );
      final earnedBadges = <BadgeModel>[];
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
        await Future.delayed(const Duration(seconds: 1));
        final now = DateTime.now();
        final lastActivity = currentState.progress.lastActivityDate;
        final difference = now.difference(lastActivity).inDays;
        bool streakMaintained = difference <= 1;
        bool newStreakRecord = false;
        UserProgressModel updatedProgress;
        if (streakMaintained) {
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
        await Future.delayed(const Duration(seconds: 1));
        final newTotalXp = currentState.progress.totalXp + event.xp;
        final oldLevel = currentState.progress.level;
        final newLevel = currentState.progress.calculateLevel(newTotalXp);
        final leveledUp = newLevel > oldLevel;
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
        await Future.delayed(const Duration(seconds: 1));
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
        final updatedBadges = List<String>.from(
          currentState.progress.earnedBadges,
        );
        if (!updatedBadges.contains(event.badgeId)) {
          updatedBadges.add(event.badgeId);
        }
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
