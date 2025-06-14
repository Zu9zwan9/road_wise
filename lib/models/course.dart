import 'package:isar/isar.dart';
import 'unit.dart';

part 'course.g.dart';

@collection
class Course {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? serial;

  String? title;
  String? imageSrc;

  @Backlink(to: 'course')
  IsarLinks<Unit> units = IsarLinks<Unit>();
}
