import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String? displayName;
  final String? photoUrl;
  final bool isEmailVerified;
  final DateTime createdAt;
  final DateTime? lastLoginAt;
  final int points;
  final int level;
  final List<String> completedLessons;
  final bool isPremium;

  const User({
    required this.id,
    required this.email,
    this.displayName,
    this.photoUrl,
    required this.isEmailVerified,
    required this.createdAt,
    this.lastLoginAt,
    this.points = 0,
    this.level = 1,
    this.completedLessons = const [],
    this.isPremium = false,
  });

  User copyWith({
    String? id,
    String? email,
    String? displayName,
    String? photoUrl,
    bool? isEmailVerified,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    int? points,
    int? level,
    List<String>? completedLessons,
    bool? isPremium,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      points: points ?? this.points,
      level: level ?? this.level,
      completedLessons: completedLessons ?? this.completedLessons,
      isPremium: isPremium ?? this.isPremium,
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        displayName,
        photoUrl,
        isEmailVerified,
        createdAt,
        lastLoginAt,
        points,
        level,
        completedLessons,
        isPremium,
      ];
}
