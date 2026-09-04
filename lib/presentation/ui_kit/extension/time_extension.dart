import 'package:intl/intl.dart';

extension TimeExtension on DateTime {
  String timeAgo({bool isUtc = false}) {
    final now = DateTime.now();
    final date = isUtc ? toLocal() : this;
    final difference = now.difference(date);

    if (difference.inSeconds < 5) {
      return 'just now';
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds} sec ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months month${months > 1 ? 's' : ''} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years year${years > 1 ? 's' : ''} ago';
    }
  }

  String toChatTime() {
    return DateFormat('hh:mm a').format(this);
  }

  bool isSameMinute(DateTime other) {
    return year == other.year && month == other.month && day == other.day && hour == other.hour && minute == other.minute;
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
