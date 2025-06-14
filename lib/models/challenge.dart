import 'package:isar/isar.dart';
import 'lesson.dart';
import 'challenge_option.dart';
import 'challenge_progress.dart';

part 'challenge.g.dart';

@collection
class Challenge {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? serial;

  int? lessonId;

  @Enumerated(EnumType.name)
  ChallengesEnum? type;

  String? question;
  int? order;

  final lesson = IsarLink<Lesson>();

  @Backlink(to: 'challenge')
  IsarLinks<ChallengeOption> options = IsarLinks<ChallengeOption>();

  @Backlink(to: 'challenge')
  IsarLinks<ChallengeProgress> progress = IsarLinks<ChallengeProgress>();
}

enum ChallengesEnum {
  multipleChoice,
  fillBlank,
  matching,
  // добавьте другие типы испытаний по необходимости
}
