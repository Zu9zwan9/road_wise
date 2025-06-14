import 'package:isar/isar.dart';
import 'challenge.dart';

part 'challenge_progress.g.dart';

@collection
class ChallengeProgress {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? serial;

  String? userId;
  int? challengeId;
  bool? completed;

  final challenge = IsarLink<Challenge>();
}