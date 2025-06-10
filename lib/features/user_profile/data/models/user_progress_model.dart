import 'dart:math' as math;

import 'package:equatable/equatable.dart';

/// UserProgress model representing a user's learning progress and achievements
class UserProgressModel extends Equatable {
  final String userId;
  final int currentStreak;
  final int longestStreak;
  final int totalXp;
  final int level;
  final List<CompletedModuleModel> completedModules;
  final List<CompletedTestModel> completedTests;
  final List<String> earnedBadges;
  final DateTime lastActivityDate;

  const UserProgressModel({
    required this.userId,
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.totalXp = 0,
    this.level = 1,
    this.completedModules = const [],
    this.completedTests = const [],
    this.earnedBadges = const [],
    required this.lastActivityDate,
  });

  /// Create a copy of this UserProgressModel with the given fields replaced
  UserProgressModel copyWith({
    String? userId,
    int? currentStreak,
    int? longestStreak,
    int? totalXp,
    int? level,
    List<CompletedModuleModel>? completedModules,
    List<CompletedTestModel>? completedTests,
    List<String>? earnedBadges,
    DateTime? lastActivityDate,
  }) {
    return UserProgressModel(
      userId: userId ?? this.userId,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      totalXp: totalXp ?? this.totalXp,
      level: level ?? this.level,
      completedModules: completedModules ?? this.completedModules,
      completedTests: completedTests ?? this.completedTests,
      earnedBadges: earnedBadges ?? this.earnedBadges,
      lastActivityDate: lastActivityDate ?? this.lastActivityDate,
    );
  }

