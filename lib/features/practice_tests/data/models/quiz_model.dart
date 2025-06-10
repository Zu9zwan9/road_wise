import 'package:equatable/equatable.dart';

/// Quiz model representing a quiz for testing knowledge on traffic rules
class QuizModel extends Equatable {
  final String id;
  final String topicId;
  final String title;
  final String description;
  final int passingScore; // Percentage required to pass (e.g., 80)
  final int xpReward;
  final List<String> questionIds; // References to questions in this quiz

  const QuizModel({
    required this.id,
    required this.topicId,
    required this.title,
    required this.description,
    required this.passingScore,
    required this.xpReward,
    required this.questionIds,
  });

  /// Create a copy of this QuizModel with the given fields replaced
  QuizModel copyWith({
    String? id,
    String? topicId,
    String? title,
    String? description,
    int? passingScore,
    int? xpReward,
    List<String>? questionIds,
  }) {
    return QuizModel(
      id: id ?? this.id,
      topicId: topicId ?? this.topicId,
      title: title ?? this.title,
      description: description ?? this.description,
      passingScore: passingScore ?? this.passingScore,
      xpReward: xpReward ?? this.xpReward,
      questionIds: questionIds ?? this.questionIds,
    );
  }

  /// Convert QuizModel to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'topicId': topicId,
      'title': title,
      'description': description,
      'passingScore': passingScore,
      'xpReward': xpReward,
      'questionIds': questionIds,
    };
  }

  /// Create QuizModel from Map
  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id'] ?? '',
      topicId: map['topicId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      passingScore: map['passingScore'] ?? 80,
      xpReward: map['xpReward'] ?? 0,
      questionIds: List<String>.from(map['questionIds'] ?? []),
    );
  }

  @override
  List<Object?> get props => [
    id,
    topicId,
    title,
    description,
    passingScore,
    xpReward,
    questionIds,
  ];
}
