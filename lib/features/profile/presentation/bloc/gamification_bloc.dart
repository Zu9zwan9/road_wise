import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/base_bloc.dart';

// Events
abstract class GamificationEvent extends BaseEvent {
  const GamificationEvent();
}

class LoadAchievements extends GamificationEvent {
  final String userId;

  const LoadAchievements({required this.userId});

  @override
  List<Object> get props => [userId];
}

class UnlockAchievement extends GamificationEvent {
  final String achievementId;

  const UnlockAchievement({required this.achievementId});

  @override
  List<Object> get props => [achievementId];
}

class AddXp extends GamificationEvent {
  final int amount;

  const AddXp({required this.amount});

  @override
  List<Object> get props => [amount];
}

class UpdateStreak extends GamificationEvent {
  final int streakDays;

  const UpdateStreak({required this.streakDays});

  @override
  List<Object> get props => [streakDays];
}

// States
abstract class GamificationState extends BaseState {
  const GamificationState();
}

class GamificationInitial extends GamificationState {
  const GamificationInitial();
}

class GamificationLoading extends GamificationState {
  const GamificationLoading();
}

class GamificationLoaded extends GamificationState {
  final List<Map<String, dynamic>> achievements;
  final List<String> unlockedAchievements;
  final List<String> badges;
  final int totalXp;
  final int level;
  final int streak;

  const GamificationLoaded({
    required this.achievements,
    this.unlockedAchievements = const [],
    this.badges = const [],
    this.totalXp = 0,
    this.level = 1,
    this.streak = 0,
  });

  @override
  List<Object> get props => [
    achievements,
    unlockedAchievements,
    badges,
    totalXp,
    level,
    streak,
  ];

  GamificationLoaded copyWith({
    List<Map<String, dynamic>>? achievements,
    List<String>? unlockedAchievements,
    List<String>? badges,
    int? totalXp,
    int? level,
    int? streak,
  }) {
    return GamificationLoaded(
      achievements: achievements ?? this.achievements,
      unlockedAchievements: unlockedAchievements ?? this.unlockedAchievements,
      badges: badges ?? this.badges,
      totalXp: totalXp ?? this.totalXp,
      level: level ?? this.level,
      streak: streak ?? this.streak,
    );
  }
}

class AchievementUnlocked extends GamificationState {
  final Map<String, dynamic> achievement;
  final int xpEarned;

  const AchievementUnlocked({required this.achievement, this.xpEarned = 50});

  @override
  List<Object> get props => [achievement, xpEarned];
}

class BadgeEarned extends GamificationState {
  final Map<String, dynamic> badge;

  const BadgeEarned({required this.badge});

  @override
  List<Object> get props => [badge];
}

class LevelUp extends GamificationState {
  final int newLevel;
  final int xpToNextLevel;

  const LevelUp({required this.newLevel, required this.xpToNextLevel});

  @override
  List<Object> get props => [newLevel, xpToNextLevel];
}

class GamificationError extends GamificationState {
  final String message;

  const GamificationError({required this.message});

  @override
  List<Object> get props => [message];
}

// BLoC
class GamificationBloc extends BaseBloc<GamificationEvent, GamificationState> {
  // Mock data
  final List<Map<String, dynamic>> _mockAchievements = [
    {
      'id': 'first_lesson',
      'title': 'First Steps',
      'description': 'Complete your first lesson',
      'xpReward': 50,
      'badgeId': 'beginner',
      'condition': {'type': 'lesson_completed', 'count': 1},
    },
    {
      'id': 'five_lessons',
      'title': 'Getting Started',
      'description': 'Complete 5 lessons',
      'xpReward': 100,
      'badgeId': 'student',
      'condition': {'type': 'lesson_completed', 'count': 5},
    },
    {
      'id': 'streak_3',
      'title': 'Consistency',
      'description': 'Maintain a 3-day streak',
      'xpReward': 75,
      'badgeId': 'consistent',
      'condition': {'type': 'streak', 'days': 3},
    },
    {
      'id': 'streak_7',
      'title': 'Weekly Warrior',
      'description': 'Maintain a 7-day streak',
      'xpReward': 150,
      'badgeId': 'warrior',
      'condition': {'type': 'streak', 'days': 7},
    },
    {
      'id': 'perfect_quiz',
      'title': 'Perfect Score',
      'description': 'Get 100% on a quiz',
      'xpReward': 100,
      'badgeId': 'quiz_master',
      'condition': {'type': 'quiz_score', 'percentage': 100},
    },
  ];

  final List<Map<String, dynamic>> _mockBadges = [
    {
      'id': 'beginner',
      'title': 'Beginner',
      'description': 'You took your first steps in learning',
      'imagePath': 'assets/images/badges/beginner.png',
    },
    {
      'id': 'student',
      'title': 'Dedicated Student',
      'description': 'You completed 5 lessons',
      'imagePath': 'assets/images/badges/student.png',
    },
    {
      'id': 'consistent',
      'title': 'Consistent Learner',
      'description': 'You maintained a 3-day streak',
      'imagePath': 'assets/images/badges/consistent.png',
    },
    {
      'id': 'warrior',
      'title': 'Weekly Warrior',
      'description': 'You maintained a 7-day streak',
      'imagePath': 'assets/images/badges/warrior.png',
    },
    {
      'id': 'quiz_master',
      'title': 'Quiz Master',
      'description': 'You got a perfect score on a quiz',
      'imagePath': 'assets/images/badges/quiz_master.png',
    },
  ];

