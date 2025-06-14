import 'package:isar/isar.dart';

part 'offline_package.g.dart';

@collection
class OfflinePackage {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  final String? serial;

  final String? userId;
  final String? title;
  final String? description;
  final List<String>? lessonIds;
  final DateTime? downloadDate;
  final int sizeInKb;
  final bool isDownloaded;
  final double downloadProgress;
  final DateTime? expiryDate;

  OfflinePackage({
    this.id = Isar.autoIncrement,
    this.serial,
    this.userId,
    this.title,
    this.description,
    List<String>? lessonIds,
    DateTime? downloadDate,
    this.sizeInKb = 0,
    this.isDownloaded = false,
    this.downloadProgress = 0.0,
    this.expiryDate,
  }) : lessonIds = lessonIds ?? [],
       downloadDate = downloadDate ?? DateTime.now();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OfflinePackage &&
        other.id == id &&
        other.serial == serial &&
        other.userId == userId &&
        other.title == title &&
        other.description == description &&
        other.lessonIds == lessonIds &&
        other.downloadDate == downloadDate &&
        other.sizeInKb == sizeInKb &&
        other.isDownloaded == isDownloaded &&
        other.downloadProgress == downloadProgress &&
        other.expiryDate == expiryDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        serial.hashCode ^
        userId.hashCode ^
        title.hashCode ^
        description.hashCode ^
        lessonIds.hashCode ^
        downloadDate.hashCode ^
        sizeInKb.hashCode ^
        isDownloaded.hashCode ^
        downloadProgress.hashCode ^
        expiryDate.hashCode;
  }

  // Update download progress
  OfflinePackage updateProgress(double progress) {
    final bool completed = progress >= 100.0;
    return copyWith(
      downloadProgress: progress,
      isDownloaded: completed ? true : isDownloaded,
    );
  }

  // Mark as downloaded
  OfflinePackage markAsDownloaded() {
    return copyWith(isDownloaded: true, downloadProgress: 100.0);
  }

  // Check if package has expired
  bool get hasExpired =>
      expiryDate != null && expiryDate!.isBefore(DateTime.now());

  // Get formatted size
  String get formattedSize {
    if (sizeInKb < 1024) {
      return '$sizeInKb KB';
    } else if (sizeInKb < 1024 * 1024) {
      final mb = (sizeInKb / 1024).toStringAsFixed(1);
      return '$mb MB';
    } else {
      final gb = (sizeInKb / (1024 * 1024)).toStringAsFixed(2);
      return '$gb GB';
    }
  }

  // Get formatted download date
  String get formattedDownloadDate {
    return '${downloadDate!.day}/${downloadDate!.month}/${downloadDate!.year}';
  }

  // Get number of lessons in package
  int get lessonCount => lessonIds!.length;

  OfflinePackage copyWith({
    Id? id,
    String? serial,
    String? userId,
    String? title,
    String? description,
    List<String>? lessonIds,
    DateTime? downloadDate,
    int? sizeInKb,
    bool? isDownloaded,
    double? downloadProgress,
    DateTime? expiryDate,
  }) {
    return OfflinePackage(
      id: id ?? this.id,
      serial: serial ?? this.serial,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      lessonIds: lessonIds ?? this.lessonIds,
      downloadDate: downloadDate ?? this.downloadDate,
      sizeInKb: sizeInKb ?? this.sizeInKb,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      downloadProgress: downloadProgress ?? this.downloadProgress,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }
}
