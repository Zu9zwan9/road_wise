import 'package:equatable/equatable.dart';

/// Question model representing a quiz question with multiple choice options
class QuestionModel extends Equatable {
  final String id;
  final String quizId;
  final String text;
  final List<String> options;
  final int correctOptionIndex;
  final String explanation;
  final String? imageAsset;

  const QuestionModel({
    required this.id,
    required this.quizId,
    required this.text,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
    this.imageAsset,
  });

  /// Create a copy of this QuestionModel with the given fields replaced
  QuestionModel copyWith({
    String? id,
    String? quizId,
    String? text,
    List<String>? options,
    int? correctOptionIndex,
    String? explanation,
    String? imageAsset,
  }) {
    return QuestionModel(
      id: id ?? this.id,
      quizId: quizId ?? this.quizId,
      text: text ?? this.text,
      options: options ?? this.options,
      correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
      explanation: explanation ?? this.explanation,
      imageAsset: imageAsset ?? this.imageAsset,
    );
  }

  /// Convert QuestionModel to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quizId': quizId,
      'text': text,
      'options': options,
      'correctOptionIndex': correctOptionIndex,
      'explanation': explanation,
      'imageAsset': imageAsset,
    };
  }

  /// Create QuestionModel from Map
  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'] ?? '',
      quizId: map['quizId'] ?? '',
      text: map['text'] ?? '',
      options: List<String>.from(map['options'] ?? []),
      correctOptionIndex: map['correctOptionIndex'] ?? 0,
      explanation: map['explanation'] ?? '',
      imageAsset: map['imageAsset'],
    );
  }

  @override
  List<Object?> get props => [
    id,
    quizId,
    text,
    options,
    correctOptionIndex,
    explanation,
    imageAsset,
  ];
}
