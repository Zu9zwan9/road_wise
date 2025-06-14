import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/course.dart';
import '../models/unit.dart';
import '../models/lesson.dart';
import '../models/challenge.dart';
import '../models/challenge_option.dart';
import '../models/challenge_progress.dart';
import '../models/user_progress.dart';
import '../models/user_subscription.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDatabase();
  }

  Future<Isar> openDatabase() async {
    final dir = await getApplicationDocumentsDirectory();

    return await Isar.open(
      [
        CourseSchema,
        UnitSchema,
        LessonSchema,
        ChallengeSchema,
        ChallengeOptionSchema,
        ChallengeProgressSchema,
        UserProgressSchema,
        UserSubscriptionSchema
      ],
      directory: dir.path,
    );
  }
}