  // Helper function to calculate level based on XP
  int _calculateLevel(int xp) {
    // Simple formula: each level requires 100 + (level * 50) XP
    int level = 1;
    int xpRequired = 100;

    while (xp >= xpRequired) {
      xp -= xpRequired;
      level++;
      xpRequired = 100 + (level * 50);
    }

    return level;
  }

  // Helper function to calculate XP needed for next level
  int _xpToNextLevel(int totalXp) {
    int level = _calculateLevel(totalXp);
    int xpForCurrentLevel = 0;

    // Calculate XP already earned towards current level
    for (int i = 1; i < level; i++) {
      xpForCurrentLevel += 100 + (i * 50);
    }

    int xpInCurrentLevel = totalXp - xpForCurrentLevel;
    int xpRequiredForLevel = 100 + (level * 50);

    return xpRequiredForLevel - xpInCurrentLevel;
  }

  GamificationBloc() : super(const GamificationInitial()) {
    on<LoadAchievements>(_onLoadAchievements);
    on<UnlockAchievement>(_onUnlockAchievement);
    on<AddXp>(_onAddXp);
    on<UpdateStreak>(_onUpdateStreak);
  }

  void _onLoadAchievements(
    LoadAchievements event,
    Emitter<GamificationState> emit,
  ) async {
    emit(const GamificationLoading());
    try {
      // In a real app, you would fetch this data from a repository
      await Future.delayed(const Duration(milliseconds: 500));

      // Mock data for demonstration
      emit(
        GamificationLoaded(
          achievements: _mockAchievements,
          unlockedAchievements: ['first_lesson'],
          badges: ['beginner'],
          totalXp: 120,
          level: 2,
          streak: 3,
        ),
      );
    } catch (e) {
      emit(GamificationError(message: e.toString()));
    }
  }

  void _onUnlockAchievement(
    UnlockAchievement event,
    Emitter<GamificationState> emit,
  ) {
    final currentState = state;
    if (currentState is GamificationLoaded) {
      // Check if achievement is already unlocked
      if (currentState.unlockedAchievements.contains(event.achievementId)) {
        return;
      }

      // Find the achievement
      final achievement = _mockAchievements.firstWhere(
        (a) => a['id'] == event.achievementId,
        orElse: () => throw Exception('Achievement not found'),
      );

      // Find the badge if there's one associated with this achievement
      Map<String, dynamic>? badge;
      if (achievement['badgeId'] != null) {
        badge = _mockBadges.firstWhere(
          (b) => b['id'] == achievement['badgeId'],
          orElse: () => throw Exception('Badge not found'),
        );
      }

      // Update achievements list
      final newUnlockedAchievements = List<String>.from(
        currentState.unlockedAchievements,
      )..add(event.achievementId);

      // Update badges list if applicable
      List<String>? newBadges;
      if (badge != null && !currentState.badges.contains(badge['id'])) {
        newBadges = List<String>.from(currentState.badges)..add(badge['id']);
        emit(BadgeEarned(badge: badge));
      }

      // Add XP
      final xpReward = achievement['xpReward'] as int? ?? 0;
      final newTotalXp = currentState.totalXp + xpReward;

      // Check for level up
      final currentLevel = currentState.level;
      final newLevel = _calculateLevel(newTotalXp);

      if (newLevel > currentLevel) {
        emit(
          LevelUp(
            newLevel: newLevel,
            xpToNextLevel: _xpToNextLevel(newTotalXp),
          ),
        );
      }

      // Emit achievement unlocked state
      emit(AchievementUnlocked(achievement: achievement, xpEarned: xpReward));

      // Update the main state
      emit(
        currentState.copyWith(
          unlockedAchievements: newUnlockedAchievements,
          badges: newBadges,
          totalXp: newTotalXp,
          level: newLevel,
        ),
      );
    }
  }

  void _onAddXp(AddXp event, Emitter<GamificationState> emit) {
    final currentState = state;
    if (currentState is GamificationLoaded) {
      final newTotalXp = currentState.totalXp + event.amount;

      // Check for level up
      final currentLevel = currentState.level;
      final newLevel = _calculateLevel(newTotalXp);

      if (newLevel > currentLevel) {
        emit(
          LevelUp(
            newLevel: newLevel,
            xpToNextLevel: _xpToNextLevel(newTotalXp),
          ),
        );
      }

      // Update the main state
      emit(currentState.copyWith(totalXp: newTotalXp, level: newLevel));
    }
  }

  void _onUpdateStreak(UpdateStreak event, Emitter<GamificationState> emit) {
    final currentState = state;
    if (currentState is GamificationLoaded) {
      // Check if streak-based achievements should be unlocked
      final streakAchievements = _mockAchievements
          .where(
            (a) =>
                a['condition']['type'] == 'streak' &&
                a['condition']['days'] <= event.streakDays &&
                !currentState.unlockedAchievements.contains(a['id']),
          )
          .toList();

      // Update streak
      emit(currentState.copyWith(streak: event.streakDays));

      // Unlock any relevant achievements
      for (final achievement in streakAchievements) {
        add(UnlockAchievement(achievementId: achievement['id']));
      }
    }
  }
}
