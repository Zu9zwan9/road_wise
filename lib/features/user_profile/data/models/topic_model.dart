import 'package:equatable/equatable.dart';

/// Topic model representing a specific learning topic within a module
class TopicModel extends Equatable {
  final String id;
  final String moduleId;
  final String title;
  final String content;
  final String? imageAsset;
  final int estimatedMinutes;
  final int xpReward;
  final List<String> quizIds; // References to quizzes for this topic

  const TopicModel({
    required this.id,
    required this.moduleId,
    required this.title,
    required this.content,
    this.imageAsset,
    required this.estimatedMinutes,
    required this.xpReward,
    required this.quizIds,
  });

  /// Create a copy of this TopicModel with the given fields replaced
  TopicModel copyWith({
    String? id,
    String? moduleId,
    String? title,
    String? content,
    String? imageAsset,
    int? estimatedMinutes,
    int? xpReward,
    List<String>? quizIds,
  }) {
    return TopicModel(
      id: id ?? this.id,
      moduleId: moduleId ?? this.moduleId,
      title: title ?? this.title,
      content: content ?? this.content,
      imageAsset: imageAsset ?? this.imageAsset,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      xpReward: xpReward ?? this.xpReward,
      quizIds: quizIds ?? this.quizIds,
    );
  }

  /// Convert TopicModel to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'moduleId': moduleId,
      'title': title,
      'content': content,
      'imageAsset': imageAsset,
      'estimatedMinutes': estimatedMinutes,
      'xpReward': xpReward,
      'quizIds': quizIds,
    };
  }

  /// Create TopicModel from Map
  factory TopicModel.fromMap(Map<String, dynamic> map) {
    return TopicModel(
      id: map['id'] ?? '',
      moduleId: map['moduleId'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      imageAsset: map['imageAsset'],
      estimatedMinutes: map['estimatedMinutes'] ?? 0,
      xpReward: map['xpReward'] ?? 0,
      quizIds: List<String>.from(map['quizIds'] ?? []),
    );
  }

  @override
  List<Object?> get props => [
    id,
    moduleId,
    title,
    content,
    imageAsset,
    estimatedMinutes,
    xpReward,
    quizIds,
  ];
}
