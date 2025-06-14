import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {
  final Id id;

  @Index(unique: true)
  final String? uid; // Renamed from 'id' to 'uid' to avoid confusion

  final String? email;
  final String? name;
  final String? photoUrl;
  final int xp;
  final int currentStreak;
  final int longestStreak;
  final int hearts;
  final DateTime? lastActive;
  final bool isPremium;
  final List<String> completedLessons;
  final List<String> badges;
  final List<String> unlockedAchievements;

  const User({
    this.id = Isar.autoIncrement,
    this.uid,
    this.email,
    this.name,
    this.photoUrl,
    this.xp = 0,
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.hearts = 5,
    this.lastActive,
    this.isPremium = false,
    this.completedLessons = const [],
    this.badges = const [],
    this.unlockedAchievements = const [],
  });

  List<Object?> get props => [
    id,
    uid,
    email,
    name,
    photoUrl,
    xp,
    currentStreak,
    longestStreak,
    hearts,
    lastActive,
    isPremium,
    completedLessons,
    badges,
    unlockedAchievements,
  ];

  User copyWith({
    Id? id,
    String? uid,
    String? email,
    String? name,
    String? photoUrl,
    int? xp,
    int? currentStreak,
    int? longestStreak,
    int? hearts,
    DateTime? lastActive,
    bool? isPremium,
    List<String>? completedLessons,
    List<String>? badges,
    List<String>? unlockedAchievements,
  }) {
    return User(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      xp: xp ?? this.xp,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      hearts: hearts ?? this.hearts,
      lastActive: lastActive ?? this.lastActive,
      isPremium: isPremium ?? this.isPremium,
      completedLessons: completedLessons ?? this.completedLessons,
      badges: badges ?? this.badges,
      unlockedAchievements: unlockedAchievements ?? this.unlockedAchievements,
    );
  }

  // Add a heart (e.g., when watching an ad or purchasing)
  User addHeart() {
    return copyWith(hearts: hearts + 1);
  }

  // Remove a heart (e.g., when answering incorrectly)
  User removeHeart() {
    return copyWith(hearts: hearts > 0 ? hearts - 1 : 0);
  }

  // Add XP points (e.g., when completing a lesson)
  User addXp(int amount) {
    return copyWith(xp: xp + amount);
  }

  // Add a badge
  User addBadge(String badgeId) {
    if (badges.contains(badgeId)) return this;
    final newBadges = List<String>.from(badges)..add(badgeId);
    return copyWith(badges: newBadges);
  }

  // Mark a lesson as completed
  User completeLesson(String lessonId) {
    if (completedLessons.contains(lessonId)) return this;
    final newCompletedLessons = List<String>.from(completedLessons)
      ..add(lessonId);
    return copyWith(completedLessons: newCompletedLessons);
  }

  // Unlock an achievement
  User unlockAchievement(String achievementId) {
    if (unlockedAchievements.contains(achievementId)) return this;
    final newUnlockedAchievements = List<String>.from(unlockedAchievements)
      ..add(achievementId);
    return copyWith(unlockedAchievements: newUnlockedAchievements);
  }

  // Update streak based on current date
  User updateStreak(DateTime now) {
    if (lastActive == null) {
      return copyWith(currentStreak: 1, longestStreak: 1, lastActive: now);
    }

    final lastActiveDate = DateTime(
      lastActive!.year,
      lastActive!.month,
      lastActive!.day,
    );

    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    if (lastActiveDate == today) {
      // Already active today, no streak change
      return copyWith(lastActive: now);
    } else if (lastActiveDate == yesterday) {
      // Active yesterday, increment streak
      final newStreak = currentStreak + 1;
      return copyWith(
        currentStreak: newStreak,
        longestStreak: newStreak > longestStreak ? newStreak : longestStreak,
        lastActive: now,
      );
    } else {
      // Streak broken
      return copyWith(currentStreak: 1, lastActive: now);
    }
  }
}
