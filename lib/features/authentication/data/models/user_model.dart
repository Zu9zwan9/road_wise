import 'package:equatable/equatable.dart';

/// User model representing authenticated user data
class UserModel extends Equatable {
  final String id;
  final String email;
  final String displayName;
  final String selectedProvince;
  final DateTime createdAt;
  final DateTime lastLoginAt;
  final bool isPremium;

  const UserModel({
    required this.id,
    required this.email,
    required this.displayName,
    required this.selectedProvince,
    required this.createdAt,
    required this.lastLoginAt,
    this.isPremium = false,
  });

  /// Create a copy of this UserModel with the given fields replaced
  UserModel copyWith({
    String? id,
    String? email,
    String? displayName,
    String? selectedProvince,
    DateTime? createdAt,
    DateTime? lastLoginAt,
    bool? isPremium,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      selectedProvince: selectedProvince ?? this.selectedProvince,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      isPremium: isPremium ?? this.isPremium,
    );
  }

  /// Convert UserModel to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'selectedProvince': selectedProvince,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'lastLoginAt': lastLoginAt.millisecondsSinceEpoch,
      'isPremium': isPremium,
    };
  }

  /// Create UserModel from Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'] ?? '',
      selectedProvince: map['selectedProvince'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      lastLoginAt: DateTime.fromMillisecondsSinceEpoch(map['lastLoginAt']),
      isPremium: map['isPremium'] ?? false,
    );
  }

  /// Empty user model
  factory UserModel.empty() {
    return UserModel(
      id: '',
      email: '',
      displayName: '',
      selectedProvince: '',
      createdAt: DateTime.now(),
      lastLoginAt: DateTime.now(),
      isPremium: false,
    );
  }

  @override
  List<Object?> get props => [
    id,
    email,
    displayName,
    selectedProvince,
    createdAt,
    lastLoginAt,
    isPremium,
  ];
}
