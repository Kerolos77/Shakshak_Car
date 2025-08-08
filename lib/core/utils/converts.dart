class Converts {
  static String timeAgoFromNow(String dateTimeString) {
    final inputTime = DateTime.parse(dateTimeString);
    final now = DateTime.now();
    final diff = now.difference(inputTime);
    final duration = diff.abs();

    String unit;
    int value;

    if (duration.inSeconds < 60) {
      value = (duration.inSeconds).ceil();
      unit = "second";
    } else if (duration.inMinutes < 60) {
      value = (duration.inMinutes).ceil();
      unit = "minute";
    } else if (duration.inHours < 24) {
      value = (duration.inHours).ceil();
      unit = "hour";
    } else if (duration.inDays < 7) {
      value = (duration.inDays).ceil();
      unit = "day";
    } else if (duration.inDays < 30) {
      value = (duration.inDays / 7).ceil();
      unit = "week";
    } else if (duration.inDays < 365) {
      value = (duration.inDays / 30).ceil();
      unit = "month";
    } else {
      value = (duration.inDays / 365).ceil();
      unit = "year";
    }

    final pluralUnit = value == 1 ? unit : '${unit}s';
    // return  "$value $pluralUnit";
    return  "${duration.inSeconds}";
  }

}