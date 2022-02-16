import 'package:timeago/timeago.dart' as timeago;

class TimeAgo {
  static String getTimeAgo(String date) {
    final _providedDate = DateTime.parse(date);
    final _currentDate = DateTime.now();
    final _difference = _currentDate.difference(_providedDate);
    final _differenceDate =
        _currentDate.subtract(Duration(minutes: _difference.inMinutes));
    return timeago.format(_differenceDate);
  }
}
