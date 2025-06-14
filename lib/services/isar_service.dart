import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/challenge.dart';
import '../models/challenge_option.dart';
import '../models/challenge_progress.dart';
import '../models/course.dart';
import '../models/lesson.dart';
import '../models/unit.dart';
import '../models/user_progress.dart';
import '../models/user_subscription.dart';

class IsarService {
  static late Isar db;

  static Future<void> openDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    db = await Isar.open([
      CourseSchema,
      UnitSchema,
      LessonSchema,
      ChallengeSchema,
      ChallengeOptionSchema,
      ChallengeProgressSchema,
      UserProgressSchema,
      UserSubscriptionSchema,
    ], directory: dir.path);
  }
}
