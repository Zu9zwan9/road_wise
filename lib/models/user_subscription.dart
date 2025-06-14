import 'package:isar/isar.dart';

part 'user_subscription.g.dart';

@collection
class UserSubscription {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  String? serial;

  @Index(unique: true)
  String? userId;

  String? stripeCustomerId;
  String? stripeSubscriptionId;
  String? stripePriceId;
  DateTime? stripeCurrentPeriodEnd;
}
