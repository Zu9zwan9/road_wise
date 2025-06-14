import 'package:isar/isar.dart';
import 'unit.dart';
import 'challenge.dart';

part 'lesson.g.dart';

@collection
class Lesson {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? serial;

  String? title;
  int? unitId;
  int? order;

  final unit = IsarLink<Unit>();

  @Backlink(to: 'lesson')
  IsarLinks<Challenge> challenges = IsarLinks<Challenge>();
}