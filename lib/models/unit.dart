import 'package:isar/isar.dart';
import 'course.dart';
import 'lesson.dart';

part 'unit.g.dart';

@collection
class Unit {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? serial;

  String? title;
  String? description;
  int? courseId;
  int? order;

  final course = IsarLink<Course>();

  @Backlink(to: 'unit')
  IsarLinks<Lesson> lessons = IsarLinks<Lesson>();
}