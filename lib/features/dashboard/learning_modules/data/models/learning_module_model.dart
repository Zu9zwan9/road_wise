import 'package:equatable/equatable.dart';

/// Learning module model representing a collection of topics for learning traffic rules
class LearningModuleModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String provinceId;
  final int difficulty; // 1-5 scale
  final String iconAsset;
  final int xpReward;
  final bool isLocked;
  final String? unlockCriteria;
  final int estimatedMinutes;
  final List<String> topicIds; // References to topics within this module

  const LearningModuleModel({
    required this.id,
    required this.title,
    required this.description,
    required this.provinceId,
    required this.difficulty,
    required this.iconAsset,
    required this.xpReward,
    this.isLocked = false,
    this.unlockCriteria,
    required this.estimatedMinutes,
    required this.topicIds,
  });

  /// Create a copy of this LearningModuleModel with the given fields replaced
  LearningModuleModel copyWith({
    String? id,
    String? title,
    String? description,
    String? provinceId,
    int? difficulty,
    String? iconAsset,
    int? xpReward,
    bool? isLocked,
    String? unlockCriteria,
    int? estimatedMinutes,
    List<String>? topicIds,
  }) {
    return LearningModuleModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      provinceId: provinceId ?? this.provinceId,
      difficulty: difficulty ?? this.difficulty,
      iconAsset: iconAsset ?? this.iconAsset,
      xpReward: xpReward ?? this.xpReward,
      isLocked: isLocked ?? this.isLocked,
      unlockCriteria: unlockCriteria ?? this.unlockCriteria,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      topicIds: topicIds ?? this.topicIds,
    );
  }

  /// Convert LearningModuleModel to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'provinceId': provinceId,
      'difficulty': difficulty,
      'iconAsset': iconAsset,
      'xpReward': xpReward,
      'isLocked': isLocked,
      'unlockCriteria': unlockCriteria,
      'estimatedMinutes': estimatedMinutes,
      'topicIds': topicIds,
    };
  }

  /// Create LearningModuleModel from Map
  factory LearningModuleModel.fromMap(Map<String, dynamic> map) {
    return LearningModuleModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      provinceId: map['provinceId'] ?? '',
      difficulty: map['difficulty'] ?? 1,
      iconAsset: map['iconAsset'] ?? '',
      xpReward: map['xpReward'] ?? 0,
      isLocked: map['isLocked'] ?? false,
      unlockCriteria: map['unlockCriteria'],
      estimatedMinutes: map['estimatedMinutes'] ?? 0,
      topicIds: List<String>.from(map['topicIds'] ?? []),
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        provinceId,
        difficulty,
        iconAsset,
        xpReward,
        isLocked,
        unlockCriteria,
        estimatedMinutes,
        topicIds,
      ];
}
