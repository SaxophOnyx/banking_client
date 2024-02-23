import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter extends JsonConverter<DateTime, int> {
  static const int msPerSecond = 1000;

  const DateTimeConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json ~/ msPerSecond);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch ~/ msPerSecond;
}
