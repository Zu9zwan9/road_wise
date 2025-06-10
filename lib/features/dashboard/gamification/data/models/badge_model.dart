import 'package:equatable/equatable.dart';

/// Badge model representing achievement badges that users can earn
class BadgeModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String iconAsset;
  final BadgeType type;
  final BadgeTier tier;
  final String unlockCriteria;
  final int xpReward;

  const BadgeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.iconAsset,
    required this.type,
    required this.tier,
    required this.unlockCriteria,
    required this.xpReward,
  });

  /// Create a copy of this BadgeModel with the given fields replaced
  BadgeModel copyWith({
    String? id,
    String? title,
    String? description,
    String? iconAsset,
    BadgeType? type,
    BadgeTier? tier,
    String? unlockCriteria,
    int? xpReward,
  }) {
    return BadgeModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      iconAsset: iconAsset ?? this.iconAsset,
      type: type ?? this.type,
      tier: tier ?? this.tier,
      unlockCriteria: unlockCriteria ?? this.unlockCriteria,
      xpReward: xpReward ?? this.xpReward,
    );
  }

  /// Convert BadgeModel to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'iconAsset': iconAsset,
      'type': type.toString(),
      'tier': tier.toString(),
      'unlockCriteria': unlockCriteria,
      'xpReward': xpReward,
    };
  }

  /// Create BadgeModel from Map
  factory BadgeModel.fromMap(Map<String, dynamic> map) {
    return BadgeModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      iconAsset: map['iconAsset'] ?? '',
      type: _badgeTypeFromString(map['type'] ?? ''),
      tier: _badgeTierFromString(map['tier'] ?? ''),
      unlockCriteria: map['unlockCriteria'] ?? '',
      xpReward: map['xpReward'] ?? 0,
    );
  }

  static BadgeType _badgeTypeFromString(String typeStr) {
    switch (typeStr) {
      case 'BadgeType.completion':
        return BadgeType.completion;
      case 'BadgeType.streak':
        return BadgeType.streak;
      case 'BadgeType.mastery':
        return BadgeType.mastery;
      case 'BadgeType.achievement':
        return BadgeType.achievement;
      case 'BadgeType.special':
        return BadgeType.special;
      default:
        return BadgeType.achievement;
    }
  }

  static BadgeTier _badgeTierFromString(String tierStr) {
    switch (tierStr) {
      case 'BadgeTier.bronze':
        return BadgeTier.bronze;
      case 'BadgeTier.silver':
        return BadgeTier.silver;
      case 'BadgeTier.gold':
        return BadgeTier.gold;
      case 'BadgeTier.platinum':
        return BadgeTier.platinum;
      default:
        return BadgeTier.bronze;
    }
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    iconAsset,
    type,
    tier,
    unlockCriteria,
    xpReward,
  ];
}

/// Badge types representing different categories of achievements
enum BadgeType {
  completion, // For completing modules or tests
  streak, // For maintaining daily streaks
  mastery, // For demonstrating expertise
  achievement, // For reaching milestones
  special, // For special events or promotions
}

/// Badge tiers representing different levels of achievement
enum BadgeTier { bronze, silver, gold, platinum }
