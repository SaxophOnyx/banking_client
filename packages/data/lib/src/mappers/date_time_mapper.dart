abstract class DateTimeMapper {
  static const int _msPerSecond = 1000;

  static DateTime fromEntity(int entity) {
    return DateTime.fromMillisecondsSinceEpoch(entity * _msPerSecond);
  }

  static int toEntity(DateTime date) {
    return date.millisecondsSinceEpoch ~/ _msPerSecond;
  }
}
