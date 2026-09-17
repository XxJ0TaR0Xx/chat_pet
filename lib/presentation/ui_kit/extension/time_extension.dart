import 'package:chat_pet/core/localization/l10n.dart';
import 'package:intl/intl.dart';

extension TimeExtension on DateTime {
  String timeAgo({bool isUtc = false}) {
    final now = DateTime.now();
    final date = isUtc ? toLocal() : this;
    final difference = now.difference(date);

    if (difference.inSeconds < 5) {
      return S.current.JustNow;
    } else if (difference.inSeconds < 60) {
      return S.current.SecondsAgo(difference.inSeconds);
    } else if (difference.inMinutes < 60) {
      return S.current.MinutesAgo(difference.inMinutes);
    } else if (difference.inHours < 24) {
      return S.current.HoursAgo(difference.inHours);
    } else if (difference.inDays < 30) {
      return S.current.DaysAgo(difference.inDays);
    } else if (difference.inDays < 365) {
      return S.current.MonthsAgo((difference.inDays / 30).floor());
    } else {
      return S.current.YearsAgo((difference.inDays / 365).floor());
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
