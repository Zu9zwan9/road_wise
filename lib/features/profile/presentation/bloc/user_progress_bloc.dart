import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/base_bloc.dart';

// Events
abstract class UserProgressEvent extends BaseEvent {
  const UserProgressEvent();
}

class LoadUserProgress extends UserProgressEvent {
  final String userId;

  const LoadUserProgress({required this.userId});

  @override
  List<Object> get props => [userId];
}

class UpdateLessonProgress extends UserProgressEvent {
  final String lessonId;
  final double progress;

  const UpdateLessonProgress({required this.lessonId, required this.progress});

  @override
  List<Object> get props => [lessonId, progress];
}

class CompleteLesson extends UserProgressEvent {
  final String lessonId;
  final int earnedXp;

  const CompleteLesson({required this.lessonId, this.earnedXp = 10});

  @override
  List<Object> get props => [lessonId, earnedXp];
}

class UpdateDailyStreak extends UserProgressEvent {
  const UpdateDailyStreak();
}

// States
abstract class UserProgressState extends BaseState {
  const UserProgressState();
}

class UserProgressInitial extends UserProgressState {
  const UserProgressInitial();
}

class UserProgressLoading extends UserProgressState {
  const UserProgressLoading();
}

class UserProgressLoaded extends UserProgressState {
  final String userId;
  final String? userName;
  final String? userImageSrc;
  final int hearts;
  final int xp;
  final int currentStreak;
  final int longestStreak;
  final Map<String, double> lessonProgress;
  final Map<String, bool> completedLessons;
  final List<String> earnedBadges;

  const UserProgressLoaded({
    required this.userId,
    this.userName,
    this.userImageSrc,
    this.hearts = 5,
    this.xp = 0,
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.lessonProgress = const {},
    this.completedLessons = const {},
    this.earnedBadges = const [],
  });

  @override
  List<Object?> get props => [
    userId,
    userName,
    userImageSrc,
    hearts,
    xp,
    currentStreak,
    longestStreak,
    lessonProgress,
    completedLessons,
    earnedBadges,
  ];

  UserProgressLoaded copyWith({
    String? userId,
    String? userName,
    String? userImageSrc,
    int? hearts,
    int? xp,
    int? currentStreak,
    int? longestStreak,
    Map<String, double>? lessonProgress,
    Map<String, bool>? completedLessons,
    List<String>? earnedBadges,
  }) {
    return UserProgressLoaded(
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      userImageSrc: userImageSrc ?? this.userImageSrc,
      hearts: hearts ?? this.hearts,
      xp: xp ?? this.xp,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      lessonProgress: lessonProgress ?? this.lessonProgress,
      completedLessons: completedLessons ?? this.completedLessons,
      earnedBadges: earnedBadges ?? this.earnedBadges,
    );
  }
}

class UserProgressError extends UserProgressState {
  final String message;

  const UserProgressError({required this.message});

  @override
  List<Object> get props => [message];
}

// BLoC
class UserProgressBloc extends BaseBloc<UserProgressEvent, UserProgressState> {
  UserProgressBloc() : super(const UserProgressInitial()) {
    on<LoadUserProgress>(_onLoadUserProgress);
    on<UpdateLessonProgress>(_onUpdateLessonProgress);
    on<CompleteLesson>(_onCompleteLesson);
    on<UpdateDailyStreak>(_onUpdateDailyStreak);
  }

  void _onLoadUserProgress(
    LoadUserProgress event,
    Emitter<UserProgressState> emit,
  ) async {
    emit(const UserProgressLoading());
    try {
      // In a real app, this would fetch user progress from a repository
      await Future.delayed(const Duration(milliseconds: 500));

      // Mock data for demonstration
      emit(
        UserProgressLoaded(
          userId: event.userId,
          userName: 'Test User',
          userImageSrc: 'assets/images/avatar.png',
          hearts: 5,
          xp: 120,
          currentStreak: 3,
          longestStreak: 5,
          lessonProgress: {'lesson1': 100.0, 'lesson2': 75.0, 'lesson3': 30.0},
          completedLessons: {'lesson1': true},
          earnedBadges: ['beginner', 'streak_3'],
        ),
      );
    } catch (e) {
      emit(UserProgressError(message: e.toString()));
    }
  }

  void _onUpdateLessonProgress(
    UpdateLessonProgress event,
    Emitter<UserProgressState> emit,
  ) {
    final currentState = state;
    if (currentState is UserProgressLoaded) {
      // Update the lesson progress
      final updatedProgress = Map<String, double>.from(
        currentState.lessonProgress,
      );
      updatedProgress[event.lessonId] = event.progress;

      // Mark as completed if progress is 100%
      Map<String, bool>? updatedCompletedLessons;
      if (event.progress >= 100) {
        updatedCompletedLessons = Map<String, bool>.from(
          currentState.completedLessons,
        );
        updatedCompletedLessons[event.lessonId] = true;
      }

      emit(
        currentState.copyWith(
          lessonProgress: updatedProgress,
          completedLessons: updatedCompletedLessons,
        ),
      );
    }
  }

  void _onCompleteLesson(
    CompleteLesson event,
    Emitter<UserProgressState> emit,
  ) {
    final currentState = state;
    if (currentState is UserProgressLoaded) {
      // Update progress to 100%
      final updatedProgress = Map<String, double>.from(
        currentState.lessonProgress,
      );
      updatedProgress[event.lessonId] = 100.0;

      // Mark lesson as completed
      final updatedCompletedLessons = Map<String, bool>.from(
        currentState.completedLessons,
      );
      updatedCompletedLessons[event.lessonId] = true;

      // Increase XP
      final newXp = currentState.xp + event.earnedXp;

      emit(
        currentState.copyWith(
          lessonProgress: updatedProgress,
          completedLessons: updatedCompletedLessons,
          xp: newXp,
        ),
      );
    }
  }

  void _onUpdateDailyStreak(
    UpdateDailyStreak event,
    Emitter<UserProgressState> emit,
  ) {
    final currentState = state;
    if (currentState is UserProgressLoaded) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);

      // In a real app, you would track the last active date in a database
      // For this example, we'll just increment the streak
      final newStreak = currentState.currentStreak + 1;
      final newLongestStreak = newStreak > currentState.longestStreak
          ? newStreak
          : currentState.longestStreak;

      emit(
        currentState.copyWith(
          currentStreak: newStreak,
          longestStreak: newLongestStreak,
        ),
      );
    }
  }
}
