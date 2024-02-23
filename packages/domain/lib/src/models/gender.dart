import 'package:json_annotation/json_annotation.dart';

enum Gender {
  @JsonValue('Female')
  female,
  @JsonValue('Male')
  male,
  @JsonValue('Other')
  other,
}
