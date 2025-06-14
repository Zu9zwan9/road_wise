import 'package:isar/isar.dart';
import 'challenge.dart';

part 'challenge_option.g.dart';

@collection
class ChallengeOption {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? serial;

  int? challengeId;
  String? text;
  bool? correct;
  String? imageSrc;
  String? audioSrc;

  final challenge = IsarLink<Challenge>();
}