  /// Convert UserProgressModel to Map
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'currentStreak': currentStreak,
      'longestStreak': longestStreak,
      'totalXp': totalXp,
      'level': level,
      'completedModules': completedModules.map((x) => x.toMap()).toList(),
      'completedTests': completedTests.map((x) => x.toMap()).toList(),
      'earnedBadges': earnedBadges,
      'lastActivityDate': lastActivityDate.millisecondsSinceEpoch,
    };
  }

  /// Create UserProgressModel from Map
  factory UserProgressModel.fromMap(Map<String, dynamic> map) {
    return UserProgressModel(
      userId: map['userId'] ?? '',
      currentStreak: map['currentStreak'] ?? 0,
      longestStreak: map['longestStreak'] ?? 0,
      totalXp: map['totalXp'] ?? 0,
      level: map['level'] ?? 1,
      completedModules: List<CompletedModuleModel>.from(
        map['completedModules']?.map((x) => CompletedModuleModel.fromMap(x)) ??
            [],
      ),
      completedTests: List<CompletedTestModel>.from(
        map['completedTests']?.map((x) => CompletedTestModel.fromMap(x)) ?? [],
      ),
      earnedBadges: List<String>.from(map['earnedBadges'] ?? []),
      lastActivityDate: DateTime.fromMillisecondsSinceEpoch(
        map['lastActivityDate'] ?? DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  /// Calculate current level based on XP
  int calculateLevel(int xp) {
    // Simple level calculation: level = sqrt(xp / 100) + 1
    return math.sqrt(xp / 100).floor() + 1;
  }

  /// Calculate XP needed for next level
  int xpForNextLevel() {
    return (level * level) * 100;
  }

  /// Calculate progress percentage to next level
  double levelProgress() {
    final int currentLevelXp = ((level - 1) * (level - 1)) * 100;
    final int nextLevelXp = xpForNextLevel();
    final int xpInCurrentLevel = totalXp - currentLevelXp;
    final int xpNeededForNextLevel = nextLevelXp - currentLevelXp;

    return xpInCurrentLevel / xpNeededForNextLevel;
  }

  /// Empty progress model
  factory UserProgressModel.empty(String userId) {
    return UserProgressModel(userId: userId, lastActivityDate: DateTime.now());
  }

  @override
  List<Object?> get props => [
    userId,
    currentStreak,
    longestStreak,
    totalXp,
    level,
    completedModules,
    completedTests,
    earnedBadges,
    lastActivityDate,
  ];
}

/// CompletedModule model representing a completed learning module
class CompletedModuleModel extends Equatable {
  final String moduleId;
  final DateTime completedDate;
  final int score; // Percentage score
  final int earnedXp;
  final List<String> completedTopicIds;

  const CompletedModuleModel({
    required this.moduleId,
    required this.completedDate,
    required this.score,
    required this.earnedXp,
    required this.completedTopicIds,
  });

  /// Create a copy of this CompletedModuleModel with the given fields replaced
  CompletedModuleModel copyWith({
    String? moduleId,
    DateTime? completedDate,
    int? score,
    int? earnedXp,
    List<String>? completedTopicIds,
  }) {
    return CompletedModuleModel(
      moduleId: moduleId ?? this.moduleId,
      completedDate: completedDate ?? this.completedDate,
      score: score ?? this.score,
      earnedXp: earnedXp ?? this.earnedXp,
      completedTopicIds: completedTopicIds ?? this.completedTopicIds,
    );
  }

  /// Convert CompletedModuleModel to Map
  Map<String, dynamic> toMap() {
    return {
      'moduleId': moduleId,
      'completedDate': completedDate.millisecondsSinceEpoch,
      'score': score,
      'earnedXp': earnedXp,
      'completedTopicIds': completedTopicIds,
    };
  }

  /// Create CompletedModuleModel from Map
  factory CompletedModuleModel.fromMap(Map<String, dynamic> map) {
    return CompletedModuleModel(
      moduleId: map['moduleId'] ?? '',
      completedDate: DateTime.fromMillisecondsSinceEpoch(map['completedDate']),
      score: map['score'] ?? 0,
      earnedXp: map['earnedXp'] ?? 0,
      completedTopicIds: List<String>.from(map['completedTopicIds'] ?? []),
    );
  }

  @override
  List<Object?> get props => [
    moduleId,
    completedDate,
    score,
    earnedXp,
    completedTopicIds,
  ];
}

/// CompletedTest model representing a completed practice test
class CompletedTestModel extends Equatable {
  final String testId;
  final DateTime completedDate;
  final int score; // Percentage score
  final int earnedXp;
  final int correctAnswers;
  final int totalQuestions;
  final Duration completionTime;

  const CompletedTestModel({
    required this.testId,
    required this.completedDate,
    required this.score,
    required this.earnedXp,
    required this.correctAnswers,
    required this.totalQuestions,
    required this.completionTime,
  });

  /// Create a copy of this CompletedTestModel with the given fields replaced
  CompletedTestModel copyWith({
    String? testId,
    DateTime? completedDate,
    int? score,
    int? earnedXp,
    int? correctAnswers,
    int? totalQuestions,
    Duration? completionTime,
  }) {
    return CompletedTestModel(
      testId: testId ?? this.testId,
      completedDate: completedDate ?? this.completedDate,
      score: score ?? this.score,
      earnedXp: earnedXp ?? this.earnedXp,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      completionTime: completionTime ?? this.completionTime,
    );
  }

  /// Convert CompletedTestModel to Map
  Map<String, dynamic> toMap() {
    return {
      'testId': testId,
      'completedDate': completedDate.millisecondsSinceEpoch,
      'score': score,
      'earnedXp': earnedXp,
      'correctAnswers': correctAnswers,
      'totalQuestions': totalQuestions,
      'completionTime': completionTime.inSeconds,
    };
  }

  /// Create CompletedTestModel from Map
  factory CompletedTestModel.fromMap(Map<String, dynamic> map) {
    return CompletedTestModel(
      testId: map['testId'] ?? '',
      completedDate: DateTime.fromMillisecondsSinceEpoch(map['completedDate']),
      score: map['score'] ?? 0,
      earnedXp: map['earnedXp'] ?? 0,
      correctAnswers: map['correctAnswers'] ?? 0,
      totalQuestions: map['totalQuestions'] ?? 0,
      completionTime: Duration(seconds: map['completionTime'] ?? 0),
    );
  }

  @override
  List<Object?> get props => [
    testId,
    completedDate,
    score,
    earnedXp,
    correctAnswers,
    totalQuestions,
    completionTime,
  ];
}
