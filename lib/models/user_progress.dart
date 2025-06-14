import 'package:isar/isar.dart';

import 'course.dart';

part 'user_progress.g.dart';

@collection
class UserProgress {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? userId;

  String? userName;
  String? userImageSrc;
  int? activeCourseId;
  int? hearts;
  int? points;

  final activeCourse = IsarLink<Course>();
}
